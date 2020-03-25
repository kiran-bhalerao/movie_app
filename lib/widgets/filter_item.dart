import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final String text;
  final bool active;

  const FilterItem({Key key, @required this.text, this.active = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: active ? Colors.white : Colors.black),
      ),
      decoration: BoxDecoration(
        border: Border.all(
            color: active ? Color(0xFFFE6D8E) : Colors.grey.withOpacity(0.3),
            width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        color: active ? Color(0xFFFE6D8E) : Colors.white,
      ),
    );
  }
}
