import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resep_mama/main_page/home_screen.dart';
import 'package:resep_mama/main_page/search.dart';

class MainScreen extends StatefulWidget {
  String textName;
  MainScreen({Key? key, required this.textName}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget body() {
    switch (_page) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return Search();
        break;
      default:
        return HomeScreen();
    }
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Container(
          width: 10,
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("image/profil.png", fit: BoxFit.cover)),
        ),
        title: Text(
          "Hi ${widget.textName}!",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: body(),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.transparent,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(
            Icons.add,
            size: 30,
          ),
          Icon(Icons.search, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
