import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity, // Full width
            height: 250, // Specific height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: const Color.fromARGB(255, 3, 139, 28),
            ),
            child: Stack(
              children: [
                // White back arrow at the top left
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.green,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: Image.asset(
                      'image/logo(1).png', // Replace with your logo path
                      height: 60, // Adjust size as needed
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  // Profile Picture
                  const CircleAvatar(
                    radius: 40, // Set radius for 80x80 icon
                    backgroundColor:
                        Colors.grey, // Background color of the avatar
                    child: Icon(
                      Icons.person,
                      size: 50, // Set size for the icon
                      color: Colors.white, // White icon color
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Username
                  TextField(
                    enabled: false, // Prevent editing
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    controller: TextEditingController(text: 'Testuser'),
                  ),
                  const SizedBox(height: 20),
                  // Email
                  TextField(
                    enabled: false, // Prevent editing
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    controller:
                        TextEditingController(text: 'testuser@gmail.com'),
                  ),
                  const SizedBox(height: 20),
                  // Password (Masked)
                  TextField(
                    enabled: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    controller: TextEditingController(text: '********'),
                  ),
                  const SizedBox(height: 100),
                  // Logout Button
                  SizedBox(
                    width: 360, // Width of the Logout button
                    height: 50, // Height of the Logout button
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle logout functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logging out...')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Delete Account Button
                  SizedBox(
                    width: 360, // Width of the Delete Account button
                    height: 50, // Height of the Delete Account button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle delete account functionality
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm Deletion'),
                              content: const Text(
                                  'Are you sure you want to delete your account?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog
                                  },
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Perform account deletion
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                        'Account deleted',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Delete account',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfilePage(),
  ));
}
