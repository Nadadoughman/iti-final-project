import 'package:flutter/material.dart';

class Mytextbox extends StatelessWidget {
   const Mytextbox({super.key, required this.text, required this.sectionName});
  final String text;
  final String sectionName;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15,bottom: 15),
      margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(sectionName,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        Text(text,style: const TextStyle(fontSize: 15),)
      ],),
    );
  }
}