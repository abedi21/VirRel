import 'package:flutter/material.dart';
import 'package:myapp/Services/authServices.dart';
import 'package:myapp/screens/auth/login_screen.dart';
import '../../widgets/profile_option.dart';
import 'chat_ai_screen.dart';

final AuthServices _authServices = AuthServices();
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          ProfileOption(
            icon: Icons.person,
            title: "Edit Profile",
            onTap: () {},
          ),
          ProfileOption(icon: Icons.settings, title: "Settings", onTap: () {}),
          ProfileOption(
            icon: Icons.chat,
            title: "Chat with AI",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatAIScreen()),
              );
            },
          ),
          const SizedBox(height: 20), // Space before the log out button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                await _authServices.signOut(); // Ensure this calls your logout function
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false, // Clears navigation stack
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Logout button color
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
