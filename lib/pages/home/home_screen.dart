import 'package:flutter/material.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/pages/home/history_screen.dart';
import 'package:service_man/pages/home/jobs_screen.dart';
import 'package:service_man/pages/home/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          JobScreen(),
          HistoryScreen(),
          ProfileScreen()
        ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bMilk,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex != index) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [BoxShadow(color: bPurple, spreadRadius: 5.0)]
                ),
                child: Icon(Icons.home_outlined, color: bYellow),
              ),
            )
                : Icon(Icons.home_outlined, color: bPurple),
            label: ''
          ),

          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [BoxShadow(color: bPurple, spreadRadius: 5.0)]
                ),
                child: Icon(Icons.lock_clock, color: bYellow),
              ),
            )
                : Icon(Icons.lock_clock, color: bPurple),
              label: ''
          ),

          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [BoxShadow(color: bPurple, spreadRadius: 5.0)]
                  ),
                    child: Icon(Icons.people_outline, color: bYellow),
            ),
                )
                : Icon(Icons.people_outline, color: bPurple),
              label: ''
          )
        ],
      ),
    );
  }
}



