import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String password, String name, String phone, Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      _createUser(user.user.uid, name, phone,onSuccess);
      print(user);
    }).catchError((err) {
      //TODO
    });
  }

  _createUser(String userId, String name, String phone,Function onSuccess) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user) {}).catchError((err) {
//TODO
    });
  }
}
