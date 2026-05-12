import 'package:cine_audio/Screens/detailscreen.dart';
import 'package:flutter/material.dart';

class Playnow extends StatefulWidget {
  const Playnow({super.key});

  @override
  State<Playnow> createState() => _PlaynowState();
}

class _PlaynowState extends State<Playnow> {
  double currentValue = 15.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d0d0d),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xffed2c67),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Color(0xffed2c67),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(33),
                child: Container(
                  padding: EdgeInsets.all(3.36), // 👈 border thickness
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffED2C67), Color(0xff4a1022)],
                    ),
                    borderRadius: BorderRadius.circular(43.69),
                  ),
                  child: Container(
                    width: 369,
                    height: 495,
                    decoration: BoxDecoration(
                      color: Color(0xff0d0d0d),
                      borderRadius: BorderRadius.circular(43.69),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 200, top: 15),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert_rounded, size: 33),
                          ),
                        ),
                        CircleAvatar(
                          radius: 72.5,
                          backgroundColor: Color(0xffed2c67),

                          child: CircleAvatar(
                            radius: 71.5,
                            backgroundImage: AssetImage(
                              'assets/images/podcast.png',
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Sunday Podcast',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 22,
                            fontWeight: FontWeight(600),
                          ),
                        ),
                        SizedBox(height: 30),
                        Slider(
                          activeColor: Color(0xffed2c67),
                          inactiveColor: Color(0xff736d6d),
                          value: currentValue,
                          min: 0,
                          max: 90,
                          onChanged: (double value) {
                            setState(() {
                              currentValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$currentValue',
                                style: TextStyle(color: Color(0xff736D6D)),
                              ),
                              Text(
                                '1hr 30m',
                                style: TextStyle(color: Color(0xff736D6D)),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/playback.png'),
                              width: 24.22,
                              height: 23.63,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/Stop_fill.png',
                                ),
                                width: 58,
                                height: 58,
                              ),
                            ),

                            Image(
                              image: AssetImage('assets/images/play.png'),
                              width: 24.22,
                              height: 23.63,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/Group 22.png'),
                                width: 20,
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 175),
                                child: Icon(
                                  Icons.power_settings_new,
                                  color: Color(0xffed2c67),
                                  weight: 24,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_outward_outlined,
                                color: Color(0xffed2c67),
                                size: 24,
                                weight: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Row(
                  children: [
                    Text(
                      'Comments',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    Text(
                      '(344)',
                      style: TextStyle(
                        color: Color(0xffed2c67),
                        fontSize: 16,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xff242424),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 22.5,
                            backgroundImage: AssetImage(
                              'assets/images/boy.png',
                            ),
                          ),
                          title: Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(600),
                              color: Color(0xffcdcdcb),
                            ),
                          ),
                          subtitle: Text(
                            '12-05-2023     12:34 P.M',
                            style: TextStyle(
                              color: Color(0xffed2c67),
                              fontSize: 11.52,
                              fontWeight: FontWeight(400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Egestas netus ultrices.Lorem ipsum dolor sit amet consectetur. Egestas.',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 14,
                              fontWeight: FontWeight(400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1, color: Color(0xff272727)),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 22.5,
                            backgroundImage: AssetImage(
                              'assets/images/girl.png',
                            ),
                          ),
                          title: Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(600),
                              color: Color(0xffcdcdcb),
                            ),
                          ),
                          subtitle: Text(
                            '12-05-2023     12:34 P.M',
                            style: TextStyle(
                              color: Color(0xffed2c67),
                              fontSize: 11.52,
                              fontWeight: FontWeight(400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Egestas netus ultrices.Lorem ipsum dolor sit amet consectetur. Egestas.',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 14,
                              fontWeight: FontWeight(400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1, color: Color(0xff272727)),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 22.5,
                            backgroundImage: AssetImage(
                              'assets/images/girl.png',
                            ),
                          ),
                          title: Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(600),
                              color: Color(0xffcdcdcb),
                            ),
                          ),
                          subtitle: Text(
                            '12-05-2023     12:34 P.M',
                            style: TextStyle(
                              color: Color(0xffed2c67),
                              fontSize: 11.52,
                              fontWeight: FontWeight(400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Egestas netus ultrices.Lorem ipsum dolor sit amet consectetur. Egestas.',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 14,
                              fontWeight: FontWeight(400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1, color: Color(0xff272727)),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(color: Color(0xffffffff)),
                        cursorColor: Color(0xffed2c67),
                        decoration: InputDecoration(
                          focusColor: Color(0xffed2c67),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xff2f2f2f)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffed2c67),
                              width: 2,
                            ),
                          ),
                          hintText: 'Write a Comment....', // Hint message
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_outward,
                              color: Color(0xffed2c67),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xff2f2f2f), // Icon on the left
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
