import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail.dart';
import 'package:movie_app/widgets/filter_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  var currentPage = 0;

  final movies = [
    {"name": "Joker", "img": "assets/joker.jpg", "rating": 8.5},
    {"name": "The Dark Knight", "img": "assets/dark-knight.jpg", "rating": 9.0},
    {"name": "Warcraft", "img": "assets/warcraft.jpg", "rating": 6.8},
    {
      "name": "The Amazing Spiderman",
      "img": "assets/spiderman.jpg",
      "rating": 6.6
    },
    {"name": "Kung Fu Panda 3", "img": "assets/panda.jpg", "rating": 7.1},
    {
      "name": "Captain America: Civil War",
      "img": "assets/captain.jpg",
      "rating": 7.8
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _pageController = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.82,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20, top: 10, left: 3, right: 3),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFF469469),
                labelColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5, color: Color(0xFFFE6D8E)),
                  insets: EdgeInsets.only(right: 100, left: 18),
                ),
                unselectedLabelColor: Colors.grey.withOpacity(0.6),
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                tabs: <Widget>[
                  Tab(child: Text('In Theater')),
                  Tab(child: Text('Box Office')),
                  Tab(child: Text('Coming Soon')),
                ],
              ),
            ),
            Container(
              height: 76,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  FilterItem(text: 'Action', active: true),
                  FilterItem(text: 'Crime'),
                  FilterItem(text: 'Comedy'),
                  FilterItem(text: 'Drama'),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: _pageController,
                itemCount: 6,
                itemBuilder: (context, index) => builder(
                    index, _pageController, context, movies[index]["img"]),
              ),
            ),
            Container(
              height: 80,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      movies[currentPage]["name"],
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Color(0xFFFCC419),
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            movies[currentPage]["rating"].toString(),
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  getAngle(double val, double value) {
    if (value == 1) {
      return 0.0;
    } else if (val < 0) {
      return -(value - 1);
    } else {
      return value - 1;
    }
  }

  builder(int index, PageController control, BuildContext context, String img) {
    return AnimatedBuilder(
      animation: control,
      builder: (context, child) {
        double value = 1.0;
        double val = 1.0;
        if (control.position.haveDimensions) {
          value = control.page - index;
          val = value;
          value = (1 - (value.abs() * .1)).clamp(0.0, 1.0);
        }

        return Center(
          child: Transform.rotate(
            angle: getAngle(val, value),
            child: Container(
              height: Curves.easeOut.transform(value) * 400,
              width: Curves.easeOut.transform(value) * 280,
              child: child,
            ),
          ),
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MovieDetail()));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
