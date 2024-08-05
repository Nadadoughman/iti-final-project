import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom%20navigator/profile/profile.dart';
import 'package:flutter_application_1/dio/apiprovider.dart';
import 'package:flutter_application_1/dio/model.dart';



class Carts extends StatefulWidget {
  const Carts({super.key});
  

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final ApiProvider _apiProvider = ApiProvider();
  bool isLoading=true;
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
      bagModel = await _apiProvider.getBags();
       if(mounted)setState(() {
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
    return Scaffold(appBar: AppBar(leading: IconButton(onPressed: (){Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));}, icon: const Icon(Icons.arrow_back)),),
                                    body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 10,
              ),
            isLoading == true? Center(child: CircularProgressIndicator()): 
              (bagModel?.products != null) ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildproductItem(product:bagModel!.products![4]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemCount: bagModel!.products!.length,
                        )
                      : const Center(child: Text('No products found')),
                      SizedBox(height: 60,),
                      Container(width: double.infinity, color : Color.fromARGB(255, 17, 36, 238) ,child:  MaterialButton(onPressed: (){},child: Text("Buy Now  \$200.9",style: TextStyle(fontSize: 20,color: Colors.white),),))
            ],
          ),
        ),
      ),
    );
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
             
            Text(product.title!,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
           
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(height: 10,),
            Text("${product.price.toString()}\$",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                 Text("                            1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              
               
              ],
            )
          ],
        ),
      )
    ],
  );
}

}

