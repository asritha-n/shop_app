import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/product_list.dart';
//TextField ends up taking the entire space / device width and it's not okay with anything ele
//so we need to wrap with another widget
//inherited widgets used for state management
//theme.offcontext finds the nearest theme data
//like it does the nearest thing - nearest ancestor widget
//state managmenet is about storing all the data

//19.58
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        //allows us to maintain the current scroll position
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
