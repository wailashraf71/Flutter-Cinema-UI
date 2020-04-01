import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/ui/categories/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final List<String> dummyNames = [' Fantasy', 'Comedy', 'Sci-fi', 'Action', 'Adventure', 'Romance'];
  final List<String> links = [
    'https://gizmostory.com/wp-content/uploads/2019/12/maxresdefault-4-1.jpg',
    'https://img.over-blog-kiwi.com/3/93/55/67/20191129/ob_e4a5f9_avrkzcqov1r0naxhepzjkmszrmb.jpg',
    'https://wallpaperaccess.com/full/645142.jpg',

    'https://gizmostory.com/wp-content/uploads/2019/12/maxresdefault-4-1.jpg',
    'https://img.over-blog-kiwi.com/3/93/55/67/20191129/ob_e4a5f9_avrkzcqov1r0naxhepzjkmszrmb.jpg',
    'https://wallpaperaccess.com/full/645142.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),

        centerTitle: true,
        elevation: 0.3,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 6,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: AspectRatio(
                  aspectRatio: 16/9,
                    child:
                    category(dummyNames[index], links[index] ,() => Get.to(CategoryDetails(name: dummyNames[index])))),
              );
            }),
      ),
    );
  }

  Widget category(name, image, onPressed) {
    return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      '$image'
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius:
                      40.0, // has the effect of softening the shadow
                      spreadRadius:
                      20.0, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        -20.0, // vertical, move down 10
                      ),
                    )
                  ]),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30, left: 30),
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
        ));
  }

}
