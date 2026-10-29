import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(40),
        color: Colors.blue[300],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[600],
          ),
          child: Center(
            child: Text(
              'CADT STUDENT',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
