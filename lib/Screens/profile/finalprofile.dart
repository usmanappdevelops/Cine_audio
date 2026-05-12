import 'package:flutter/material.dart';

class Finalprofile extends StatefulWidget {
  const Finalprofile({super.key});

  @override
  State<Finalprofile> createState() => _FinalprofileState();
}

class _FinalprofileState extends State<Finalprofile> {
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
            SizedBox(height: 15),
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
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 88,
                width: 391,
                decoration: BoxDecoration(
                  color: Color(0xff272727),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),

                  child: Column(
                    children: [
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monthly',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 16,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '\$38 /',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 12,
                                  fontWeight: FontWeight(400),
                                ),
                              ),
                              Text(
                                '7 Days',
                                style: TextStyle(
                                  color: Color(0xffed2c67),
                                  fontSize: 12,
                                  fontWeight: FontWeight(400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur Egestas netus ultrices.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight(400),
                          color: Color(0xff666666),
                        ),
                      ),
                    ],
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
