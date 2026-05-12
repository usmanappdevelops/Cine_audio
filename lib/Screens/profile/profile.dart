// ignore_for_file: sized_box_for_whitespace

import 'package:cine_audio/Screens/profile/subscriptions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d0d0d),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios, color: Color(0xffed2c67)),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications, color: Color(0xffed2c67)),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/hassan.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hassan Ahmed',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight(700),
                          ),
                        ),

                        Text(
                          'Age: 32',
                          style: TextStyle(
                            color: Color(0xffed2c67),
                            fontSize: 16,
                            fontWeight: FontWeight(400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffed2c67), Color(0xff4b1122)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 33,
                        width: 102,
                        decoration: BoxDecoration(
                          color: Color(0xff0d0d0d),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(color: Color(0xffffffff)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 17),

              child: Text(
                'History',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 16,
                  fontWeight: FontWeight(600),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Downloads',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 16,
                      fontWeight: FontWeight(600),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xffed2c67),
                        fontSize: 12,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '12 Videos',
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 12,
                      fontWeight: FontWeight(400),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_download_outlined,
                      color: Color(0xffed2c67),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Color(0xffed2c67)),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subscriptions',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 16,
                      fontWeight: FontWeight(600),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xffed2c67),
                        fontSize: 12,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Egestas netus ultrices.Lorem ipsum dolor sit amet consectetur. Egestas.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight(400),
                  color: Color(0xff666666),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Container(
                height: 45,
                width: 376,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffed2c67), Color(0xff3b0919)],
                  ),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Subscriptions(),
                        ),
                      );
                    },
                    child: Text(
                      'Subscribe Now',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                        fontWeight: FontWeight(400),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
