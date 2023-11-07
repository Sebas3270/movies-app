import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.black,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.secondary,
      iconSize: 26,
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      currentIndex: myIndex,
      onTap: (value){ 
        setState(() {
         myIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(EvaIcons.homeOutline),
          activeIcon: Icon(EvaIcons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(EvaIcons.searchOutline),
          activeIcon: Icon(EvaIcons.search),
          label: 'Search'
        ),
        BottomNavigationBarItem(
          icon: Icon(EvaIcons.starOutline),
          activeIcon: Icon(EvaIcons.star),
          label: 'Favorites'
        ),
      ]
    );
  }
}