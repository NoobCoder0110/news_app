import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/features/main/screens/search/search.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/home/home_controller.dart';
import '../article/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    controller.fetchNewsData();
    super.initState();
  }

  Future<void> _onRefresh() async {
    await controller.fetchNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
            CTexts.intro,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {Get.to(() => const SearchScreen());}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.uniqueSections.isEmpty) {
                return const Center(
                  child: Text('Please check your internet connection or restart the app', textAlign: TextAlign.center,),
                );
              } else {
                return GridView.builder(
                  itemCount: controller.uniqueSections.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final data = controller.uniqueSections[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ArticleScreen(catadata: data));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                 Theme.of(context).colorScheme.primary,
                                CColors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(color: CColors.black),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(2, 2),
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                data,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
