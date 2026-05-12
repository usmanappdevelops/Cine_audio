import 'package:cine_audio/Screens/profile/finalprofile.dart';
import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff272727),
            borderRadius: BorderRadius.circular(42),
            border: Border.all(color: Color(0xffed2c67), width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Icon
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffed2c67), width: 1),
                ),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Color(0xffed2c67),
                  size: 30,
                ),
              ),

              SizedBox(height: 15),

            
              Text(
                "Subscription Successful",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffcdcdcb),
                  fontSize: 20,
                  fontWeight: FontWeight(700),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

 
  Future.delayed(Duration(seconds: 3), () {
    Navigator.pop(context); 

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Finalprofile()),
    );
  });
}
