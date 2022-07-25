import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AuthControler extends GetxController {
  // For user register

  void SignUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        _uploadProPic(image);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error is Occured", e.toString());
    }
  }

  Future<String>_uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profile pics")
        .child(FirebaseAuth.instance.currentUser!.uid);

        UploadTask uploadTask = ref.putFile(image);
        TaskSnapshot snapshot=await uploadTask;
       String imageDwonloadUrl=await snapshot.ref.getDownloadURL();
       return imageDwonloadUrl;
  }
}
