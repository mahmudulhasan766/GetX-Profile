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
        color: Colors.cyan.shade100,
        width: MediaQuery.of(context).size.width / 4,
        child:index!=_currentIndex? Icon(icon, color: index == _currentIndex ? Colors.black : Colors.grey,
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:BorderRadius.circular(30),
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                    height: 60,
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, color: index == _currentIndex ? Colors.black : Colors.grey,),
                        Text("home")
                      ],
                    ))),
          ],
        ),
      )
    );
  }



}
