import 'package:f2/Model/meal.dart';
import 'package:f2/screen/Categories_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'Favorites_screen.dart';

class TapScreen extends StatefulWidget {
  final List<Meal> favoritesMeal;
  TapScreen(this.favoritesMeal);
  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  int _selectPageIndex = 0;
  late List<Map<String, Object>> _pages;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  void initState() {
    // Initialize the pages list with the correct types
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoitesScreen(widget.favoritesMeal),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}


//////////////////////////////////////////////
 // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("meal"),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(
    //               Icons.category,
    //             ),
    //             text: "Categories",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: "Favorites",
    //           )
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoitesScreen(),
    //       ],
    //     ),
    //   ),
    // );