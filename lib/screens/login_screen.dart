import 'package:munch_alert/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/munch_logo.png',
                  height: 300,
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                ),
                controller: nameController,
              ),
              const SizedBox(
                height: 26.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.mail, color: Colors.black),
                ),
                controller: emailController,
              ),
              const SizedBox(
                height: 26.0,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const SizedBox(
                height: 26.0,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: const Color(0xFF00E1B4),
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          name: nameController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
