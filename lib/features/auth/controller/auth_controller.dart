import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/repository/auth_repository.dart';
import 'package:reddit_clone/models/user_model.dart';

import '../../../core/utils.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);
//Ek global provider setup kiya hain
//Jo ki user ki details ka status track karta hain
final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  );
});
final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});
final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false); //Initially the loading is not happening
  Stream<User?> get authStateChange => _authRepository.authStateChange;
  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false;
    user.fold(
        (l) => showSnackBar(context: context, message: l.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }
  //On failure it will show a snackbar and on success it will update the previous userModel

  Stream<UserModel> getUserData(String uid) => _authRepository.getUserData(uid);
  void signInAsGuest(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInAsGuest();
    state = false;
    user.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void logout() async {
    _authRepository.logout();
  }
}

//UI - Repository - Controller
//UI cannot directly communicate with the repository , it can only be accessed  by controller
