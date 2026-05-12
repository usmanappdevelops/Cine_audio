import 'package:cine_audio/Screens/live%20tv/widget.dart';
import 'package:flutter/material.dart';

class LiveTvScreen extends StatelessWidget {
  const LiveTvScreen({super.key});
  void showBottomDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xff0d0d0d), // dark background like your app
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // make height flexible
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            // you can adjust height or make dynamic
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/cricket.png",
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.black.withOpacity(
                        0.8,
                      ), // semi-transparent overlay
                    ),
                    Positioned(
                      top: 150,
                      left: 19,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 17,
                                width: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffed2c67),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    'Live',
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '12:30 P.M - 01:40 P.M',
                                style: TextStyle(
                                  color: Color(0xffeedede),
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Text(
                            "Pakistan Sports Board",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Category:',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Sports',
                                style: TextStyle(
                                  color: Color(0xffed2c67),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet consectetur.\n Egestas netus ultrices.Lorem ipsum dolor sit\n amet consectetur. Egestas.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffb2adad),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: Color(0xffed2c67)),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.play_circle_fill, color: Colors.pink),
                  title: Text(
                    "Watch Live",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                Divider(color: Color(0xffed2c67)),
                ListTile(
                  leading: Icon(Icons.download, color: Colors.pink),
                  title: Text(
                    "Download Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                Divider(color: Color(0xffed2c67)),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.pink),
                  title: Text("Save", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d0d0d),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffed2c67),
                      size: 20,
                    ),
                  ),
                  Text(
                    "Live Tv",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.notifications_none, color: Color(0xffed2c67)),
                ],
              ),
            ),

            Container(
              height: 333,
              width: 391,
              decoration: BoxDecoration(
                color: Color(0xff272727),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(21),
                    child: Image(
                      image: AssetImage('assets/images/cricket.png'),
                    ),
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage('assets/images/sportlogo.png'),
                    ),
                    title: Text(
                      'Pakistan Sports Board',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffffffff),
                              ),
                            ),
                            Text(
                              'Sports',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffed2c67),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '12:30 P.M - 01:40 P.M',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xff989898),
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      height: 20,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffed2c67),
                      ),
                      child: Center(
                        child: Text(
                          'Live',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  sectionTitle("Live Now"),
                  ...List.generate(
                    3,
                    (index) =>
                        liveCard(context, () => showBottomDialog(context)),
                  ),

                  sectionTitle("One Hour Later"),
                  ...List.generate(
                    2,
                    (index) =>
                        liveCard(context, () => showBottomDialog(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
