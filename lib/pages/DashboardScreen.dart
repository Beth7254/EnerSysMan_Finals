import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'profile_page.dart';
import 'about_us_page.dart';
import 'input_data_page.dart';

class DashboardScreen extends StatefulWidget {
  final String name;
  final String email;

  const DashboardScreen({super.key, required this.name, required this.email});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _hoveredIndex = -1;
  int _selectedIndex = 0;

  final List<String> _menuItems = [
    "Dashboard",
    "Input New Data",
    "Data",
    "About Us",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Row(
        children: [
          // 🧭 SIDEBAR
          Container(
            width: 240,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Icon(Icons.electric_bolt, color: Colors.white, size: 50),
                const SizedBox(height: 10),
                const Text(
                  "EnerManSys",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // MENU ITEMS
                Expanded(
                  child: ListView.builder(
                    itemCount: _menuItems.length,
                    itemBuilder: (context, index) {
                      final isSelected = _selectedIndex == index;
                      final isHovered = _hoveredIndex == index;
                      return MouseRegion(
                        onEnter: (_) => setState(() => _hoveredIndex = index),
                        onExit: (_) => setState(() => _hoveredIndex = -1),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? Colors.white.withOpacity(0.15)
                                    : isHovered
                                    ? Colors.white.withOpacity(0.07)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Icon(
                              _getMenuIcon(index),
                              color: Colors.white,
                            ),
                            title: Text(
                              _menuItems[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: () => setState(() => _selectedIndex = index),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // 👤 PROFILE SECTION
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const Divider(color: Colors.white24, thickness: 0.5),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => ProfilePage(
                                    name: widget.name,
                                    email: widget.email,
                                  ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF1565C0),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.email,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // 🔓 SIGN OUT BUTTON
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF1565C0),
                            minimumSize: const Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.logout, size: 18),
                          label: const Text("Sign Out"),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 📊 MAIN CONTENT
          Expanded(
            child: Column(
              children: [
                // HEADER BAR
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _menuItems[_selectedIndex],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1565C0),
                        ),
                      ),
                    ],
                  ),
                ),

                // BODY CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        _selectedIndex == 0
                            ? _buildDashboardContent()
                            : _selectedIndex == 1
                            ? const InputDataPage()
                            : _selectedIndex == 2
                            ? _buildPlaceholder("Data Records", Icons.storage)
                            : const AboutUsPage(),
                    // ✅ Correct About Us call
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ICON HANDLER
  IconData _getMenuIcon(int index) {
    switch (index) {
      case 0:
        return Icons.dashboard;
      case 1:
        return Icons.input_rounded;
      case 2:
        return Icons.storage;
      case 3:
        return Icons.info_outline;
      default:
        return Icons.circle;
    }
  }

  // MAIN DASHBOARD CONTENT
  Widget _buildDashboardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Center(
          child: Column(
            children: [
              const Icon(Icons.bolt, color: Color(0xFF1565C0), size: 80),
              const SizedBox(height: 20),
              ShaderMask(
                shaderCallback:
                    (bounds) => const LinearGradient(
                      colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: const Text(
                  "Welcome to Energy Manangement System! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Monitor and manage energy data efficiently.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            "QUICK ACCESS",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 30),

        // QUICK ACCESS CARDS
        LayoutBuilder(
          builder: (context, constraints) {
            double cardWidth =
                constraints.maxWidth < 900
                    ? constraints.maxWidth / 2.3
                    : constraints.maxWidth / 3.6;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickAccessCard(
                  0,
                  Icons.add_chart_rounded,
                  "New Data Input",
                  "Input new energy readings quickly",
                  () => setState(() => _selectedIndex = 1),
                  cardWidth,
                ),
                _buildQuickAccessCard(
                  1,
                  Icons.bar_chart_outlined,
                  "View Data",
                  "Access and review stored reports",
                  () => setState(() => _selectedIndex = 2),
                  cardWidth,
                ),
                _buildQuickAccessCard(
                  2,
                  Icons.info_outline,
                  "About Us",
                  "Learn more about EnerManSys",
                  () => setState(() => _selectedIndex = 3),
                  cardWidth,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  // HOVER-ENABLED QUICK ACCESS CARDS ✨
  Widget _buildQuickAccessCard(
    int index,
    IconData icon,
    String title,
    String desc,
    VoidCallback onTap,
    double width,
  ) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform:
            _hoveredIndex == index
                ? (Matrix4.identity()..scale(1.05))
                : Matrix4.identity(),
        curve: Curves.easeOut,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color:
                      _hoveredIndex == index
                          ? Colors.blueAccent.withOpacity(0.3)
                          : Colors.black.withOpacity(0.05),
                  blurRadius: _hoveredIndex == index ? 20 : 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 50, color: const Color(0xFF1565C0)),
                const SizedBox(height: 12),
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
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // PLACEHOLDER FOR OTHER SECTIONS
  Widget _buildPlaceholder(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 70, color: Colors.blueAccent),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Feature coming soon...",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
