import 'package:flutter/material.dart';

class MusicSlider extends StatefulWidget {
  const MusicSlider({super.key});

  @override
  State<MusicSlider> createState() => _MusicSliderState();
}

class _MusicSliderState extends State<MusicSlider> {
  double currentValue = 0;
  double totalDuration = 180; // 👈 total seconds (3 minutes)

  String formatTime(double seconds) {
    int min = seconds ~/ 60;
    int sec = (seconds % 60).toInt();
    return "$min:${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🎵 Slider
        Slider(
          value: currentValue,
          min: 0,
          max: totalDuration,
          activeColor: Color(0xffed2c67),
          inactiveColor: Colors.grey,
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
          },
        ),

        // ⏱ Time Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatTime(currentValue), // current time
                style: TextStyle(color: Colors.white),
              ),
              Text(
                formatTime(totalDuration), // total time
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}