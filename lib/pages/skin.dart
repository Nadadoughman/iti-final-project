import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom%20navigator/category_list.dart';
import 'package:flutter_application_1/dio/apiprovider.dart';
import 'package:flutter_application_1/dio/model.dart';
import 'package:fluttertoast/fluttertoast.dart';



class SkinCare extends StatefulWidget {
  const SkinCare({super.key});

  @override
  State<SkinCare> createState() => _SkinCareState();
}

class _SkinCareState extends State<SkinCare> {
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
      bagModel = await _apiProvider.getskin();
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
                                    builder: (context) => CategoryList()));}, icon: const Icon(Icons.arrow_back)),),
                                     body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(7),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Search")
                  ],
                ),
              ),
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
                            return buildproductItem(product:bagModel!.products![index]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemCount: bagModel!.products!.length,
                        )
                      : const Center(child: Text('No products found')),
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
            SizedBox(height: 5,),
            Text("${product.price.toString()}\$",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
            Row(
              children: [
                Expanded(
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor:
                                  Color.fromARGB(255, 17, 36, 238),
                              onPressed: () {
                              
                              },
                              child: Icon(
                                Icons.add,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              mini: true,
                            ),
                            SizedBox(width: 10,),
                            Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,),
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor:
                                   Color.fromARGB(255, 17, 36, 238),
                              onPressed: () {
                              },
                              child: Icon(
                                Icons.remove,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              mini: true,
                            ),
                            IconButton(onPressed: (){Fluttertoast.showToast(
        msg: "Cart will be active soon",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 255, 95, 95),
        textColor: Colors.white,
        fontSize: 16.0
    );}, icon: Icon(Icons.add_shopping_cart_outlined,size: 30,color:Color.fromARGB(255, 17, 36, 238) ,))
                          ],
                        ),),
              ],
            )
          ],
        ),
      )
    ],
  );
}
}


