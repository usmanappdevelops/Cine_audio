import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cine_audio/Screens/detailscreen.dart';
import 'package:cine_audio/Screens/homescreen/films.dart';
import 'package:cine_audio/Screens/homescreen/notification.dart';
import 'package:cine_audio/Screens/homescreen/religious.dart';
import 'package:cine_audio/Screens/homescreen/series.dart';
import 'package:cine_audio/Screens/homescreen/podcast.dart';
import 'package:cine_audio/Screens/homescreen/sports.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget movieSection(String title, List<dynamic> items) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text("View All", style: TextStyle(color: Color(0xffED2C67))),
            ],
          ),
        ),

        SizedBox(height: 10),

        SizedBox(
          height: 200,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,

            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 150,
                margin: const EdgeInsets.only(left: 16),

                child: Material(
                  color: const Color(0xff272727),
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAlias, // ✅ FIX: ripple clipping

                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen()),
                      );
                    },

                    child: Padding(
                      padding: const EdgeInsets.all(8),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Image.asset(
                              item.image,
                              height: 120,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            item.title,
                            style: TextStyle(color: Colors.white),
                          ),

                          Text(
                            item.episodes,
                            style: TextStyle(color: Color(0xffED2C67)),
                          ),

                          Row(
                            children: List.generate(
                              item.rating.round(),

                              (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget seriesScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),

          movieSection("For You", contentList),

          SizedBox(height: 20),

          movieSection("Top Searches", contentList),

          SizedBox(height: 20),

          movieSection("Recommended", contentList),
        ],
      ),
    );
  }

  Widget podcastScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),

          movieSection("For You", contentList1),

          SizedBox(height: 20),

          movieSection("Top Searches", contentList1),

          SizedBox(height: 20),

          movieSection("Recommended", contentList1),
        ],
      ),
    );
  }

  Widget filmScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),

          movieSection("For You", contentList2),

          SizedBox(height: 20),

          movieSection("Top Searches", contentList2),

          SizedBox(height: 20),

          movieSection("Recommended", contentList2),
        ],
      ),
    );
  }

  Widget sportsScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),

          movieSection("For You", contentList3),

          SizedBox(height: 20),

          movieSection("Top Searches", contentList3),

          SizedBox(height: 20),

          movieSection("Recommended", contentList3),
        ],
      ),
    );
  }

  Widget religiousScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),

          movieSection("For You", contentList4),

          SizedBox(height: 20),

          movieSection("Top Searches", contentList4),

          SizedBox(height: 20),

          movieSection("Recommended", contentList4),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,

      child: Scaffold(
        backgroundColor: Color(0xff181818),

        appBar: AppBar(
          backgroundColor: Color(0xff181716),

          leading: Image.asset('assets/images/Cineaudio.png'),

          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Hassan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              Text(
                'Welcome back!',
                style: TextStyle(color: Color(0xffED2C67), fontSize: 14),
              ),
            ],
          ),

          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.notifications, color: Color(0xffed2c67)),
              ),
            ),
          ],
        ),

        body: Column(
          children: [
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: TextField(
                style: TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Search Here!",
                  hintStyle: TextStyle(color: Colors.grey),

                  prefixIcon: Icon(Icons.search, color: Colors.grey),

                  filled: true,
                  fillColor: Color(0xff272727),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            ButtonsTabBar(
              backgroundColor: Color(0xffED2C67),

              unselectedBackgroundColor: Color(0xff272727),

              labelStyle: TextStyle(color: Colors.white),

              unselectedLabelStyle: TextStyle(color: Colors.grey),

              tabs: [
                Tab(text: "Series"),
                Tab(text: "Podcast"),
                Tab(text: "Films"),
                Tab(text: "Sports"),
                Tab(text: "Religious"),
              ],
            ),

            SizedBox(height: 10),

            Expanded(
              child: TabBarView(
                children: [
                  seriesScreen(),

                  podcastScreen(),

                  filmScreen(),

                  sportsScreen(),

                  religiousScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
