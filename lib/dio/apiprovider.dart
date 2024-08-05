import 'package:dio/dio.dart';
import 'package:flutter_application_1/dio/model.dart';

class ApiProvider {
  CategoryModel? bagModel;
  CategoryModel? dressModel;
  CategoryModel? fragModel;
  CategoryModel? homeaccModel;
  CategoryModel? menShoesModel;
  CategoryModel? mentshirtModel;
  CategoryModel? watchesModel;
  CategoryModel? skinModel;
  CategoryModel? sportsModel;
  CategoryModel? sunglassModel;
  CategoryModel? wshoesModel;
  CategoryModel? products;
  String baseUrl = "https://dummyjson.com/products/category";


Future<CategoryModel?> getfProducts() async {
    try {
     
      Response response = await Dio().get("https://dummyjson.com/products",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      products = CategoryModel.fromJson(response.data);
      print(response.data);
      return products;
    } catch (e) {
      print(e);
    }
  }


  Future<CategoryModel?> getBags() async {
  try {
    Response response = await Dio().get(
      "$baseUrl/womens-bags",
      queryParameters: {
        "select": "id,title,price,category,description,thumbnail"
      },
    );

    if (response.statusCode == 200) {
      // Successful response
      return CategoryModel.fromJson(response.data);
    } else {
      // Handle non-200 status codes (e.g., throw an exception)
      throw Exception("API request failed with status code: ${response.statusCode}");
    }
  } catch (e) {
    print(e); // Log the error for debugging
    rethrow; // Rethrow the exception for proper error handling
  }

  // Return null only if there's an error or unexpected response
  return null;
}

  Future<CategoryModel?> getdresses() async {
    try {
      Response response = await Dio().get("$baseUrl/womens-dresses",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      dressModel = CategoryModel.fromJson(response.data);
      return dressModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getfrag() async {
    try {
      Response response = await Dio().get("$baseUrl/fragrances",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      fragModel = CategoryModel.fromJson(response.data);
      return fragModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getHomeacc() async {
    try {
      Response response = await Dio().get("$baseUrl/home-decoration",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      homeaccModel = CategoryModel.fromJson(response.data);
      return homeaccModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getmenShoes() async {
    try {
      Response response = await Dio().get("$baseUrl/mens-shoes",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      menShoesModel = CategoryModel.fromJson(response.data);
      return menShoesModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getmenTshirt() async {
    try {
      Response response = await Dio().get("$baseUrl/mens-shirts",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      mentshirtModel = CategoryModel.fromJson(response.data);
      return mentshirtModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getwatches() async {
    try {
      Response response = await Dio().get("$baseUrl/mens-watches",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      watchesModel = CategoryModel.fromJson(response.data);
      return watchesModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getskin() async {
    try {
      Response response = await Dio().get("$baseUrl/skin-care",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      skinModel = CategoryModel.fromJson(response.data);
      return skinModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getsports() async {
    try {
      Response response = await Dio().get("$baseUrl/sports-accessories",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      sportsModel = CategoryModel.fromJson(response.data);
      return sportsModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getsunglasses() async {
    try {
      Response response = await Dio().get("$baseUrl/sunglasses",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      sunglassModel = CategoryModel.fromJson(response.data);
      return sunglassModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CategoryModel?> getwomenshoes() async {
    try {
      Response response = await Dio().get("$baseUrl/womens-shoes",
          queryParameters: {
            "select": "id,title,price,category,description,thumbnail"
          });
      wshoesModel = CategoryModel.fromJson(response.data);
      return wshoesModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

 
}
