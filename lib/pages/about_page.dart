import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyRoute.login.path, (_) => false);
              }
            },
            builder: (context, state) {
              if (state is LogoutLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.purpleAccent),
                    ),
                  ),
                );
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
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e), Color(0xFF0f3460)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 100),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.purpleAccent.withOpacity(0.5), width: 2),
                  ),
                  child: const Icon(Icons.lan_outlined,
                      color: Colors.purpleAccent, size: 60),
                ),

                const SizedBox(height: 25),
                const Text(
                  "Narrative of My Journey",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Container(height: 3, width: 60, color: Colors.purpleAccent),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: const Text(
                    "Perkenalkan, saya Salsabilla Zara.saya adalah seorang mahasiswi yang percaya bahwa teknologi bukan sekadar alat, melainkan solusi nyata untuk mempermudah hidup banyak orang. Fokus saya saat ini adalah mendalami bagaimana desain antarmuka dan arsitektur jaringan. Bagi saya, setiap tantangan adalah kesempatan untuk bertumbuh dan memberikan kontribusi.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.8,
                        fontWeight: FontWeight.w400)
                  ),
                ),

                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Technical Forte",
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                const SizedBox(height: 20),

                Wrap(
                  spacing: 12,
                  runSpacing: 15,
                  children: [
                    _buildFancyChip(Icons.code, "Flutter"),
                    _buildFancyChip(Icons.storage, "Laravel"),
                    _buildFancyChip(Icons.settings_input_component, "Networking"),
                    _buildFancyChip(Icons.brush, "UI/UX Design"),
                    _buildFancyChip(Icons.terminal, "Linux Admin"),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFancyChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purpleAccent.withOpacity(0.3),
          Colors.transparent
        ]),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.purpleAccent.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.purpleAccent, size: 18),
          const SizedBox(width: 8),
          Text(label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}