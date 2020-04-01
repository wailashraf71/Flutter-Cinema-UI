import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/ui/categories/category_details.dart';
import 'package:cinema/ui/components/list_of_movies.dart';
import 'package:cinema/ui/play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {
  final int id;
  MovieDetails({Key key, this.id}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  double top = 100;

  List<Map> movies = [
    {
      'name': 'Mr Robot',
      'image': 'https://i.pinimg.com/originals/14/ec/36/14ec36ab657a75ba705ddc438acca5c1.jpg'
    }


  ];
  @override
  void didChangeDependencies() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
              expandedHeight: 400,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  if (top <= 110) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    'https://www.itl.cat/pngfile/big/237-2375071_stranger-things-saison-2.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center),
                          ),

                        ),
//                        new Align(
//                          alignment: Alignment.center,
//                          child: GestureDetector(
//                            onTap: () => Get.to(Play()),
//                            child: new Container(
//                              child: Container(
//                                padding: EdgeInsets.all(15),
//                                color: Colors.transparent,
//                                child: Icon(Icons.play_circle_outline, color: Colors.white,size: 100,),
//                              ),
//                            ),
//                          ),
//                        ),


                        new Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 200,
                            height:70,
                            child: GestureDetector(
                              onTap: () => Get.to(Play()),
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: new ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: new BackdropFilter(
                                        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                        child: new Container(
                                          width: 150.0,
                                          height: 35.0,
                                          decoration: new BoxDecoration(
                                              color: Colors.white10.withOpacity(0.1),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(width: 50),
                                              Center(child: Text('Watch Now',style: TextStyle(color: Colors.white),)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    alignment: Alignment.centerLeft,
                                    child: RaisedButton(
                                      color: Colors.white,
                                      disabledColor: Colors.white,
                                      child: Icon(Icons.play_arrow, color: Theme.of(context).indicatorColor,),
                                      shape: CircleBorder(),
                                      onPressed: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                }),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Drama, Action',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Theme.of(context).secondaryHeaderColor
                      ),
                    ),
                    Text(
                      'Stranger Things',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RatingBar(
                          initialRating: 4,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          glow: false,
                          itemSize: 20,
                          itemPadding: EdgeInsets.only(left: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text('3h 30m')

                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                    ),
                  ],
                )
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Director: '),
                          Text('Shawn Levy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Year: '),
                          Text('2020', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ],
                      ),
                    ],
                  )),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20),
            sliver: SliverToBoxAdapter(
              child: ListOfMovies(
                title: 'Relative ',
                buttonText: 'See All',
                buttonFunction: () => Get.to(CategoryDetails(name: 'Category Name or Tag',)),
                movies: movies[0],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }


}
