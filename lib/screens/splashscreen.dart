import 'package:flutter/material.dart';
import 'package:pokeman_app/screens/auth/loginwidget.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return extrascreen();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF009946),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 180,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(90)),
                      color: Colors.white12),
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.white10),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 30),
              padding: EdgeInsets.only(right: 30),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white10),
            ),
          ),
          Stack(
            children: [
              Align(
                //alignment: Alignment.bottomRight,
                child: Container(
                  width: 50,
                  height: 50,
                  //  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.white10),
                ),
              ),
              Positioned(
                  left: 30,
                  right: 330,
                  top: -3,
                  child: Container(
                    width: 50,
                    height: 50,
                    //  alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.white10),
                  )),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 60),
              padding: EdgeInsets.only(right: 30),
              width: 70,
              height: 70,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white10),
            ),
          ),
          Center(
              child: Image.asset(
            "images/logo.png",
            width: 350,
            height: 180,
          )),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 50,
              height: 50,
              // alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white10),
            ),
          ),
          Align(
            alignment: Alignment(0.9, 3),
            child: Container(
              // margin: EdgeInsets.only(right: 20, bottom: 10),
              //padding:  EdgeInsets.only(right: 30),
              width: 65,
              height: 65,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white10),
            ),
          ),
          Align(
            alignment: Alignment(-0.2, 0.6),
            child: Container(
              // padding: EdgeInsets.only(bottom: 50),
              width: 60,
              height: 60,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white10),
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.white10),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.white10),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 180,
                  height: 150,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(90)),
                      color: Colors.white12),
                ),
              ),
            ],
          )),
        ],
      ),

      // Image(image: AssetImage('assets/images/logo1.png'))
    ));
  }
}
