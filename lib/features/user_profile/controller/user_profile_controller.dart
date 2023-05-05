import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import '../../../core/providers/storage_repository_provider.dart';
import '../../../core/utils.dart';
import '../../../models/user_model.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/user_profile_repository.dart';

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return UserProfileController(
    userProfileRepository: userProfileRepository,
    storageRepository: storageRepository,
    ref: ref,
  );
});

// final getUserPostsProvider = StreamProvider.family((ref, String uid) {
//   return ref.read(userProfileControllerProvider.notifier).getUserPosts(uid);
// });

class UserProfileController extends StateNotifier<bool> {
  final UserProfileRepository _userProfileRepository;
  final Ref _ref;
  final StorageRepositoryProvider _storageRepository;
  UserProfileController({
    required UserProfileRepository userProfileRepository,
    required Ref ref,
    required StorageRepositoryProvider storageRepository,
  })  : _userProfileRepository = userProfileRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void editCommunity({
    required File? profileFile,
    required File? bannerFile,
    required Uint8List? profileWebFile,
    required Uint8List? bannerWebFile,
    required BuildContext context,
    required String name,
  }) async {
    state = true;
    UserModel user = _ref.read(userProvider)!; //Current user ki details

    if (profileFile != null || profileWebFile != null) {
      final res = await _storageRepository.storeFile(
        path: 'users/profile',
        id: user.uid,
        file: profileFile, //Profile Pic update
        // webFile: profileWebFile,
      );
      res.fold(
        (l) => showSnackBar(context: context, message: l.message),
        (r) => user = user.copyWith(profilePic: r),
      );
    }

    if (bannerFile != null || bannerWebFile != null) {
      final res = await _storageRepository.storeFile(
        path: 'users/banner',
        id: user.uid,
        file: bannerFile, //Banner File update
        // webFile: bannerWebFile,
      );
      res.fold(
        (l) => showSnackBar(context: context, message: l.message),
        (r) => user = user.copyWith(banner: r),
      );
    }
    user = user.copyWith(name: name);
    //update with new name
    final res = await _userProfileRepository.editProfile(user);
    //Database mein update kiya hain user ko
    state = false;
    res.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (r) {
        _ref.read(userProvider.notifier).update((state) => user);
        //Edit karne ke baad update kiya hain user ko in user Provider
        Routemaster.of(context).pop();
      },
    );
  }

  // Stream<List<Post>> getUserPosts(String uid) {
  //   return _userProfileRepository.getUserPosts(uid);
  // }

  // void updateUserKarma(UserKarma karma) async {
  //   UserModel user = _ref.read(userProvider)!;
  //   user = user.copyWith(karma: user.karma + karma.karma);

  //   final res = await _userProfileRepository.updateUserKarma(user);
  //   res.fold((l) => null,
  //       (r) => _ref.read(userProvider.notifier).update((state) => user));
  // }
}
