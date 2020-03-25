import 'package:flutter/material.dart';

class CastItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRUOh8rmUhwYBMDExf8OSQ1gZQ7seJMrdePGQnChPtr1yy8H1D-'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            child: Text(
              'Christian Bale',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Director',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
