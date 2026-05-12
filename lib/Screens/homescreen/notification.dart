import 'package:cine_audio/Screens/homescreen/deleted.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'modalnotification.dart';

class NotificationsScreen extends StatefulWidget {
   const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> activeList = List.from(notifications);
  List<NotificationModel> deletedList = [];

  void deleteItem(int index) {
    setState(() {
      deletedList.add(activeList[index]);
      activeList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff0d0d0d),
      body: SafeArea(
        child: Column(
          children: [
            
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon:  Icon(Icons.arrow_back_ios, color: Colors.pink),
                  ),
                   Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DeletedScreen(deletedList: deletedList),
                        ),
                      );
                    },
                    icon:  Icon(Icons.delete_outline, color: Colors.pink),
                  ),
                ],
              ),
            ),

            
            Expanded(
              child: ListView.builder(
                itemCount: activeList.length,
                padding:  EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final item = activeList[index];

                  return Padding(
                    padding:  EdgeInsets.only(bottom: 12),

                    
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion:  DrawerMotion(),

                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              deleteItem(index);
                            },
                            backgroundColor: Colors.red.shade700,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ],
                      ),

                      child: Container(
                        padding:  EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color:  Color(0xff1c1c1e),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(item.icon, color: Color(0xffed2c67), size: 20),
                             SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style:  TextStyle(
                                      color: Color(0xffed2c67),
                                      fontSize: 15,
                                    ),
                                  ),
                                   SizedBox(height: 6),
                                  Text(
                                    item.subtitle,
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
