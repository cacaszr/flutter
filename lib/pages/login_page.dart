import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/models/login_request_model.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/utils/session_manager.dart';
import 'package:flutter_application_1/widgets/auth_button.dart';
import 'package:flutter_application_1/widgets/error_dialog.dart';
import 'package:flutter_application_1/widgets/login_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  bool isObscure = true;
  
  final sessionManager = SessionManager();

  void redirectToHomePage() {
    Navigator.pushReplacementNamed(context, MyRoute.home.path);
  }

  void checkLoginSession() async {
    final accessToken = await sessionManager.getAccessToken();
    if (accessToken.isNotEmpty) {
      redirectToHomePage();
    }
  }

  @override
  void initState() {
    checkLoginSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 43, 13, 64), Color.fromARGB(255, 0, 0, 0)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_person_rounded, size: 80, color: Colors.purpleAccent),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome Back", 
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  const SizedBox(height: 40),
                  
                  LoginTextfield(
                    labelText: 'Username',
                    controller: userController,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  LoginTextfield(
                    labelText: 'Password',
                    controller: passController,
                    isObscure: isObscure,
                    hasSuffix: true,
                    inputAction: TextInputAction.done,
                    onSuffixPressed: () => setState(() => isObscure = !isObscure),
                  ),
                  const SizedBox(height: 30),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        redirectToHomePage();
                      } else if (state is LoginFailed) {
                        showDialog(
                          context: context,
                          builder: (context) => const ErrorDialog(),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator(
                          color: Colors.purpleAccent,
                        );
                      }
                      
                      return SizedBox(
                        width: double.infinity,
                        child: AuthButton(
                          labelText: "Login",
                          onPressed: () {
                            final requestBody = LoginRequestModel(
                              username: userController.text,
                              password: passController.text,
                              expiresInMins: 30,
                            );
                            context.read<LoginBloc>().add(Login(requestBody));
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.purpleAccent, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }
}