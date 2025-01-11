import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/home/home_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  var model = <Result>[].obs;
  var uniqueSections = <String>[].obs;
  var filtertitle = <int>[].obs;  
  var isLoading = false.obs;
  final searchText = TextEditingController();
  

  var snapshot = <Result>[].obs;

 
  Future<void> fetchNewsData() async {
    try {
      isLoading.value = true;  
      final response = await http.get(Uri.parse(
          "https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=ouaskGKohJ0DaDaD9QVI1KVBkN3peRhv"));

      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);

        final newsData = NewsModel.fromJson(data);

        model.value = newsData.results;
        
        
        snapshot.value = List.from(model);

    
        uniqueSections.value = newsData.results
            .map((result) => result.section)
            .toSet()
            .toList();
       
      } else {
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print("Catch Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

 
  void filterTitle() {
    String searchQuery = searchText.text.toLowerCase();

   
    filtertitle.value = snapshot
        .asMap()  
        .entries  
        .where((entry) =>
            entry.value.title.toLowerCase().contains(searchQuery))  
        .map((entry) => entry.key)
        .toList();
  }
}
