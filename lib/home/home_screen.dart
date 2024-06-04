import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmgo/components/bottom_nav_bar.dart';
import 'package:pharmgo/lab_test_page/labtests.dart';
import 'package:pharmgo/pages/cart_page.dart';
import 'package:pharmgo/pages/shop_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update the selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// pages to display
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),
    // lab tests page
    const Labtests(),
    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          "",
          style: TextStyle(color: Colors.cyan),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            // logo
            DrawerHeader(child: Image.asset("images/logo.png")),
            // other pages
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homeScreen');
                },
                icon: const Icon(Icons.home),
                color: Colors.white,
              ),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
            ),

            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homeScreen');
                },
                icon: const Icon(Icons.shopping_cart),
                color: Colors.white,
              ),
              title: const Text('Cart', style: TextStyle(color: Colors.white)),
            ),

            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout),
                color: Colors.white,
              ),
              title:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
            )

            // info
          ],
        ),
      ),
      backgroundColor: Colors.black87,
      bottomNavigationBar: SingleChildScrollView(
        child: MyBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
