import 'package:flutter/material.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/screens/consultation_page.dart';
import 'package:tele_med/screens/profile_page.dart';
import 'package:tele_med/screens/doc_profile.dart';
import 'package:tele_med/screens/shop_medicine_page.dart';

class InitiatePage extends StatefulWidget {
  const InitiatePage({super.key});

  @override
  State<InitiatePage> createState() => _InitiatePageState();
}

class _InitiatePageState extends State<InitiatePage> {
  final List<Widget> _pages = <Widget>[
    const DocProfilePage(),
    const ConsultPage(),
    const ShopMedicinePage(),
    const ProfilePage(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 20.0, right: 20.0),
        child: BottomAppBar(
          elevation: 10.0,
          color: Colors.transparent,
          child: PhysicalModel(
            elevation: 10.0,
            color: Colors.white,
            shadowColor: kPrimaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              decoration: const BoxDecoration(
                //border: Border.all(color: kPrimaryColor, width: 2.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  unselectedItemColor: Colors.white,
                  selectedItemColor: kPrimaryColor,
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  showUnselectedLabels: false,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        _selectedIndex == 0
                            ? 'images/home_solid.png'
                            : 'images/home.png',
                        height: 35,
                        color:
                            _selectedIndex == 0 ? kPrimaryColor : Colors.grey,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'images/search.png',
                        height: 35,
                        color:
                            _selectedIndex == 1 ? kPrimaryColor : Colors.grey,
                      ),
                      label: 'Consult',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        _selectedIndex == 2
                            ? 'images/shop_solid.png'
                            : 'images/shop.png',
                        height: 35,
                        color:
                            _selectedIndex == 2 ? kPrimaryColor : Colors.grey,
                      ),
                      label: 'Buy',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        _selectedIndex == 3
                            ? 'images/profile_solid.png'
                            : 'images/profile.png',
                        height: 35,
                        color:
                            _selectedIndex == 3 ? kPrimaryColor : Colors.grey,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}