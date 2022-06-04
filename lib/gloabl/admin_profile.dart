import 'package:flutter/material.dart';
import 'package:labpract/presentation/announcement/announce_admin.dart';
import 'package:labpract/presentation/products/screens/product_view.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AdminProfile"),
      ),
      body: ElevatedButton(onPressed: () {}, child: const Text("Log Outu")),
      bottomNavigationBar: const BottomNavBar(),
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
  static const List<Widget> _widgetOptions = <Widget>[
    AdminAnnounce(),
    AdminAnnounce(),
    AdminProduct()
  ];
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
