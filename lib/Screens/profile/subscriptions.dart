// ignore_for_file: file_names

import 'package:cine_audio/Screens/profile/detailsubscription.dart';
import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  int selectedIndex = -1;

  /// 🔹 Dummy Data
  final List<Map<String, String>> plans = [
    {"title": "Monthly", "price": "\$38 /", "duration": "7 Days"},
    {"title": "Monthly", "price": "\$38 /", "duration": "7 Days"},
    {"title": "Monthly", "price": "\$38 /", "duration": "7 Days"},
    {"title": "Monthly", "price": "\$38 /", "duration": "7 Days"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d0d0d),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
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

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: plans.length,
                itemBuilder: (context, index) {
                  return _subscriptionCard(index);
                },
              ),
            ),

            /// 🔹 Button
            Padding(
              padding: const EdgeInsets.all(17),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xffed2c67), Color(0xff3b0919)],
                  ),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: TextButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      // No item selected, show banner/snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please select a subscription plan first!',
                            style: TextStyle(color: Color(0xffed2c67)),
                          ),
                          backgroundColor: Color(0xff272727),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      // Item selected, navigate to next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Detailsubscription(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Subscribe Now',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subscriptionCard(int index) {
    final plan = plans[index];
    bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            setState(() {
              selectedIndex = selectedIndex == index ? -1 : index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 88,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xff272727),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isSelected
                    ? const Color(0xffed2c67)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      plan["title"] ?? "",
                      style: TextStyle(
                        color: isSelected
                            ? const Color(0xffed2c67)
                            : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          plan["price"] ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          plan["duration"] ?? "",
                          style: const TextStyle(
                            color: Color(0xffed2c67),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                const Text(
                  'Lorem ipsum dolor sit amet consectetur Egestas netus ultrices.',
                  style: TextStyle(fontSize: 12, color: Color(0xff666666)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
