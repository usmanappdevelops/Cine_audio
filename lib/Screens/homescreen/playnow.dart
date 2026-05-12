// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cine_audio/Screens/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Playnow extends StatefulWidget {
  const Playnow({super.key});

  @override
  State<Playnow> createState() => _PlaynowState();
}

class _PlaynowState extends State<Playnow> {
  double currentValue = 15.2;

  /// 🔹 Comment Controller
  final TextEditingController commentController = TextEditingController();

  /// 🔹 Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// 🔹 Add Comment to Firebase
  Future<void> addComment() async {
    if (commentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please write a comment")));
      return;
    }

    try {
      await firestore.collection("comments").add({
        "name": "John Doe",
        "comment": commentController.text.trim(),
        "image": "https://i.pravatar.cc/150?img=3",
        "createdAt": Timestamp.now(),
      });

      commentController.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d0d0d),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 🔹 Top Bar
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xffed2c67),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
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
                  padding: const EdgeInsets.all(3.36),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffED2C67), Color(0xff4a1022)],
                    ),
                    borderRadius: BorderRadius.circular(43.69),
                  ),
                  child: Container(
                    width: 369,
                    height: 445,
                    decoration: BoxDecoration(
                      color: const Color(0xff0d0d0d),
                      borderRadius: BorderRadius.circular(43.69),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 200, top: 15),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert_rounded,
                              size: 33,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const CircleAvatar(
                          radius: 65,
                          backgroundColor: Color(0xffed2c67),
                          child: CircleAvatar(
                            radius: 64,
                            backgroundImage: AssetImage(
                              'assets/images/podcast.png',
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Sunday Podcast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Slider(
                          activeColor: const Color(0xffed2c67),
                          inactiveColor: const Color(0xff736d6d),
                          value: currentValue,
                          min: 0,
                          max: 90,
                          onChanged: (double value) {
                            setState(() {
                              currentValue = value;
                            });
                          },
                        ),

                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentValue.toStringAsFixed(2),
                                style: const TextStyle(
                                  color: Color(0xff736D6D),
                                ),
                              ),
                              const Text(
                                '90 minutes',
                                style: TextStyle(color: Color(0xff736D6D)),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage('assets/images/playback.png'),
                              width: 24.22,
                              height: 23.63,
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: const Image(
                                image: AssetImage(
                                  'assets/images/Stop_fill.png',
                                ),
                                width: 58,
                                height: 58,
                              ),
                            ),

                            const Image(
                              image: AssetImage('assets/images/play.png'),
                              width: 24.22,
                              height: 23.63,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🔹 Comments Heading
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Row(
                  children: const [
                    Text(
                      'Comments ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// 🔹 Comments Section
              Container(
                width: 340,
                decoration: BoxDecoration(
                  color: const Color(0xff242424),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  children: [
                    /// 🔹 Comments List from Firebase
                    StreamBuilder<QuerySnapshot>(
                      stream: firestore
                          .collection("comments")
                          .orderBy("createdAt", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(
                              color: Color(0xffed2c67),
                            ),
                          );
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "No Comments Yet",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index];

                            Timestamp timestamp = data['createdAt'];

                            DateTime date = timestamp.toDate();

                            String formattedDate = DateFormat(
                              'dd-MM-yyyy   hh:mm a',
                            ).format(date);

                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 22.5,
                                    backgroundImage: NetworkImage(
                                      data['image'],
                                    ),
                                  ),

                                  title: Text(
                                    data['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffcdcdcb),
                                    ),
                                  ),

                                  subtitle: Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      color: Color(0xffed2c67),
                                      fontSize: 11.52,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 15,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['comment'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),

                                const Divider(color: Color(0xff2f2f2f)),
                              ],
                            );
                          },
                        );
                      },
                    ),

                    /// 🔹 Comment TextField
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: commentController,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xffed2c67),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff2f2f2f),
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffed2c67),
                              width: 2,
                            ),
                          ),

                          hintText: 'Write a Comment....',

                          hintStyle: const TextStyle(color: Colors.grey),

                          suffixIcon: IconButton(
                            onPressed: () async {
                              await addComment();
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Color(0xffed2c67),
                            ),
                          ),

                          filled: true,
                          fillColor: const Color(0xff2f2f2f),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
