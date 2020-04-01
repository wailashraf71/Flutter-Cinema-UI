import 'package:cinema/ui/components/movie_widget.dart';
import 'package:cinema/ui/components/widget_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListOfMovies extends StatelessWidget {
  final String title, buttonText;
  final Function buttonFunction;
  final Map movies;

  const ListOfMovies({Key key, @required this.title, @required this.buttonText, this.buttonFunction, @required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetHeader(
        title: title,
        button: InkWell(
            onTap: buttonFunction,
            child: Row(
              children: <Widget>[
                Text(buttonText, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                Icon(Icons.chevron_right),
              ],
            )),
        child: Container(
          height: 200,
          child: AnimationLimiter(
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 675),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: AspectRatio(
                        aspectRatio: 11/16,
                        child: Container(
                            child: MovieWidget(
                              image: movies['image'],
                              title: movies['name'],
                              radius: BorderRadius.all(Radius.circular(7)),
                            )
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
