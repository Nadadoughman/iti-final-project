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
                "This application demonstrates the skills that i gained during my iti training .It features(briefly describe the key features of your app , such as user authetication using firebase and firestore ,integration with api and handling with postman,etc..)")
,SizedBox(height: 30,),
Text(style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)," I am thrilled for the opportunity to join this training and i am excited to continue building upon the foundation it has provided . i hope this application show my growth as flutter devloper and my ability to create functional and user-friendly software solutions ")

          ],
        ),
      ),
    );
  }
}
