import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Image.asset('image/logo.png',
                      height: 100), // Add your logo here
                  const SizedBox(height: 18),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Username"),
                  const SizedBox(height: 15),
                  _buildTextField("Email"),
                  const SizedBox(height: 15),
                  _buildTextField("Password", obscureText: true),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
<<<<<<< HEAD
                    const SizedBox(height: 20),
                    _buildTextField("Username"),
                    const SizedBox(height: 15),
                    _buildTextField("Email"),
                    const SizedBox(height: 15),
                    _buildTextField("Password", obscureText: true),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Or sign up with"),
                    const SizedBox(height: 10),
                    _buildGoogleButton(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.normal,
                            ),
=======
                  ),
                  const SizedBox(height: 20),
                  const Text("Or sign up with"),
                  const SizedBox(height: 10),
                  _buildGoogleButton(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
>>>>>>> 4beefc0ed1edc593e7ddaca0209597ac2ed42b56
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  "image/images/FarmEd Vector.png",
                  height: 130,
                ),
                Spacer(),
                Image.asset(
                  "image/images/FarmEd Group 2.png",
                  height: 130,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildGoogleButton() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            // Shadow color with transparency
            spreadRadius: 1,
            blurRadius: 6,
            // How blurred the shadow is
            offset: const Offset(0, 5), // X and Y offset of the shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        // Same border radius as the button
      ),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.asset('image/images/google.png', height: 24),
        // Add Google logo here
        label: const Text(
          "Google",
          style: TextStyle(fontSize: 16),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          minimumSize: const Size(double.infinity, 50),
          // Adjusted button size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // More rounded corners
          ),
          side: BorderSide(color: Colors.grey.shade300),
          // Border color
          foregroundColor: Colors.black,
          // Text and icon color
          backgroundColor: Colors.grey.shade300, // Button background color
        ),
      ),
    );
  }
}
