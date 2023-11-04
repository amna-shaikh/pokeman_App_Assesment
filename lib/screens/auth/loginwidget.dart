import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pokeman_app/screens/auth/createaccount.dart';
import 'package:pokeman_app/screens/auth/loginscreen.dart';

class extrascreen extends StatefulWidget {
  const extrascreen({Key? key}) : super(key: key);
  @override
  State<extrascreen> createState() => _extrascreenState();
}

class _extrascreenState extends State<extrascreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 20,
                          blurRadius: 100,
                          offset: Offset(
                            0,
                            15,
                          )
                      )
                    ],
                    color: Color(0xFF009946),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                ),
                child: Align(
                  alignment: Alignment(0,-0.2),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 75,
                    child: Image.asset("images/logo.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
              ),
            ),
      
           Positioned(
             left: -5,
              top: 300,
              // bottom: 0,
              child: Container(
                margin: EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 30,
                  //  bottom: 15
                ),
                height: 400,
                width: 370,

                child:   Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 20,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Newloginwidget(),
                       createAccount()
                      ],
                    ),
                  ),
                ),


              ),
            ),

           Positioned(
              top: 280,
              left: 70,
              right: 60,
              child:  Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Color(0xFF009946),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Login',
                  ),
                  Tab(
                    text: 'Sign up',
                  ),
                ],
              ),
            ),),



            Align(
              alignment: Alignment(0,.95),
              child: Container(
                height: 20,
               // width: double.infinity,
                color: Color(0xFF36B084),
              ),
            ),
                    Align(
                       alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 25,
                          width: double.infinity,
                      color: Color(0xFF009946),
                    ))

          ],
        ),
      ),

    ) ;
  }
}
