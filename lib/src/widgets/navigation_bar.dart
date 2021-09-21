import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  final int tap;
  final void Function(int text) onTap;

  MyNavigationBar({required  this.tap,required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map"),

        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5),
            label: "Direcciones"),
      ],
      currentIndex: tap,
      onTap: onTap

    );
  }

}
















