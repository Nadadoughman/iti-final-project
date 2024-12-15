import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Project Overview",
              
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromARGB(255, 17, 36, 238),
              ),
            ),
            SizedBox(height: 20,),
            Text(style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                "An intuitive and feature-rich e-commerce app designed for seamless online shopping experiences. The app includes user-friendly login and registration pages integrated with Firebase to securely store and manage user data. It features personalized user profiles displaying saved information and order history.")
,SizedBox(height: 30,),
Text(style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)," The app is powered by an API to fetch real-time product data, ensuring updated and accurate inventory ")

          ],
        ),
      ),
    );
  }
}
