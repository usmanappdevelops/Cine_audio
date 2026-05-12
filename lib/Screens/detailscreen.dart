
import 'package:cine_audio/Screens/homescreen/playnow.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff181818),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/podcast.png'),
                      width: 430,
                      height: 269,
                    ),
                  ),

                  Positioned(
                    top: 31,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xffed2c67),
                        size: 35,
                        weight: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 31,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline_outlined,
                        color: Color(0xffed2c67),
                        size: 21,
                        weight: 21,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sunday Podcast',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 22),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xfff1c644),
                      size: 13.54,
                      weight: 13.54,
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
                      '2 hr 22 min',
                      style: TextStyle(
                        color: Color(0xffed2c67),
                        fontSize: 18,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                    Text(
                      '4.5 M',
                      style: TextStyle(
                        color: Color(0xffed2c67),
                        fontSize: 18,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(color: Color(0xffed2c67)),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 18,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    Text(
                      '1 yr Ago',
                      style: TextStyle(
                        color: Color(0xffed2c67),
                        fontSize: 18,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 17, right: 17),
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Viverra justo nunc nunc in ullamcorper lacinia fermentum nibh at. Porta tortor vel mi iaculis. Diam natoque montes placerat dolor ligula mollis convallis in at.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight(400),
                    color: Color(0xffc1b9b9),
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
                      'Read More',
                      style: TextStyle(
                        color: Color(0xffed2c67),
                        fontSize: 12,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Language',
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
              Divider(color: Color(0xffed2c67)),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 13,
                  bottom: 13,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xffed2c67)),
                    borderRadius: BorderRadius.circular(11),
                    color: Color(0xff0d0d0d),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Download',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 13,
                  bottom: 25,
                  right: 40,
                  left: 40,
                ),
                child: Container(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Playnow()),
                      );
                    },
                    child: Text(
                      'Play Now',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
