import 'package:e_commerce/models/facebook_user.dart';
import 'package:e_commerce/routers/router.dart';
import 'package:e_commerce/view/screen/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool visiblePassword = false;
  bool checkedBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? displayName = "mo";
  dynamic displayUserPhoto = "";
  FacebookUser? facebookmodel;

  changeVisiblty() {
    visiblePassword = !visiblePassword;
    update();
  }

  changeChecked() {
    checkedBox = !checkedBox;
    update();
  }

  void signUpUsingFireBase({
    required String name,
    required String passowrd,
    required String email,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: passowrd,
      )
          .then((value) {
        auth.currentUser!.updateDisplayName(name);
      });
      update();    
      Get.toNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String tittle = error.code.replaceAll(RegExp('-'), ' '), mesaage = "";
      if (error.code == 'weak-password') {
        mesaage = 'The password provided is too weak.';
        print(mesaage);
      } else if (error.code == 'email-already-in-use') {
        mesaage = 'The account already exists for that email.';
        print(mesaage);
      } else {
        mesaage = error.toString();
        print(mesaage);
      }
      Get.snackbar(
        tittle,
        mesaage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 164, 18, 18),
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 164, 18, 18),
        colorText: Colors.white,
      );
    }
  }

  void LoginUsingFireBase({
    required String passowrd,
    required String email,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: passowrd)
          .then((value) => displayName = auth.currentUser!.displayName!);
      update();
       Get.toNamed(Routes.mainScreen);

    } on FirebaseAuthException catch (error) {
      String tittle = error.code.replaceAll(RegExp('-'), ' '), mesaage = "";

      if (error.code == 'user-not-found') {
        mesaage = ("No user found for that email.");
        print('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        mesaage = ("Wrong password provided for that user.");

        print('Wrong password provided for that user.');
      }
      Get.snackbar(
        tittle,
        mesaage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 164, 18, 18),
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 164, 18, 18),
        colorText: Colors.white,
      );
    }
  }

  void LoginUsingFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        final data = await FacebookAuth.instance.getUserData();
        facebookmodel = FacebookUser.fromJson(data);
        displayName = facebookmodel!.name!;
        update();
        Get.toNamed(Routes.mainScreen);

      }
    } on Exception catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 164, 18, 18),
        colorText: Colors.white,
      );
    }
    /*   displayName = loginResult.!;
      displayUserPhoto = googleUser.photoUrl!; */
  }

  void signinUsingGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn().signIn().then((value) {
        update();
      Get.toNamed(Routes.mainScreen);

      });
      displayName = googleUser?.displayName!;
      displayUserPhoto = googleUser?.photoUrl!;
    } on FirebaseAuthException catch (error) {
      String tittle = error.code.replaceAll(RegExp('-'), ' '), mesaage = "";
    } catch (error) {
      print("**********************************************");
      print(error.toString());
      print("**********************************************");
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 164, 18, 18),
        colorText: Colors.white,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        update();
      });

      // update();
      // Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
        print(message);
      } else {
        message = error.message.toString();
        print(message);
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() {
    GoogleSignIn().signOut();
    auth.signOut();
  }
}
