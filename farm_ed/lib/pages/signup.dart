import 'package:farm_ed/pages/home-page.dart';
import 'package:farm_ed/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to handle email/password signup
  Future<void> _signUpWithEmailAndPassword() async {
    try {
      // Validate input fields
      if (_usernameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        _showErrorSnackBar("Please fill in all fields");
        return;
      }

      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Update user profile with username
      await userCredential.user
          ?.updateDisplayName(_usernameController.text.trim());

      // Navigate to home or next screen
      _navigateToHomeScreen();
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      String errorMessage = "Signup failed";
      switch (e.code) {
        case 'weak-password':
          errorMessage = "The password is 3too weak";
          break;
        case 'email-already-in-use':
          errorMessage = "An account already exists with this email";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email format";
          break;
      }
      _showErrorSnackBar(errorMessage);
    } catch (e) {
      // Handle any other unexpected errors
      _showErrorSnackBar("An unexpected error occurred");
    }
  }

  // Method to handle Google Sign-In
  Future<void> _signUpWithGoogle() async {
    try {
      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth credentials
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        await _auth.signInWithCredential(credential);

        // Navigate to home screen
        _navigateToHomeScreen();
      }
    } catch (e) {
      _showErrorSnackBar("Google Sign-In failed");
    }
  }

  // Method to show error messages
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Method to navigate to home screen
  void _navigateToHomeScreen() {
    // Replace with your actual home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset('image/logo.png', height: 100),
                    const SizedBox(height: 10),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Username TextField
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Email TextField
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Password TextField
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Sign Up Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _signUpWithEmailAndPassword,
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Or sign up with"),
                    const SizedBox(height: 10),
                    // Google Sign-In Button
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: OutlinedButton.icon(
                        onPressed: _signUpWithGoogle,
                        icon:
                            Image.asset('image/images/google.png', height: 24),
                        label: const Text(
                          "Google",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(
                'image/images/decodown.png',
                width: double.infinity,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
