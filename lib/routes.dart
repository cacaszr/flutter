import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/about_page.dart'; 

enum MyRoute {
  login('/login'),
  home('/home'),
  profile('/profile'),
  about('/about');

  final String path;
  const MyRoute(this.path);
}

final Map<String, WidgetBuilder> routes = {
  MyRoute.login.path: (context) => const LoginPage(),
  MyRoute.home.path: (context) => const HomePage(),
  MyRoute.profile.path: (context) => const ProfilePage(),
  MyRoute.about.path: (context) => const AboutPage(), // Daftarkan di sini
};