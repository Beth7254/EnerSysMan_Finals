import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          padding: const EdgeInsets.all(32),
          width: 900,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.info_outline,
                color: Color(0xFF1565C0),
                size: 80,
              ),
              const SizedBox(height: 20),

              const Text(
                "About Energy Management System",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Sample text: designed to help and "
                "organizations efficiently monitor, analyze, and optimize energy usage. "
                "By integrating tracking and visualization tools.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 30),
              const Divider(thickness: 1),
              const SizedBox(height: 20),

              // Mission section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInfoCard(
                    Icons.bolt,
                    "Our Mission",
                    "Text................",
                  ),
                  const SizedBox(width: 20),
                  _buildInfoCard(
                    Icons.public,
                    "Our Vision",
                    "Text.................",
                  ),
                ],
              ),

              const SizedBox(height: 40),
              const Divider(thickness: 1),
              const SizedBox(height: 20),

              const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1565C0),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "📧 energymansys@example.com\n📞 +1 (234) 567-8900\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for mission/vision cards
  static Widget _buildInfoCard(IconData icon, String title, String desc) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: const Color(0xFF1565C0)),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
