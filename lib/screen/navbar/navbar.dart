import 'package:caliana_clone/screen/home/home_screen.dart';
import 'package:caliana_clone/screen/ticket/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with TickerProviderStateMixin {
  final List<Widget> pages = [
    const HomeScreen(),
    const TicketScreen(),
  ];
  int currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        leading: Container(
            padding: const EdgeInsets.only(left: 25),
            child: Image.asset("assets/images/Logo.png")),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 35,
                  width: 110,
                  child: const Center(
                      child: Text(
                    "User",
                  )),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48),
                      child: Image.asset('assets/images/avatar.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
               Navigator.pushNamed(context, "/notif");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.notifications_outlined),
            ),
          )
        ],
      ),
      body: PageStorage(bucket: bucket, child: currentscreen),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.white,
        spaceBetweenChildren: 10,
        icon: Icons.add,
        children: [
           SpeedDialChild(
            onTap: () {
              
            },
            label: "Pra Registrasi",
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: const CircleBorder(),
            backgroundColor: Colors.lightBlue[100],
            child: const Icon(Icons.post_add_outlined,color: Colors.blue),
          ),
          SpeedDialChild(
              onTap: () {
              Navigator.pushNamed(context, '/regist');
            },
            shape: const CircleBorder(),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
             label: "Registrasi",
             backgroundColor: Colors.lightBlue[100],
            child: const Icon(Icons.contact_page_outlined,color: Colors.blue,),
          ),
         
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 50,
        shadowColor: Colors.black,
        height: 75,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  currentscreen = const HomeScreen();
                  currentIndex = 0;
                });
              },
              minWidth: 150,
              child: Column(
                children: [
                  Icon(Icons.home_outlined,
                      color: currentIndex == 0 ? Colors.blue : Colors.grey),
                   Text("Beranda",style: TextStyle( color: currentIndex == 0 ? Colors.blue : Colors.grey),),
                ],
              ),
            ),
            MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  currentscreen = const TicketScreen();
                  currentIndex = 1;
                });
              },
              minWidth: 150,
              child: Column(
                children: [
                  Icon(Icons.confirmation_num_outlined,
                      color: currentIndex == 1 ? Colors.blue : Colors.grey),
                   Text("Tiket",style: TextStyle( color: currentIndex == 1 ? Colors.blue : Colors.grey ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
