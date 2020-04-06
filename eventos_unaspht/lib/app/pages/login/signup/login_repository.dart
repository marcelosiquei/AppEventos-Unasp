import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventos_unaspht/app/pages/login/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  signUp(UserModel model) async {
    try {
      firebaseUser = (await _auth.createUserWithEmailAndPassword(
        email: model.email, 
        password: model.senha)) as FirebaseUser;
        await Firestore.instance
        .collection("Eventos-unasp") 
        .document(firebaseUser.uid)
        .setData(model.toJson());
      return null;
    } catch (e) {
      return e?.message ?? "erro";
    }
  }
  void signOut() async{
    print(isLoggedIn());
    await FirebaseAuth.instance.signOut();
    firebaseUser = await _auth.currentUser();
  }

  bool isLoggedIn(){ return FirebaseUser != null; 
  }

}


