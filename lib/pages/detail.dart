import 'package:flutter/material.dart';
import 'package:movie_app/widgets/cast_item.dart';
import 'package:movie_app/widgets/filter_item.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/panda.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.transparent])),
              ),
              Container(
                height: height * 0.45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40)),
                  gradient: LinearGradient(
                    colors: [Colors.white.withOpacity(0.7), Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 1],
                  ),
                ),
              ),
              Positioned(
                top: 42,
                left: 6,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: (height * 0.4) - 70,
                right: 0,
                width: width * 0.9,
                child: Container(
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(50),
                      bottomStart: Radius.circular(50),
                    ),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4))],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.star, color: Color(0xFFFCC419), size: 26),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '8.2',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                  text: '/10',
                                  style: TextStyle(color: Colors.black))
                            ]),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.star_border, size: 26),
                          Text('Rate This')
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              '86',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Color(0xFF51CF66),
                          ),
                          Text('Metascore'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Ford v Ferrari',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('2019'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('PG-13'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('2h 32min'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFE6D8E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                  child: Wrap(
                    children: <Widget>[
                      FilterItem(text: 'Action'),
                      FilterItem(text: 'Drama'),
                      FilterItem(text: 'Crime'),
                      FilterItem(text: 'Biography'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plot Summary',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        'Cast & Crew',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CastItem(),
                      CastItem(),
                      CastItem(),
                      CastItem(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
