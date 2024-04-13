import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 244, 226, 248), // Mengatur warna latar belakang
        child: ListView(
          children: [
            _buildSettingItem(
              leadingIcon: Icons.person,
              title: 'Edit Profile',
              onTap: () {
                // Navigasi ke halaman edit profile
              },
            ),
            _buildDivider(),
            _buildSettingItem(
              leadingIcon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // Navigasi ke halaman notifikasi
              },
            ),
            _buildDivider(),
            _buildSettingItem(
              leadingIcon: Icons.security,
              title: 'Privacy & Security',
              onTap: () {
                // Navigasi ke halaman privasi & keamanan
              },
            ),
            _buildDivider(),
            _buildSettingItem(
              leadingIcon: Icons.language,
              title: 'Language',
              onTap: () {
                // Navigasi ke halaman bahasa
              },
            ),
            _buildDivider(),
            _buildSettingItem(
              leadingIcon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                // Proses logout
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData leadingIcon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap, // Menggunakan onTap yang diberikan
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Mengatur warna latar belakang item pengaturan
          borderRadius: BorderRadius.circular(8), // Membuat sudut item melengkung
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Mengatur bayangan item
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1), // Mengatur posisi bayangan
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Memberikan jarak antar item
        child: ListTile(
          leading: Icon(leadingIcon),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[400],
      height: 0,
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingScreen(),
  ));
}
