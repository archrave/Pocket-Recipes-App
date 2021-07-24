import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _tabList = [
    {'tab': CategoriesScreen(), 'title': 'Categories'},
    {'tab': FavoritesScreen(), 'title': 'Favorites'},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //The following widget is used to put tabs right below the appbar
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabList[_selectedPageIndex]['title'],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Catergories'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
      body: _tabList[_selectedPageIndex]['tab'],
    );
  }
}
