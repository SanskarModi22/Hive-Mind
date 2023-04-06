import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/constants/constants.dart';
import 'package:reddit_clone/core/failure.dart';
import 'package:reddit_clone/core/providers/storage_repository_provider.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/features/community/repository/community_repository.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/utils.dart';
import '../../../models/community_model.dart';

final userCommunityStreamProvider = StreamProvider<List<Community>>((ref) {
  final controllerProvider = ref.read(communityControllerProvider.notifier);

  return controllerProvider.getUserCommunties();
});
final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  return CommunityController(
      communityRepository: ref.read(communityRepositoryProvider),
      ref: ref,
      storageRepositoryProvider: ref.watch(storageRepositoryProvider));
});
final getCommunityByNameProvider = StreamProvider.family((ref, String name) {
  return ref
      .watch(communityControllerProvider.notifier)
      .getCommunityByName(name);
});
final searchCommunityProvider = StreamProvider.family((ref, String query) {
  return ref.watch(communityControllerProvider.notifier).searchCommunity(query);
});

class CommunityController extends StateNotifier<bool> {
  final CommunityRepository _communityRepository;
  final Ref _ref;
  final StorageRepositoryProvider _storageRepositoryProvider;
  CommunityController(
      {required StorageRepositoryProvider storageRepositoryProvider,
      required CommunityRepository communityRepository,
      required Ref ref})
      : _ref = ref,
        _communityRepository = communityRepository,
        _storageRepositoryProvider = storageRepositoryProvider,
        super(false);

  void createCommunity(String name, BuildContext context) async {
    state = true; //loading is set to true
    final uid = _ref.read(userProvider)?.uid ?? '';
    //Uid of the user is there or not (whether user is logged in or not)
    Community community = Community(
      id: name,
      name: name,
      banner: Constants.bannerDefault,
      avatar: Constants.avatarDefault,
      members: [
        uid
      ], //Whatever members are there will be stored in the form of list
      mods: [uid], //UID of moderators
    );
    final res = await _communityRepository.createCommunity(community);
    state = false; //loading is set to false
    res.fold((l) => showSnackBar(context: context, message: l.message), (r) {
      showSnackBar(context: context, message: 'Community created successfully');
      Routemaster.of(context).pop();
    });
  }

  void joinCommunity(Community community, BuildContext context) async {
    final user = _ref.read(userProvider)!;
    Either<Failure, void> res;
    if (community.members.contains(user.uid)) {
      res = await _communityRepository.leaveCommunity(community.name, user.uid);
    } else {
      res = await _communityRepository.joinCommunity(community.name, user.uid);
    }
    res.fold((l) => showSnackBar(context: context, message: l.message), (r) {
      if (community.members.contains(user.uid)) {
        showSnackBar(context: context, message: 'Community Left Successfully');
      } else {
        showSnackBar(
            context: context, message: 'Community Joined Successfully');
      }
    });
  }

  void addMods(
      String communityName, List<String> uids, BuildContext context) async {
    final res = await _communityRepository.addMods(communityName, uids);
    res.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (r) => Routemaster.of(context).pop(),
    );
  }

  void editCommunity({
    required Community community,
    required File? profileFile,
    required File? bannerFile,
    required BuildContext context,
  }) async {
    state = true;
    if (profileFile != null) {
      final res = await _storageRepositoryProvider.storeFile(
        path: 'communities/profile',
        id: community.name,
        file: profileFile,
      );
      res.fold(
        (l) => showSnackBar(context: context, message: l.message),
        (r) => community = community.copyWith(avatar: r),
      );
    }
    if (bannerFile != null) {
      final res = await _storageRepositoryProvider.storeFile(
        path: 'communities/profile',
        id: community.name,
        file: bannerFile,
      );
      res.fold(
        (l) => showSnackBar(context: context, message: l.message),
        (r) => community = community.copyWith(banner: r),
      );
    }
    final res = await _communityRepository.editCommunity(community);
    state = false;
    res.fold((l) => showSnackBar(context: context, message: l.message),
        (r) => Routemaster.of(context).pop());
  }

  Stream<List<Community>> getUserCommunties() {
    var user = _ref.read(userProvider);
    return _communityRepository.getUserCommunities(user!.uid);
  }

  Stream<List<Community>> searchCommunity(String query) {
    return _communityRepository.searchCommunity(query);
  }

  Stream<Community> getCommunityByName(String name) {
    return _communityRepository.getCommunityByName(name);
  }
}
