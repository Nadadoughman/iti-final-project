import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom%20navigator/profile/about.dart';
import 'package:flutter_application_1/bottom%20navigator/profile/developer.dart';
import 'package:flutter_application_1/bottom%20navigator/profile/cart.dart';
import 'package:flutter_application_1/bottom%20navigator/profile/textbox.dart';
import 'package:flutter_application_1/login/login.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore firestoredata=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(stream: FirebaseFirestore.instance.collection("users").doc(currentuser.uid).snapshots(),
        builder: (context, snapshot) {
         if (snapshot.hasData && snapshot.data!.data() != null){
            final userdata=snapshot.data!.data() as Map<String,dynamic>;
            return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Icon(
          Icons.person,
          size: 80,
        ),
        //user email 
        Text(
          currentuser.email!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text("My Details",style: TextStyle(color: Colors.grey[600]),),
        ),
        //firstname
        Mytextbox(text: userdata["firstName"], sectionName: "firstName"),
        //lastname
        Mytextbox(text: userdata["lastName"], sectionName: "LastName"),
        //age
        Mytextbox(text: userdata["age"].toString(), sectionName: "Age"),
        const SizedBox(height: 10,),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(width: double.infinity,child: MaterialButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Carts()),
                           );},
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("My Cart",style: TextStyle(fontSize: 20,color: Colors.black),),Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          )),
        ), 

// Contact Us
          Divider(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(width: double.infinity,child: MaterialButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Developer()),
                           );},
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Contact Us",style: TextStyle(fontSize: 20,color: Colors.black),),Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          )),
        ),

        
// About
          Divider(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(width: double.infinity,child: MaterialButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
                           );},
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(" About",style: TextStyle(fontSize: 20,color: Colors.black),),Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          )),
        ),

        
        IconButton(onPressed: () async{
         await FirebaseAuth.instance.signOut();
         Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
       }, icon: const Icon(Icons.exit_to_app,size: 40,))
        
      ],
    );
            
            } else if(snapshot.hasError){
              return Center(child: Text("erroe${snapshot.error}"),);
            } 
           
          return const Center(child:CircularProgressIndicator() );
        }
        
        
        
         ,));
         
  }
}
