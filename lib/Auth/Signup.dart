import 'package:e_commerce/Auth/Login.dart';
import 'package:e_commerce/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _FullnameController = TextEditingController();
  final TextEditingController _ConfirmPassword = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.of(context).push(
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF7096D1),
            ),
            onPressed: () => Navigator.of(context).pop,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 110),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7096D1)),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _FullnameController,
                    style: const TextStyle(color: Color(0xFF7096D1)),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Full Name',
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: Color(0xFF7096D1),
                      ),
                      labelStyle: TextStyle(fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xFF7096D1),
                      ),
                      labelStyle: TextStyle(fontSize: 12),
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
                  TextFormField(
                    controller: _ConfirmPassword,
                    obscureText: true,
                    style: const TextStyle(color: Color(0xFF7096D1)),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xFF7096D1),
                      ),
                      labelStyle: TextStyle(fontSize: 12),
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
                              '  SignUp  ',
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
                "Already have an account? ",
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
                        builder: (context) => const LoginScreen())),
                child: const Text(
                  'Sign in',
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
