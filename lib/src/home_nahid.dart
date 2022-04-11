import 'package:flutter/material.dart';

import 'custom_bottom_bar.dart';

class NahidVai extends StatefulWidget {
   NahidVai({Key? key}) : super(key: key);

  @override
  State<NahidVai> createState() => _NahidVaiState();
}

class _NahidVaiState extends State<NahidVai> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(

                  height: size.height/3,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(

                    alignment: Alignment.centerRight,
                    height: 160,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                right: -30,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(

                    alignment: Alignment.centerRight,
                    height: 120,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.5),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                left: -30,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(

                    alignment: Alignment.centerRight,
                    height: 120,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.5),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.home, 0),
          buildNavBarItem(Icons.card_giftcard, 1),
          buildNavBarItem(Icons.camera, 2),
          buildNavBarItem(Icons.pie_chart, 3),
          buildNavBarItem(Icons.person, 4),
        ],
      ),
    );
  }
  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _currentIndex
            ? BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 4, color: Colors.green),
            ),
            gradient: LinearGradient(colors: [
              Colors.green.withOpacity(0.3),
              Colors.green.withOpacity(0.015),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
          // color: index == _selectedItemIndex ? Colors.green : Colors.white,
        )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _currentIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }


  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: 1,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.green,
          //inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Colors.purpleAccent,
          inactiveColor: Colors.yellow,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Messages ',
          ),
          activeColor: Colors.pink,
          inactiveColor: Colors.yellow,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue,
          inactiveColor: Colors.yellow,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
