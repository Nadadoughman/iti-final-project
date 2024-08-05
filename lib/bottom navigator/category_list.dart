import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom%20navigator/home_screen.dart';

import 'package:flutter_application_1/pages/bags.dart';
import 'package:flutter_application_1/pages/dress.dart';
import 'package:flutter_application_1/pages/frag.dart';
import 'package:flutter_application_1/pages/homeacc.dart';
import 'package:flutter_application_1/pages/menTshirt.dart';
import 'package:flutter_application_1/pages/menWatches.dart';
import 'package:flutter_application_1/pages/menshoes.dart';
import 'package:flutter_application_1/pages/skin.dart';
import 'package:flutter_application_1/pages/sports.dart';
import 'package:flutter_application_1/pages/sungglass.dart';
import 'package:flutter_application_1/pages/wShoes.dart';



class catModel {
  String? names;
  NetworkImage? imagenet;
  Widget? screen;
  catModel({this.names, this.imagenet, this.screen});
}

class CategoryList extends StatelessWidget {
  CategoryList({super.key, listofcat});

  List<catModel> listofcat = [
    catModel(
        names: "   fragrances    ",
        screen: const FragPage()),
    catModel(
        names: "womens-bags",
        screen: const Bags()),
    catModel(names: "womens-dresses", screen: const Dress()),
    catModel(names: "skin-care", screen: const SkinCare()),
    catModel(names: "womens-shoes", screen: const WomenShoes()),
    catModel(names: "sunglasses", screen: const Sunglass()),
    catModel(names: "mens-shirts", screen: const Mentshirt()),
    catModel(names: "mens-shoes", screen: const Menshoes()),
    catModel(names: "mens-watches", screen: const Menwatches()),
    catModel(names: "sports-accessories", screen: const Sports()),
    catModel(names: "home-decoration", screen: const Homeaccessory()),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("Categories"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home_layout()));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: GridView.builder(
          itemCount: listofcat.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 7, mainAxisSpacing: 7),
          itemBuilder: (context, index) {
            return buildCategories(model: listofcat[index], context: context);
          }),
    );
  }

  Widget buildCategories(
      {required catModel model, required BuildContext context}) {
    return MaterialButton(
        onPressed: () {
          if (model.screen != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => model.screen!),
            );
          }
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          elevation: 5,
          child: Column(
            children: [
              Image.asset(
                "images/shop.png",
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  model.names!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
