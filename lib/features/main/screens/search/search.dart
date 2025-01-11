import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';
import '../detail/detail.dart'; 

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.searchText,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
                labelText: "Search",
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              onChanged: (value) {
                controller.filterTitle();
              },
            ),
            const SizedBox(height: 20),
            Obx(() {

              if (controller.filtertitle.isEmpty) {
                return const Center(child: Text("No results found"));
              }


              return Expanded(  
                child: ListView.builder(
                  itemCount: controller.filtertitle.length,
                  itemBuilder: (context, index) {
                    var resultIndex = controller.filtertitle[index];
                    var data = controller.snapshot[resultIndex]; 

                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailScreen(
                          title: data.title,
                          subTitle: data.abstract,
                          byLine: data.byline,
                          desFacet: data.desFacet,
                          perFacet: data.perFacet,
                          orgFacet: data.orgFacet,
                          geoFacet: data.geoFacet,
                          image: (data.multimedia.length > 2 && data.multimedia[2].url != null)
                              ? data.multimedia[2].url
                              : null, 
                          caption: (data.multimedia.length > 2 && data.multimedia[2].caption != null)
                              ? data.multimedia[2].caption
                              : null,
                        ));
                      },
                      child: ListTile(
                        title: Text(data.title, style: Theme.of(context).textTheme.bodyMedium),  
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}



