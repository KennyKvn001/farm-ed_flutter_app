import "package:firebase_auth/firebase_auth.dart";

class AuthService{
  //instance of auth
  final FirebaseAuth auth =FirebaseAuth.instance;
//login
Future<UserCredential>signInWithEmailPassword(String email,password)async {
  try{
    UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}


}