// ignore_for_file: file_names

import 'package:cine_audio/Screens/homescreen/bottombar.dart';
import 'package:cine_audio/Screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool isLoading = false;

  /// 🔹 Controllers
  TextEditingController emailController =
      TextEditingController();

  TextEditingController passwordController =
      TextEditingController();

  /// 🔹 Firebase Auth
  final FirebaseAuth auth =
      FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// 🔹 Login Function
  Future<void> loginUser() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Please enter email and password"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      /// 🔹 Login with Firebase
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password:
            passwordController.text.trim(),
      );

      setState(() {
        isLoading = false;
      });

      /// 🔹 Success Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Successfully!",
          ),
          backgroundColor: Colors.green,
        ),
      );

      /// 🔹 Navigate to Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const BottomBar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });

      String errorMessage =
          "Something went wrong";

      if (e.code == 'user-not-found') {
        errorMessage =
            "No user found with this email";
      } else if (e.code == 'wrong-password') {
        errorMessage =
            "Incorrect password";
      } else if (e.code == 'invalid-email') {
        errorMessage =
            "Invalid email format";
      } else if (e.code == 'invalid-credential') {
        errorMessage =
            "Invalid email or password";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF0D0D0D),

      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 25,
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),

                /// 🔹 LOGO
                Image.asset(
                  "assets/images/Cineaudio.png",
                  height: 120,
                ),

                const SizedBox(height: 70),

                /// 🔹 TITLE
                RichText(
                  text: const TextSpan(
                    text: "Log In your ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: "Account",
                        style: TextStyle(
                          color:
                              Color(0xFFFF2E63),
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// 🔹 EMAIL FIELD
                TextField(
                  controller:
                      emailController,
                  keyboardType:
                      TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.white,
                  ),

                  decoration: InputDecoration(
                    hintText:
                        "Enter your email",

                    hintStyle:
                        const TextStyle(
                      color: Colors.grey,
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        17,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFED2C67),
                      ),
                    ),

                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        17,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFED2C67),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔹 PASSWORD FIELD
                TextField(
                  controller:
                      passwordController,
                  obscureText:
                      _obscurePassword,

                  style: const TextStyle(
                    color: Colors.white,
                  ),

                  decoration: InputDecoration(
                    hintText:
                        "Enter your Password",

                    hintStyle:
                        const TextStyle(
                      color: Colors.grey,
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons
                                .visibility_off,
                        color: Colors.grey,
                      ),

                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                              !_obscurePassword;
                        });
                      },
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        17,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFED2C67),
                      ),
                    ),

                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        17,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFED2C67),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// 🔹 LOGIN BUTTON
                Container(
                  width: double.infinity,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(
                      17,
                    ),

                    gradient:
                        const LinearGradient(
                      colors: [
                        Color(0xFFED2C67),
                        Color(0xFF3B0919),
                      ],
                    ),
                  ),

                  child: TextButton(
                    onPressed: isLoading
                        ? null
                        : loginUser,

                    child: isLoading
                        ? const CircularProgressIndicator(
                            color:
                                Colors.white,
                          )
                        : const Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors
                                  .white,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 25),

                /// 🔹 OR TEXT
                const Text(
                  "- OR -",
                  style: TextStyle(
                    color:
                        Color(0xffed2c67),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Sign Up With:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 15),

                /// 🔹 Social Icons
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,

                  children: [
                    Image.asset(
                      "assets/images/google2.png",
                      height: 30,
                    ),

                    const SizedBox(
                        width: 20),

                    Image.asset(
                      "assets/images/facebook.png",
                      height: 30,
                    ),

                    const SizedBox(
                        width: 20),

                    Image.asset(
                      "assets/images/pintrest.png",
                      height: 30,
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                /// 🔹 SIGNUP TEXT
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,

                  children: [
                    const Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        color:
                            Colors.white70,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const SignupScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color:
                              Color(0xFFFF2E63),
                          fontWeight:
                              FontWeight
                                  .bold,
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