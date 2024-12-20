import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // Correct function type definition for onTap
  final void Function()? onTap;

  // Constructor to receive the onTap callback
  LoginPage({super.key, required this.onTap});

  void Login(BuildContext context) async {
    // Add login functionality here
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            color: Theme.of(context).primaryColor,
            size: 60,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Welcome Back You have been missed",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextfield(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextfield(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),
          const SizedBox(
            height: 50,
          ),
          MyButton(
              text: "Login", onTap:()=>Login(context)), // Correctly pass the Login method
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              GestureDetector(
                onTap: onTap, // Correctly pass the onTap callback
                child: Text("Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
