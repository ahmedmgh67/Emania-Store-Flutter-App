//https://jsonplaceholder.typicode.com/posts
//https://emania.000webhostapp.com/wp-json/wc/v3/products
//https://emania.000webhostapp.com/wp-json/wc/v3/products?consumer_key=ck_196b5a3683683f2f41a27d8fbc668b771b7a4ee5&consumer_secret=cs_724d274fcbc12eccb4043848af53a7514a019690
import 'package:flutter/material.dart';
import 'package:emania/custom_icons.dart';
import 'package:emania/models/category.dart';
import 'package:emania/models/product.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
//import 'package:http/io_client.dart';
import 'dart:convert';
  //List<Product> product;

  List<Product> products;
  List<Product> getProducts(){
    return products;
  }
//ec2-18-223-159-157.us-east-2.compute.amazonaws.com/api/products

  

  void request(Function a) async {
    // var c = HttpClient();
    // c.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    // var i = IOClient(c);
    var json = await http.get("http://ec2-18-223-159-157.us-east-2.compute.amazonaws.com/api/products");
    var decoded = jsonDecode(json.body);
    print(decoded);
    for (var i = 0; i < decoded.length; i++) {
      print("adding");
      products.add(
        Product(decoded[i]["image"][0],decoded[i]["name"],decoded[i]["price"],"",Category("name", Icons.ac_unit),i));  
    }
    a();
    print("the products $products");
    //products = product;
    //return products==null ? false: true;
  }
class Data {


  static List<Category> categories = [
    Category("Plant", CustomIcons.plant),
    Category("Lamp", CustomIcons.desk_lamp),
    Category("Chair", CustomIcons.chair),
    Category("Other", Icons.timeline)
  ];



  // static List<Product> products = [
  //   Product(
  //       "https://images.pexels.com/photos/112811/pexels-photo-112811.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //       "Elegant Lamp",
  //       13.00,
  //       "Both practical and beautiful, this lamp is a great addition to any workspace",
  //       getCategoryFromName("Lamp"),
  //       0),
  //   Product(
  //       "https://images.pexels.com/photos/509922/pexels-photo-509922.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //       "Traditional Chair",
  //       23.00,
  //       "A traditional chair, suitable for any application",
  //       getCategoryFromName("Chair"),
  //       1),
  //   Product(
  //       "https://images.pexels.com/photos/56589/cactus-plant-plant-rack-green-56589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //       "Cactus",
  //       23.0,
  //       "in addition to being a decoration, cactus can also be a health benefit, let's buy cactus in our store because now discount 30%",
  //       getCategoryFromName("Plant"),
  //       2),
  //   Product(
  //       "https://images.pexels.com/photos/279618/pexels-photo-279618.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //       "Cupboard",
  //       13.0,
  //       "Simplistic cupboard, which works in every situation",
  //       getCategoryFromName("Other"),
  //       3),
  //   Product(
  //       "https://images.pexels.com/photos/276534/pexels-photo-276534.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //       "Reclined Chair",
  //       26.0,
  //       "White reclined chair",
  //       getCategoryFromName("Chair"),
  //       4),
  //   Product(
  //       "https://images.pexels.com/photos/993626/pexels-photo-993626.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //       "Alfalfa Plant",
  //       6.0,
  //       "Potted Alfalfa Plant",
  //       getCategoryFromName("Plant"),
  //       5),
  //   Product(
  //       "https://images.pexels.com/photos/135168/pexels-photo-135168.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  //       "Rosemary",
  //       7.0,
  //       "Potted Rosemary Plant",
  //       getCategoryFromName("Plant"),
  //       6)
  // ];

  static Category getCategoryFromName(name) {
    return categories.firstWhere(
        (c) => c.name.toLowerCase() == name.toString().toLowerCase());
  }
}