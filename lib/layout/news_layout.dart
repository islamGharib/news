import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Business'
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(
              Icons.brightness_4_outlined,
            ),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index){

        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.science),
              label: 'Science'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports),
              label: 'Sports'
          ),

        ],
      ),
    );
  }
}
