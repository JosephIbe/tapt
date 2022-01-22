import 'package:flutter/material.dart';

import 'package:flutter_app/presentation/journeys/screens/home/home.dart';
import 'package:flutter_app/presentation/journeys/screens/favorites/favorites.dart';
import 'package:flutter_app/presentation/journeys/screens/account/account.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  var selectedIndex = 0;

  final _pages = [
    HomeView(),
    FavoritesView(),
    MyAccountView()
  ];

  Size? size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white70,
        body: _pages[selectedIndex],
        bottomNavigationBar: Container(
          width: size!.width,
          height: 70.0,
          margin: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: ()=> setState(() => selectedIndex = 0),
                icon: FaIcon(
                  FontAwesomeIcons.home,
                  color: selectedIndex == 0 ? Theme.of(context).primaryColor : Colors.grey,
                )
              ),
              IconButton(
                  enableFeedback: false,
                  onPressed: ()=> setState(() => selectedIndex = 1),
                  icon: FaIcon(
                    FontAwesomeIcons.solidHeart,
                    color: selectedIndex == 1 ? Theme.of(context).primaryColor : Colors.grey,
                  )
              ),
              IconButton(
                  enableFeedback: false,
                  onPressed: ()=> setState(() => selectedIndex = 2),
                  icon: FaIcon(
                    FontAwesomeIcons.home,
                    color: selectedIndex == 2 ? Theme.of(context).primaryColor : Colors.grey,
                  )
              ),
            ]
          ),
        )
        // body: Stack(
        //   children: [
        //     Positioned(
        //       left: 0,
        //       right: 0,
        //       bottom: 0,
        //       child: Container(
        //         height: 70.0,
        //         margin: const EdgeInsets.all(15.0),
        //         decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //           color: Colors.white
        //         ),
        //         child: BottomNavigationBar(
        //           currentIndex: selectedIndex,
        //           onTap: (index) => setState(() => selectedIndex = index),
        //           backgroundColor: Colors.transparent,
        //           elevation: 0,
        //           selectedItemColor: Theme.of(context).primaryColor,
        //           unselectedItemColor: Colors.grey,
        //           showSelectedLabels: false,
        //           showUnselectedLabels: false,
        //           items: const [
        //             BottomNavigationBarItem(
        //                 icon: FaIcon(FontAwesomeIcons.home),
        //                 label: 'hey'
        //             ),
        //             BottomNavigationBarItem(
        //                 icon: FaIcon(FontAwesomeIcons.solidHeart),
        //                 label: 'hey'
        //             ),
        //             BottomNavigationBarItem(
        //                 icon: FaIcon(FontAwesomeIcons.user),
        //                 label: 'hey'
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     _pages[selectedIndex],
        //   ]
        // )
      )
    );
  }
}