import 'package:flutter/material.dart';
import 'ForgotPassScreen.dart';
import 'DashboardScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _login() {
    String name = _fullNameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (name.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    // Navigate to Dashboard (mock)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(name: name, email: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            width: isMobile ? double.infinity : 420,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // HEADER (Blue gradient)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "ENERGY MANAGEMENT SYSTEM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Ignite Efficiency • Power Sustainability",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // FORM CONTENT
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Log In to Continue",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 25),

                      TextField(
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: "Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E88E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 3,
                          ),
                          onPressed: _login,
                          child: const Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        "© 2025 EnerManSys. All Rights Reserved",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
