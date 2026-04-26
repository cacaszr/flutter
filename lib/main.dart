import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita bungkus MaterialApp dengan MultiBlocProvider supaya 
    // LoginBloc bisa diakses di semua halaman (Login & Home)
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Profile About Me',
        theme: ThemeData(
          brightness: Brightness.dark, 
          primarySwatch: Colors.deepPurple,
        ),
        // Kita mulai dari halaman Login ya, Beb
        initialRoute: MyRoute.login.path,
        routes: routes,
      ),
    );
  }
}