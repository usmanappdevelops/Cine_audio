import 'package:cine_audio/Screens/profile/Subscriptions.dart';
import 'package:cine_audio/Screens/profile/dialog.dart';
import 'package:flutter/material.dart';

class Detailsubscription extends StatefulWidget {
  const Detailsubscription({super.key});

  @override
  State<Detailsubscription> createState() => _DetailsubscriptionState();
}

class _DetailsubscriptionState extends State<Detailsubscription> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    numberController.dispose();
    cnicController.dispose();
    cardController.dispose();
    bankController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d0d0d),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Subscriptions(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xffed2c67),
                      ),
                    ),
                    const Text(
                      "Subscriptions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Color(0xffed2c67),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Selected Plan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Container(
                  width: double.infinity,
                  height: 88,
                  decoration: BoxDecoration(
                    color: const Color(0xff272727),
                    border: Border.all(
                      color: const Color(0xffed2c67),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$38 /',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '7 Days',
                                  style: TextStyle(
                                    color: Color(0xffed2c67),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur Egestas netus ultrices.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Section Title
              const Padding(
                padding: EdgeInsets.only(left: 17),
                child: Text(
                  'Enter Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Name
              _buildTextField(
                controller: nameController,
                hint: 'Enter your name',
              ),

              const SizedBox(height: 15),

              // Number
              _buildTextField(
                controller: numberController,
                hint: 'Enter your Number',
              ),

              const SizedBox(height: 15),

              // CNIC
              _buildTextField(
                controller: cnicController,
                hint: 'Enter your Cnic',
              ),

              const SizedBox(height: 15),

              // Card Number
              _buildTextField(
                controller: cardController,
                hint: 'Enter card No.',
              ),

              const SizedBox(height: 15),

              // Bank Name & CVV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: bankController,
                        hint: 'Enter Bank Name',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(
                        controller: cvvController,
                        hint: 'Enter CVV',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Pay Now Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffed2c67), Color(0xff3b0919)],
                    ),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        if (nameController.text.isEmpty ||
                            numberController.text.isEmpty ||
                            cnicController.text.isEmpty ||
                            cardController.text.isEmpty ||
                            bankController.text.isEmpty ||
                            cvvController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all fields!'),
                              backgroundColor: Color(0xff272727),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          showSuccessDialog(context); // Success dialog
                        }
                      },
                      child: const Text(
                        'Pay Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xff949494)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xffed2c67)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xffed2c67), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
