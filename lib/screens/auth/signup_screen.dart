import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Services/authServices.dart';
import 'package:myapp/navigation/bottom_nav.dart';
import 'package:myapp/screens/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final AuthServices _authServices = AuthServices();

  String? _errorMessage;
  bool _isLoading = false;

  // Validate form inputs
  bool _validateInputs() {
    if (_emailController.text.isEmpty) {
      setState(() => _errorMessage = "Email is required");
      return false;
    }
    if (!_emailController.text.contains("@") || !_emailController.text.contains(".")) {
      setState(() => _errorMessage = "Enter a valid email");
      return false;
    }
    if (_passwordController.text.isEmpty) {
      setState(() => _errorMessage = "Password is required");
      return false;
    }
    if (_passwordController.text.length < 6) {
      setState(() => _errorMessage = "Password must be at least 6 characters");
      return false;
    }
    if (_confirmPasswordController.text != _passwordController.text) {
      setState(() => _errorMessage = "Passwords do not match");
      return false;
    }
    return true;
  }

  // Handle registration
  Future<void> _register() async {
    if (!_validateInputs()) return;

    setState(() {
      _errorMessage = null;
      _isLoading = true;
    });

    try {
      await _authServices.registerWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      );

      // Navigate to home screen after successful registration
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavScreen()),
          (route) => false, // Removes all previous routes from the stack
        );
      }

    } catch (e) {
      setState(() {
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'email-already-in-use':
              _errorMessage = "This email is already registered";
              break;
            case 'weak-password':
              _errorMessage = "Password is too weak";
              break;
            case 'invalid-email':
              _errorMessage = "Invalid email format";
              break;
            default:
              _errorMessage = "Registration failed: ${e.message}";
          }
        } else {
          _errorMessage = "An error occurred. Please try again";
        }
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, // Prevents the back arrow from appearing
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthTextField(
              controller: _emailController,
              labelText: "Email",
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: _passwordController,
              labelText: "Password",
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: _confirmPasswordController,
              labelText: "Confirm Password",
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Register",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),  // Navigate back to login screen
                      );
                    },
              child: const Text("Already have an account? Sign In",
                  style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
