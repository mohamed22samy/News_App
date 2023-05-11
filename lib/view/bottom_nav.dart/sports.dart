import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';

class Sports extends GetWidget {
  
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Spots News")),
      ),
      body: FutureBuilder<dynamic>(
        future: newsController.getData("sports"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Articles data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                          width: double.infinity,
                          height: 170,
                          child: Image.network(
                            data.articles[index].urlToImage.toString(),
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 5),
                        child: Text(
                          data.articles[index].title.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.articles[index].description.toString(),
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            data.articles[index].publishedAt.toString(),
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 90, 89, 89)),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            );
          }
        },
      ),
    );
  }
}
