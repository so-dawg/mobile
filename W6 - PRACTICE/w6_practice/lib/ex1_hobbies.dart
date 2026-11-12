import 'package:flutter/material.dart';

// EX 1 – The hobbies (handout page: EX 1)
// Part 1: build ONE hobby card.
// Part 2: extract it into a StatelessWidget called HobbyCard, then show several cards.
class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;

  const HobbyCard(
      {super.key,
      required this.title,
      required this.icon,
      this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(30),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: 20),
              child: Icon(
                this.icon,
                color: Colors.white,
              ),
            ),
            Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: "coding",
                icon: Icons.code,
              ),
              SizedBox(
                height: 20,
              ),
              HobbyCard(
                title: "Walking",
                icon: Icons.directions_walk,
                color: Colors.red,
              ),
            ],
          ),
        ), // YOUR CODE
      ),
    ),
  );
}
