import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;

  const ProfilePage({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text("Profile"),
        elevation: 4,
      ),
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.4)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF1E88E5),
                child: Icon(Icons.person, color: Colors.white, size: 60),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                email,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Profile Updated!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  side: const BorderSide(color: Color(0xFF1565C0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back to Dashboard"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
