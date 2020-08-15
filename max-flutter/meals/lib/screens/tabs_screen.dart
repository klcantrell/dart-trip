import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

import '../models/meal.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;

  TabsScreen({@required favorites}) : this.favoritedMeals = favorites;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<_PageConfig> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      _PageConfig(page: CategoriesScreen(), title: 'Categories'),
      _PageConfig(
          page: FavoritesScreen(
            favorites: widget.favoritedMeals,
          ),
          title: 'Favorites'),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

class _PageConfig {
  final Widget page;
  final String title;

  _PageConfig({this.page, this.title});
}
