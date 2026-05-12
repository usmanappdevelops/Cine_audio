import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, color: Colors.pink, size: 14),
            ),
            SizedBox(width: 6),
            Text(title, style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          children: [
            Text(
              "Category",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down, color: Color(0xffed2c67)),
            ),
          ],
        ),
      ],
    ),
  );
}

// 🔹 Live Card
Widget liveCard(BuildContext context, VoidCallback onTap) {
  return InkWell(
    onTap: onTap, 
    borderRadius: BorderRadius.circular(12),
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff1c1c1e),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/sportlogo.png'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pakistan Sports Board",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      "Category: ",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      "Sports",
                      style: TextStyle(color: Color(0xffed2c67), fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  '12:30 P.M - 01:40 P.M',
                  style: TextStyle(fontSize: 9, color: Color(0xff989898)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "Live",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    ),
  );
}
