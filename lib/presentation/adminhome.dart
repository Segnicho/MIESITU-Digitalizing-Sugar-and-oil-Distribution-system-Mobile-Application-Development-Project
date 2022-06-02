import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labpract/presentation/products/screens/add_product.dart';
// import 'package:labpract/presentation/products/screens/announcement_admin.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Home")),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).pushNamed('/addproduct');
              },
              child: Text("addProduct"),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedInd = 0;

// static const List<Widget> _widgetOptions = <Widget>[AdminHome(), Announcement(),AddUpdateProduct()];

  void handleTab(int index) {
    setState(() {
      _selectedInd = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.announcement),
          label: 'Announcement',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: 'Contacts',
        ),
      ],
      currentIndex: _selectedInd,
      onTap: handleTab,
    );
  }
}
