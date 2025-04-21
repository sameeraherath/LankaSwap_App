import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../services/auth_service.dart';
import '../../models/auth/user_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  // Initialize the provider
  void init() {
    _authService.authStateChanges.listen((User? firebaseUser) {
      if (firebaseUser != null) {
        _user = UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: firebaseUser.displayName,
          photoUrl: firebaseUser.photoURL,
        );
      } else {
        _user = null;
      }
      notifyListeners();
    });
  }

  // Sign in with email and password
  Future<void> signInWithEmail(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.signInWithEmailAndPassword(email, password);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Register with email and password
  Future<void> registerWithEmail(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.registerWithEmailAndPassword(email, password);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.signInWithGoogle();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.signOut();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
