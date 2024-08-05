
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom%20navigator/app_content.dart';
import 'package:flutter_application_1/bottom%20navigator/category_list.dart';
import 'package:flutter_application_1/bottom%20navigator/profile/profile.dart';




class Home_layout extends StatefulWidget {
  const Home_layout({super.key});

  @override
  State<Home_layout> createState() => _Home_layoutState();
}

class _Home_layoutState extends State<Home_layout> {
  int currentIndex = 0;

  List<Widget> screens = [ AppContent(), CategoryList(), const Profile()];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: const Drawer(child: Icon(Icons.menu_sharp,color:  Color.fromARGB(255, 17, 36, 238),),),
       title: const Text("Explore",style: TextStyle(color:  Color.fromARGB(255, 17, 36, 238)),),
       centerTitle: true,
       actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_sharp,color:  Color.fromARGB(255, 17, 36, 238),))],
      ),
    
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 22,
          currentIndex: currentIndex,
          onTap: (index) {
           if(mounted)  setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category_sharp), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "Account"),
          ]),
    );
  }
}
