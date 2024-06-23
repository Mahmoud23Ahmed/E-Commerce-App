import 'package:e_commerce/Auth/Login.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('Assests/background.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100, right: 80),
                  child: Text(
                    'My E-Commerce App',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 200),
                Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Button(text: 'SIGNUP', onPressed: () {})),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: Button(
                      text: 'Login',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }),
                )
              ],
            )),
      ),
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  late String text;
  late final void Function() onPressed;

  Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7096D1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          )),
    );
  }
}
