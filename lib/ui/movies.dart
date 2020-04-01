import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/ui/account/login.dart';
import 'package:cinema/ui/categories/categories.dart';
import 'package:cinema/ui/categories/category_details.dart';
import 'package:cinema/ui/components/category_button.dart';
import 'package:cinema/ui/components/list_of_movies.dart';
import 'package:cinema/ui/components/widget_header.dart';
import 'package:cinema/ui/components/movie_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> with SingleTickerProviderStateMixin{
  PageController _carouselController;

  //demo data
  List<String> links = [
    'https://gizmostory.com/wp-content/uploads/2019/12/maxresdefault-4-1.jpg',
    'https://img.over-blog-kiwi.com/3/93/55/67/20191129/ob_e4a5f9_avrkzcqov1r0naxhepzjkmszrmb.jpg',
    'https://wallpaperaccess.com/full/645142.jpg'
  ];
  List<Map> movies = [
    {
      'name': 'Blade Runner',
      'image': 'https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/original/products/88314/91406/Blade-Runner-2049-Final-Style-Poster-buy-original-movie-posters-at-starstills__83407.1519904794.jpg?c=2&imbypass=on'
    },
    {
      'name': 'Sherlock',
      'image': 'https://cdn.europosters.eu/image/750/posters/sherlock-series-4-iconic-i33910.jpg'
    },
    {
      'name': 'Moonlight',
      'image': 'https://images-na.ssl-images-amazon.com/images/I/71rNJQ2g-EL._AC_SY741_.jpg'
    },
    {
      'name': 'Tomorrow Land',
      'image': 'https://images-na.ssl-images-amazon.com/images/I/51-Hn0gQ1wL._AC_.jpg'
    },


  ];

  @override
  void didChangeDependencies() {
    _carouselController = new PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ).tr(context: context),

        centerTitle: true,
        elevation: 0.3,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
        ],
      ),

      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                buildCarouselSlider(_carouselController),
                _buildCircleIndicator(_carouselController, links.length)
              ],
            ),
            SizedBox(height: 25),
            ListOfMovies(
              title: 'In Theaters',
              buttonText: 'See All',
              buttonFunction: () => Get.to(CategoryDetails(name: 'In Theaters')),
              movies: movies[0],
            ),
            SizedBox(height: 25),
            ListOfMovies(
              title: 'Box Office',
              buttonText: 'See All',
              buttonFunction: () => Get.to(CategoryDetails(name: 'Box Office')),
              movies: movies[1],
            ),
            SizedBox(height: 25),
            buildHotList(),
            SizedBox(height: 25),
            buildCategories(),
            SizedBox(height: 25),
            ListOfMovies(
              title: 'New Arrivals',
              buttonText: 'See All',
              buttonFunction: () => Get.to(CategoryDetails(name: 'New Arrivals',)),
              movies: movies[2],
            ),
            SizedBox(height: 25),
            ListOfMovies(
              title: 'Most Popular',
              buttonText: 'See All',
              buttonFunction: () => Get.to(CategoryDetails(name: 'Most Popular')),
              movies: movies[3],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 60,
                    child: CircleAvatar(
                      child: FaIcon(FontAwesomeIcons.image, color: Theme.of(context).textTheme.title.color,),
                      backgroundColor: Theme.of(context).cardColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Cinema App').tr(context: context),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    'https://images.unsplash.com/photo-1524712245354-2c4e5e7121c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
            ListTile(
              title: Text('New Movies').tr(context: context),
              onTap: () => Get.to(Categories()),
            ),
            ListTile(
              title: Text('Top Rated').tr(context: context),
              onTap: () => Get.to(Categories()),
            ),
            ListTile(
              title: Text('Categories').tr(context: context),
              onTap: () => Get.to(Categories()),
            ),
            Divider(),
            ListTile(
              title: Text('Sign In').tr(context: context),
              onTap: () => Get.to(Login()),
            ),
            ListTile(
              title: Text('Terms & Conditions').tr(context: context),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('About').tr(context: context),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHotList() {
    return WidgetHeader(
        title: 'Trending',
        button: InkWell(
            onTap: () => Get.to(CategoryDetails(name: 'Trending',)),
            child: Row(
              children: <Widget>[
                Text('See All', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)).tr(),
                Icon(Icons.chevron_right),
              ],
            )),
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(children: <Widget>[
          Expanded(
              child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: ClipRRect(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(links[index]),
                                        fit: BoxFit.cover)),
                                margin: EdgeInsets.only(top: 1),
                                child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () => Get.to(MovieDetails(id: 1,)),
                                    child: Container(
                                        alignment: index % 2 == 0
                                            ? Alignment.bottomLeft
                                            : Alignment.bottomRight,
                                        height: 200,
                                        width: double.infinity,
                                        child: Container(
                                            decoration: BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.black54,
                                                blurRadius:
                                                40.0, // has the effect of softening the shadow
                                                spreadRadius:
                                                20.0, // has the effect of extending the shadow
                                              )
                                            ]),
                                            alignment: Alignment.center,
                                            width: 250,
                                            height: 70))),
                              )),
                        );
                      })))
        ]),
      ),
    );
  }
  Widget buildCategories() {
    return WidgetHeader(
      title: 'Categories',
      button: InkWell(
          onTap: (){
            Get.to(Categories());
          },
          child: Row(
            children: <Widget>[
              Text('See All', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)).tr(),
              Icon(Icons.chevron_right)
            ],
          )),
      child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CategoryButton(
                          name:  'Fantasy',
                          color: const Color(0xffFEC000),
                          onPressed: () => Get.to(CategoryDetails(name: 'Fantasy',)),
                        ),
                        CategoryButton(
                          name:  'Comedy',
                          color: const Color(0xffFF9628),
                          onPressed: () => Get.to(CategoryDetails(name: 'Comedy',)),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CategoryButton(
                          name:  'Sci-Fi',
                          color: const Color(0xff70BBA4),
                          onPressed: () => Get.to(CategoryDetails(name: 'Sci-Fi',)),
                        ),
                        CategoryButton(
                          name:  'Action',
                          color: const Color(0xffED2E46),
                          onPressed: () => Get.to(CategoryDetails(name: 'Action',)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  ///Widgets
  Widget buildCarouselSlider(PageController carouselController) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: carouselController,
        itemCount: links.length,
        itemBuilder: (BuildContext context, int itemIndex) =>
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black38,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    links[itemIndex],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      ),
    );
  }
  Widget _buildCircleIndicator(PageController controller,int count) {
    return Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                  controller: controller,
                  count:  count,
                  effect:  SwapEffect(
                    dotColor: Colors.white30,
                    activeDotColor:Colors.white,
                    dotWidth: 10,
                    dotHeight: 10,
                    paintStyle: PaintingStyle.stroke,
                  )
              )),
        ));
  }



  ///Functions
  void _animateSlider() {
    Future.delayed(Duration(seconds: 6)).then((_) {
      int nextPage = _carouselController.page.round() + 1;

      if (nextPage == links.length) {
        nextPage = 0;
      }

      _carouselController
          .animateToPage(nextPage, duration: Duration(milliseconds: 600), curve: Curves.ease)
          .then((_) => _animateSlider());
    });
  }
}
