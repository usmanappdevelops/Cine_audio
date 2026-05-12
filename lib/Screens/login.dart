import 'package:cine_audio/Screens/homescreen/bottombar.dart';
import 'package:cine_audio/Screens/signup.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),

                /// LOGO
                Image.asset("assets/images/Cineaudio.png", height: 120),

                const SizedBox(height: 70),

                /// TITLE
                RichText(
                  text: const TextSpan(
                    text: "Log In your ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "Account",
                        style: TextStyle(
                          color: Color(0xFFFF2E63),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// USERNAME / EMAIL FIELD
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white, height: 1),
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(color: Color(0xFFED2C67)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(color: Color(0xFFED2C67)),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// PASSWORD FIELD
                TextField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white, height: 1),
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(color: Color(0xFFED2C67)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(color: Color(0xFFED2C67)),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// LOGIN BUTTON
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFED2C67), Color(0xFF3B0919)],
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter email and password"),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Login Successfully!",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// OR TEXT
                const Text(
                  "- OR -",
                  style: TextStyle(color: Color(0xffed2c67)),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Sign Up With:",
                  style: TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google2.png", height: 30),
                    const SizedBox(width: 20),
                    Image.asset("assets/images/facebook.png", height: 30),
                    const SizedBox(width: 20),
                    Image.asset("assets/images/pintrest.png", height: 30),
                  ],
                ),

                const SizedBox(height: 50),

                /// SIGNUP TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFFFF2E63),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
