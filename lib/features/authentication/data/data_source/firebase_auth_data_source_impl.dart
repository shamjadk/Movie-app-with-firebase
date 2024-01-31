import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/data/data_source/firebase_auth_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_data_source_impl.g.dart';

class FireBaseAuthDataSourceImpl implements FireBaseAuthDataSource {
  final FirebaseAuth firebaseAuth;
  FireBaseAuthDataSourceImpl(this.firebaseAuth);
  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Authenticationxception('Weak password');
      } else if (e.code == 'email-already-in-use') {
        throw Authenticationxception('This email already exists');
      } else {
        throw Authenticationxception('Cannot sign up');
      }
    } catch (e) {
      throw Authenticationxception(e.toString());
    }
  }

  @override
  Future<UserCredential> loginWithEmail(String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Authenticationxception('No user found for that email');
      } else if (e.code == 'wrong-password') {
        Authenticationxception('Wrong password provided for that user');
      } else {
        throw Authenticationxception('Cannot log in');
      }
    }
    return loginWithEmail(email, password);
  }

  @override
  Future<void> verifyEmail() async {
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> continueWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception {
      throw Authenticationxception('Cannot login, please try again');
    }
  }

  @override
  Future<(String, int?)> logInWithPhoneNumber(String mobileNUmber,
      [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int?>();
      await firebaseAuth.verifyPhoneNumber(
          forceResendingToken: resendToken,
          phoneNumber: mobileNUmber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            log('completed');
            await firebaseAuth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              log('invalid phone number');
            }
          },
          codeSent: (String? verificationId, int? resendToken) async {
            verificationIdCompleter.complete(verificationId);
            resendTokenCompleter.complete(resendToken);
          },
          codeAutoRetrievalTimeout: (String verificationId) async {
            log('timeout');
          });
      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;
      return (verificationId, newResendToken);
    } catch (e) {
      throw Authenticationxception('Cannot login please try again');
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> forgottenPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}

@riverpod
FireBaseAuthDataSource fireBaseAuthDataSource(FireBaseAuthDataSourceRef ref) {
  return FireBaseAuthDataSourceImpl(FirebaseAuth.instance);
}
