import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom%20navigator/category_list.dart';
import 'package:flutter_application_1/dio/apiprovider.dart';
import 'package:flutter_application_1/dio/model.dart';
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

class AppContent extends StatefulWidget {
  AppContent({super.key});
  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  CategoryModel? productModel;
  bool isLoading = true;
  List<catModel> listofcat = [
    catModel(names: "   fragrances    ", screen: const FragPage()),
    catModel(names: "womens-bags", screen: const Bags()),
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

    final ApiProvider _apiProvider = ApiProvider();
 
  CategoryModel? bagModel;
  String? errorMessage;
  
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try  
{
      bagModel = await _apiProvider.getfProducts();
      if(mounted) setState(() {
        isLoading = false;
        errorMessage = null; // Clear any previous error message
      });
    } catch (error) {
      if(mounted) setState(() {
        isLoading = false;
        errorMessage = error.toString(); // Display error message
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBar(
              leading: Icon(Icons.search),
              hintText: "Search",
            ),
            const SizedBox(
              height: 10,
            ),
           
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                //  Image.asset("images/newa.png"),
                  SizedBox(
                    height: 20,
                  ),


                 
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(13),
               child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 65, 44, 37)),
                        ),
                        TextButton(onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryList()),
                           ); }, child: Text("see all",style: TextStyle(fontStyle: FontStyle.italic),selectionColor: Colors.cyan,))
                      ],
                    ),
             ),
            SizedBox(
              height: 150,
              child:
                  //  isLoading == true
                  //   ? CircularProgressIndicator():
                  ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return buildCategories(
                            model: listofcat[index], context: context);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: listofcat.length),
            ),

             (bagModel?.products != null) ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildproductItem(product:bagModel!.products![index]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemCount: bagModel!.products!.length,
                        ) : const Center(child: Text('No products found')),

            
           
         
          ],
          
        ),
      ),
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
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Color.fromARGB(128, 240, 236, 236),
            child: Image.asset(
              "images/shop.png",
            
            ),
          ),
          Text(model.names!)
        ],
      ),
    );
  }
}



Widget buildproductItem({required Product product}) {
  return Row(
    children: [
    
        
      
  
          CircleAvatar(
              radius: 55, backgroundImage: NetworkImage(product.thumbnail!)),
          

      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title!,style: TextStyle(fontWeight: FontWeight.w700),),
            Row(
              children: [
                Expanded(
                    child: Text(
                  product.description!,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                )),
              
               
              ],
            )
          ],
        ),
      )
    ],
  );
}


