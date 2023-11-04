import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 290,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFF009946),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("images/logo.png"),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              "POKEDEX",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 230,
                  height: 800,
                  left: 30,
                  right: 30,
                  child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 8.0,
                      children: [
                        Custombox(text: "Homework", icon: Icons.home_work),
                        Custombox(text: "Assignment", icon: Icons.home_work),
                        Custombox(
                            text: "Attendance",
                            icon: Icons.account_balance_outlined),
                        Custombox(text: "Fees", icon: Icons.person),
                        Custombox(text: "Examination", icon: Icons.home_work),
                        Custombox(
                            text: "Documents", icon: Icons.document_scanner),
                        Custombox(text: "Fees", icon: Icons.home_work),
                        Custombox(text: "Examination", icon: Icons.home_work),
                        Custombox(
                            text: "Documents", icon: Icons.document_scanner),
                        Custombox(
                            text: "Fees", icon: Icons.notifications_active),
                        Custombox(text: "Timeline", icon: Icons.home_work),
                        Custombox(text: "Status", icon: Icons.document_scanner),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}

class Custombox extends StatelessWidget {
  String text;
  IconData icon;
  Custombox({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      height: 100,
      width: double.infinity,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 32,
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: Text(text, style: TextStyle(fontSize: 10)))
        ],
      ),
    );
  }
}
