import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.selectedIndex, required this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected; 

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: onDestinationSelected,
        // indicatorColor: Colors.amber,
        selectedIndex: selectedIndex,
        indicatorColor:Colors.blue.shade500,
        height: 50,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,// this is used to hide the text of icon in bottom navigation bar.
        
        destinations: const <Widget>[

          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home,color: Colors.white,),
            
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore),
            selectedIcon: Icon(Icons.explore,color: Colors.white,),
            label: 'Transaction',
          ),
        
        ],
      );
  }
}