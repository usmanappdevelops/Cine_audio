import 'package:cine_audio/Screens/homescreen/modalnotification.dart';
import 'package:flutter/material.dart';

class DeletedScreen extends StatefulWidget {
  final List<NotificationModel> deletedList;

   const DeletedScreen({super.key, required this.deletedList});

  @override
  State<DeletedScreen> createState() => _DeletedScreenState();
}

class _DeletedScreenState extends State<DeletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff0d0d0d),
      appBar: AppBar(
        backgroundColor:  Color(0xff272727),
        title:  Text(
          "Deleted",
          style: TextStyle(color: Color(0xffffffff)),
        ),
      ),
      body: widget.deletedList.isEmpty
          ?  Center(
              child: Text(
                "No Deleted Items",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: widget.deletedList.length,
              itemBuilder: (context, index) {
                final item = widget.deletedList[index];

                return ListTile(
                  leading: Icon(item.icon, color: Color(0xffffffff)),

                  title: Text(
                    item.title,
                    style:  TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    item.subtitle,
                    style:  TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
    );
  }
}
