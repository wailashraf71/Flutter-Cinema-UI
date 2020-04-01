import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/ui/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieWidget extends StatelessWidget {
  final String title;
  final String image;
  final BorderRadiusGeometry radius;

  const MovieWidget({Key key, this.title, this.image, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetails(id: 1), transition: Transition.leftToRightWithFade);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: radius,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          image,
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
              ),
            ),
            title != null? Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top:5.0, left: 2),
                  child: Text(title,maxLines: 2, overflow: TextOverflow.ellipsis),
                )
            ):Container(),
          ],
        ),
      ),
    );
  }
}
