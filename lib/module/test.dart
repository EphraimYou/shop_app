import 'package:flutter/material.dart';

class BottomNavBarExample extends StatelessWidget {
  const BottomNavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Bottom NavBar'),
      ),
      body: const Center(
        child: Text('Scrollable BottomNavBar Example',
            style: TextStyle(fontSize: 18)),
      ),
      bottomNavigationBar: const ScrollableBottomNavBar(),
    );
  }
}

class ScrollableBottomNavBar extends StatelessWidget {
  const ScrollableBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60, // Height of the bottom bar
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(
              10, // Number of items
              (index) => GestureDetector(
                onTap: () {
                  debugPrint('Clicked on item $index');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle, // Example icon
                        color: index == 0
                            ? Colors.blue
                            : Colors.grey, // Highlight selected item
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Item $index',
                        style: TextStyle(
                          color: index == 0 ? Colors.blue : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
