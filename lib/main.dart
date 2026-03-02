import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile About Me',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 4, 25),
      appBar: AppBar(
        title: const Text("Halaman Profil"),
        backgroundColor: const Color.fromARGB(255, 164, 15, 97),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Bagian Foto
            const Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Color.fromARGB(255, 227, 126, 175),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profil.jpeg'), 
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Nama & Institusi
            const Text(
              "SALSABILLA",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "D3 Teknik Informatika - Semester 4",
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 192, 88, 147)),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: Column(
                  children: [
                    _buildListTile(Icons.email, "Email", "salsabillazara@it.student.pens.ac.id"),
                    const Divider(height: 1),
                    _buildListTile(Icons.phone, "Telepon", "085664533470"),
                    const Divider(height: 1),
                    _buildListTile(Icons.location_on, "Alamat", "Ponorogo, Jawa Timur"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 170, 9, 119)),
      title: Text(title, style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 243, 190, 57))),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}