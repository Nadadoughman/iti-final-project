// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    final List<Product>? products;
    final int? total;
    final int? skip;
    final int? limit;

    CategoryModel({
        this.products,
        this.total,
        this.skip,
        this.limit,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    final int? id;
    final String? title;
    final double? price;
    final String? category;
    final String? description;
    final String? thumbnail;

    Product({
        this.id,
        this.title,
        this.price,
        this.category,
        this.description,
        this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        category: json["category"],
        description: json["description"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "category": category,
        "description": description,
        "thumbnail": thumbnail,
    };
}
