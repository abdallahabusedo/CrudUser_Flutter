import "package:firebase_auth/firebase_auth.dart";
import 'package:flutterapp/models/user.dart';

class AuthService {
  // the _ before auth means that auth is private so we cannot use it outside this file

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid);
    } else {
      throw ArgumentError('Unexpected type for data');
    }
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon()async{
    try{
      AuthResult res = await _auth.signInAnonymously();
      FirebaseUser user = res.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in  with email and password
  //register with email and password
  Future registerWithEmailAndPassword (String email , String password) async{
    try{
      AuthResult res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = res.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOuts () async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}