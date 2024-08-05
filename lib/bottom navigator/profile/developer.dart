import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Developer Name",style: TextStyle(fontSize: 20),),centerTitle: true,),
      body: Center(child: Text("ندى محمد علي دغمان",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),),
    );
  }
}