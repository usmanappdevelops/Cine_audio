import 'package:cine_audio/Screens/login.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signupValidation() {
    if (usernameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Passwords do not match",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Account Created Successfully!",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 30),

                Image.asset("assets/images/Cineaudio.png", height: 110),

                const SizedBox(height: 40),

                RichText(
                  text: const TextSpan(
                    text: "Sign Up your ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "Account",
                        style: TextStyle(
                          color: Color(0xFFed2c67),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// USERNAME
                TextField(
                  controller: usernameController,
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
                      borderSide: const BorderSide(
                        color: Color(0xFFED2C67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// PHONE NUMBER
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white, height: 1),
                  decoration: InputDecoration(
                    hintText: "Enter your Number",
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(color: Color(0xFFed2c67)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(
                        color: Color(0xFFed2c67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// PASSWORD
                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  style: const TextStyle(color: Colors.white, height: 1),
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(color: Color(0xFFed2c67)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(
                        color: Color(0xFFed2c67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// CONFIRM PASSWORD
                TextField(
                  controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,
                  style: const TextStyle(color: Colors.white, height: 1),
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hideConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          hideConfirmPassword = !hideConfirmPassword;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(color: Color(0xFFed2c67)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(
                        color: Color(0xFFed2c67),
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                /// SIGNUP BUTTON
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
                    onPressed: signupValidation,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

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

                const SizedBox(height: 35),

                /// LOGIN TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xFFed2c67),
                          fontWeight: FontWeight.bold,
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
