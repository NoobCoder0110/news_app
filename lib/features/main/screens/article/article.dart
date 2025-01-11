import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';
import '../detail/detail.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.catadata});

  final String catadata;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(catadata),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.model.length,
          itemBuilder: (context, index) {
            final data = controller.model[index];
            if (data.section == catadata && data.itemType == "Article") {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => DetailScreen(
                          title: data.title,
                          subTitle: data.abstract,
                          byLine: data.byline,
                          desFacet: data.desFacet,
                          perFacet: data.perFacet,
                          orgFacet: data.orgFacet,
                          geoFacet: data.geoFacet,
                            image: (data.multimedia.length > 2 && data.multimedia[2].url.isNotEmpty) 
      ? data.multimedia[2].url 
      : null, 
                          caption: (data.multimedia.length > 2 && data.multimedia[2].caption.isNotEmpty) ? data.multimedia[2].caption : null,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).colorScheme.surface.withOpacity(0.4),),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data.multimedia.isEmpty ?
                          const SizedBox.shrink() :
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              data.multimedia[2].url,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              data.title,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        );
      }),
    );
  }
}
