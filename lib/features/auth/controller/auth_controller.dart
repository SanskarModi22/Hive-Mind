import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.read(authRepositoryProvider),
    //ref.watch is mostly used inside inside build widget
  ),
);

class AuthController {
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;
  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }
}

//UI - Repository - Controller
//UI cannot directly communicate with the repository , it can only be accessed  by controller