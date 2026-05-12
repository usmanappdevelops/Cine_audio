

import 'package:flutter/material.dart';

class NotificationModel {
  
  String title;
  String subtitle;
  IconData icon;

  NotificationModel({
   
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

List<NotificationModel> notifications = [
  NotificationModel(
    title: "Reminder",
    subtitle: "Lorem ipsum dolor sit amet consectetur Viverra justo.",
    icon: Icons.notifications_none,
  ),
  NotificationModel(
    title: "Comments",
    subtitle: "Lorem ipsum dolor sit amet consectetur Viverra justo.",
    icon: Icons.send,
  ),
  NotificationModel(
    title: "Comments",
    subtitle: "Lorem ipsum dolor sit amet consectetur Viverra justo.",
    icon: Icons.send,
  ),
  NotificationModel(
    title: "Comments",
    subtitle: "Lorem ipsum dolor sit amet consectetur Viverra justo.",
    icon: Icons.send,
  ),
  NotificationModel(
    title: "Comments",
    subtitle: "Lorem ipsum dolor sit amet consectetur Viverra justo.",
    icon: Icons.send,
  ),
];