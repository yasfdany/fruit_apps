import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;

  User? getUser() {
    user = _firebaseAuth.currentUser;
    return user;
  }

  Future logout() {
    return _firebaseAuth.signOut();
  }

  void login({
    Function(UserCredential)? onFinish,
    Function(Object? error)? onFailed,
  }) {
    _firebaseAuth.signInAnonymously().then((credential) {
      getUser();
      if (onFinish != null) onFinish(credential);
    }).onError((error, stackTrace) {
      if (onFailed != null) onFailed(error);
    });
  }
}
