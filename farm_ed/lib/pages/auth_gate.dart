import 'package:farm_ed/pages/home-page.dart';
import 'package:farm_ed/pages/login.dart'; // Make sure this import is correct
//import 'package:farm_ed/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is logged in
            return const HomePage();
          } else {
            // User is not logged in
            return LoginPage();
          }
        },
      ),
    );
  }
}
