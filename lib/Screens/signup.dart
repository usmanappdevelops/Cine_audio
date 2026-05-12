// ignore_for_file: file_names

import 'package:cine_audio/Screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool isLoading = false;

  /// 🔹 Controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController =
      TextEditingController();

  /// 🔹 Firebase
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  /// 🔹 Signup Function
  Future<void> signupUser() async {
    if (usernameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passwordController.text !=
        confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Passwords do not match",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password must be at least 6 characters",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      /// 🔹 Create Email Automatically
      String fakeEmail =
          "${phoneController.text.trim()}@cineaudio.com";

      /// 🔹 Firebase Authentication
      UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: fakeEmail,
        password: passwordController.text.trim(),
      );

      /// 🔹 Store User Data in Firestore
      await firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        "uid": userCredential.user!.uid,
        "username":
            usernameController.text.trim(),
        "phone":
            phoneController.text.trim(),
        "email": fakeEmail,
        "createdAt": Timestamp.now(),
      });

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Account Created Successfully!",
          ),
          backgroundColor: Colors.green,
        ),
      );

      /// 🔹 Navigate to Login Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const LoginScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });

      String errorMessage = "Something went wrong";

      if (e.code == 'email-already-in-use') {
        errorMessage =
            "This phone number already exists";
      } else if (e.code == 'weak-password') {
        errorMessage = "Weak password";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid phone number";
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
      backgroundColor: const Color(0xFF0D0D0D),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25),

            child: Column(
              children: [
                const SizedBox(height: 30),

                /// 🔹 Logo
                Image.asset(
                  "assets/images/Cineaudio.png",
                  height: 110,
                ),

                const SizedBox(height: 40),

                /// 🔹 Title
                RichText(
                  text: const TextSpan(
                    text: "Sign Up your ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: "Account",
                        style: TextStyle(
                          color: Color(0xFFed2c67),
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// 🔹 Username
                TextField(
                  controller: usernameController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        "Enter your username",
                    hintStyle:
                        const TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFED2C67),
                      ),
                    ),
                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFED2C67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// 🔹 Phone Number
                TextField(
                  controller: phoneController,
                  keyboardType:
                      TextInputType.phone,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        "Enter your Number",
                    hintStyle:
                        const TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFed2c67),
                      ),
                    ),
                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFed2c67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// 🔹 Password
                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
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
                        hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword =
                              !hidePassword;
                        });
                      },
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFed2c67),
                      ),
                    ),

                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFed2c67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// 🔹 Confirm Password
                TextField(
                  controller:
                      confirmPasswordController,
                  obscureText:
                      hideConfirmPassword,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        "Confirm Password",
                    hintStyle:
                        const TextStyle(
                      color: Colors.grey,
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        hideConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          hideConfirmPassword =
                              !hideConfirmPassword;
                        });
                      },
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFed2c67),
                      ),
                    ),

                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(17),
                      borderSide:
                          const BorderSide(
                        color:
                            Color(0xFFed2c67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                /// 🔹 Signup Button
                Container(
                  width: double.infinity,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(17),

                    gradient:
                        const LinearGradient(
                      colors: [
                        Color(0xFFED2C67),
                        Color(0xFF3B0919),
                      ],
                    ),
                  ),

                  child: TextButton(
                    onPressed:
                        isLoading ? null : signupUser,

                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "- OR -",
                  style: TextStyle(
                    color: Color(0xffed2c67),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Sign Up With:",
                  style:
                      TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 15),

                /// 🔹 Social Icons
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/google2.png",
                      height: 30,
                    ),

                    const SizedBox(width: 20),

                    Image.asset(
                      "assets/images/facebook.png",
                      height: 30,
                    ),

                    const SizedBox(width: 20),

                    Image.asset(
                      "assets/images/pintrest.png",
                      height: 30,
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                /// 🔹 Login Navigation
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account? ",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color:
                              Color(0xFFed2c67),
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}