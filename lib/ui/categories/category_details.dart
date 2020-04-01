import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cinema/ui/components/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoryDetails extends StatefulWidget {
  final String name;

  const CategoryDetails({Key key, this.name}) : super(key: key);
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            indicator: new BubbleTabIndicator(
              indicatorHeight: 30.0,
              indicatorColor: Theme.of(context).indicatorColor,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            tabs: [
              Text('English'),
              Text('Arabic')
            ]),
        elevation: 0.0,
      ),
      
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildGridView(),
            buildGridView(),
          ]
      )
    );
  }

  Widget buildGridView() {
    return AnimationLimiter(
      child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 11/16
                ),
                itemBuilder: (BuildContext context, int index){
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MovieWidget(
                            title: 'The Assassin',
                            image: 'https://compote.slate.com/images/77440fdf-a599-4fd1-90fc-cc619aa7419d.jpg',
                            radius: BorderRadius.all(Radius.circular(7)),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
    );
  }
}

