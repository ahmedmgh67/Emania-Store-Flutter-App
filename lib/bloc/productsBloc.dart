import 'dart:convert';
//import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:emania/models/product.dart';

class Bloc {
  
  void req (){
    http.get("url");
  }
}