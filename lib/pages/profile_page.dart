import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Salsabilla Profile", style: TextStyle(fontWeight: FontWeight.w300)),
        actions: [
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                Navigator.pushNamedAndRemoveUntil(context, MyRoute.login.path, (_) => false);
              }
            },
            builder: (context, state) {
              if (state is LogoutLoading) {
                return const Center(child: Padding(padding: EdgeInsets.all(12), child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.purpleAccent))));
              }
              return IconButton(
                onPressed: () => context.read<LoginBloc>().add(Logout()),
                icon: const Icon(Icons.logout, color: Colors.white),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF240b36), Color(0xFF000000)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.purpleAccent.withOpacity(0.5), blurRadius: 30, spreadRadius: 5)]),
                child: const CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.purpleAccent,
                  child: CircleAvatar(radius: 72, backgroundImage: AssetImage('assets/images/profil.jpeg')),
                ),
              ),
              const SizedBox(height: 25),
              const Text("Salsabilla Zara", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              const Text("Informatics Engineering Student", style: TextStyle(fontSize: 16, color: Colors.purpleAccent, fontWeight: FontWeight.w500)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, MyRoute.about.path),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent, shape: const StadiumBorder()),
                child: const Text("View About Me", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.purpleAccent.withOpacity(0.5))),
                  child: Column(
                    children: [
                      _buildModernTile(Icons.email_outlined, "Email", "salsabillazara@it.student.pens.ac.id"),
                      const Divider(color: Colors.white10, indent: 70),
                      _buildModernTile(Icons.phone_android_outlined, "Phone", "085664533470"),
                      const Divider(color: Colors.white10, indent: 70),
                      _buildModernTile(Icons.location_on_outlined, "Location", "Ponorogo, Jawa Timur"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.purple.withOpacity(0.2), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: Colors.purpleAccent)),
      title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.white54)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 15, color: Colors.white)),
    );
  }
}