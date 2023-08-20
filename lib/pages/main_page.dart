import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Button Navigation Container'),
        ),
        body: Container(
          child: const Text('Center Text'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Post'),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.amber,
        ));
  }
}
