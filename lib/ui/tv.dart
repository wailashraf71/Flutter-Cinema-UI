import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/ui/play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
class Tv extends StatefulWidget {
  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }


  Widget buildBody() {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                'TV',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ).tr(context: context),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){},
                )
              ],
              brightness: Brightness.dark,
              pinned: false,
              elevation: 0.0,
            ),
            SliverAppBar(
              title: Container(
                child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),
                    indicator: new BubbleTabIndicator(
                      indicatorHeight: 30.0,
                      indicatorColor: Theme
                          .of(context)
                          .indicatorColor,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    tabs: [
                      Text('Recommended').tr(context: context),
                      Text('Netflix').tr(context: context),
                      Text('HBOGO').tr(context: context),
                      Text('Amazon').tr(context: context),
                    ]),
              ),
              pinned: true,
              elevation: 0.4,
            ),
          ];
        },
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildListChannels(),
            buildListChannels(),
            buildListChannels(),
            buildListChannels(),
          ]
      ),
    );
  }

  Widget buildListChannels() {
    return AnimationLimiter(
      child: ListView.builder(
              scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index){
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () => Get.to(Play(id: 1,)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: CircleAvatar(
                                      backgroundImage: CachedNetworkImageProvider(
                                          'https://i2.wp.com/www.verite.org/wp-content/uploads/Logos-and-Seals/Media-Thumb-Tiles_CNN.jpg?ssl=1'),

                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text('$index. ', style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                            Text('CNN International',
                                                style: TextStyle(fontSize: 15,
                                                    fontWeight: FontWeight
                                                        .bold)).tr(context: context),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.7,
                                          child: Text('News',
                                            style: TextStyle(fontSize: 12,
                                              color: Theme.of(context).textTheme.title.color.withOpacity(0.6),

                                          ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ).tr(context: context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
    );
  }
}

