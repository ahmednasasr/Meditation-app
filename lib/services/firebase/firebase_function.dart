import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth/data/models/user_model.dart';

class FirebaseFunction {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<UserModel> userMainFireStore() {
    return firestore.collection("Users").withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        var data = snapshot.data();
        if (data != null && data is Map<String, dynamic>) {
          return UserModel.fromJson(data);
        } else {
          throw Exception("Invalid data format from Firestore");
        }
      },
      toFirestore: (userModel, options) {
        return userModel.toJson();
      },
    );
  }

  static addUser(UserModel user) async {
    var ref = userMainFireStore();
    await ref.doc(user.id).set(user);
  }

  static Future<UserModel?> getUser() async {
    var ref = userMainFireStore();
    var data = await ref.doc(FirebaseAuth.instance.currentUser?.uid ?? "").get();

    if (data.exists && data.data() != null) {
      UserModel userModel = data.data()!;
      return userModel;
    } else {
      return null;
    }
  }

  static Future<UserCredential> createAccount(
      String email, String password, String name, String phone) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.sendEmailVerification();
      addUser(UserModel(
          email: email, name: name, id: credential.user!.uid, phone: phone));
      return credential;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e.message!;
    }
  }

  static Future<UserCredential> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e.message!;
    }
  }

  static logout() {
    FirebaseAuth.instance.signOut();
  }
}
