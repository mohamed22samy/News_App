import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/bottom_nav.dart/entertainment.dart';
import 'package:news_app/view/bottom_nav.dart/general.dart';
import 'package:news_app/view/bottom_nav.dart/health.dart';
import 'package:news_app/view/bottom_nav.dart/science.dart';
import 'package:news_app/view/bottom_nav.dart/sports.dart';

class HomePage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      General(),
      Entertainment(),
      Health(),
      Science(),
      Sports()
    ];
    // ignore: unused_local_variable
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
        // appBar: AppBar(
        //   title: const Center(child: Text("News App")),
        // ),
        bottomNavigationBar: GetX<NewsController>(
            builder: (newsController) => BottomNavigationBar(
                    selectedItemColor: Colors.indigo,
                    backgroundColor: Colors.grey,
                    unselectedItemColor: Colors.grey,
                    currentIndex: newsController.currentIndex.value,
                    onTap: (val) {
                      newsController.currentIndex.value = val;
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.local_activity_outlined),
                          label: "General"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.fireplace_outlined),
                          label: "Entertain"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.health_and_safety_outlined),
                          label: "Health"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.science_outlined), label: "Science"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.sports_football), label: "Sports"),
                    ])),
        body: GetX<NewsController>(
          builder: (newscontroller) =>
              screens[newscontroller.currentIndex.value],
        ));
  }
}
