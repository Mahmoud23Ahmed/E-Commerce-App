import 'package:e_commerce/Auth/ForgetPassword.dart';
import 'package:e_commerce/Auth/Signup.dart';
import 'package:e_commerce/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7096D1)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please Sign in to continue',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Color(0xFF7096D1)),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xFF7096D1),
                      ),
                      labelStyle: TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Color(0xFF7096D1)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xFF7096D1),
                      ),
                      suffixIcon: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgetPasswordScreen())),
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(color: Color(0xFF7096D1)),
                        ),
                      ),
                      labelStyle: const TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7096D1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '  Login  ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen())),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF7096D1),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
