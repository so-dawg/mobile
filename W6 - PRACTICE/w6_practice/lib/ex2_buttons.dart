import 'package:flutter/material.dart';

// EX 2 – The buttons (handout page: EX 2)
// A StatelessWidget called CustomButton. Use one enum for the button type
// and one enum for the icon position.

enum PositionIcon { LEFT, RIGHT }

enum ButtonType { PRIMARY, SECONDARY, DISABLED }

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final PositionIcon posIcon;
  final ButtonType type;

  Color get color => switch (type) {
        ButtonType.PRIMARY => Colors.blue,
        ButtonType.SECONDARY => Colors.green,
        ButtonType.DISABLED => Colors.grey,
      };

  const CustomButton(
      {super.key,
      required this.title,
      required this.icon,
      this.type = ButtonType.PRIMARY,
      this.posIcon = PositionIcon.LEFT});

  @override
  Widget build(BuildContext context) {
    Text label = Text(
      title,
      style: TextStyle(
        color: Colors.white,
      ),
    );
    Padding icons = Padding(
      padding: EdgeInsetsGeometry.all(30),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
    return Container(
      padding: EdgeInsetsGeometry.all(40),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadiusGeometry.circular(20)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              posIcon == PositionIcon.RIGHT ? [label, icons] : [icons, label],
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
        body: Container(
          child: Padding(
            padding: EdgeInsetsGeometry.all(40),
            child: Column(
              children: [
                CustomButton(
                  title: "gg",
                  icon: Icons.gamepad,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: "kk",
                  icon: Icons.man_rounded,
                  type: ButtonType.SECONDARY,
                  posIcon: PositionIcon.RIGHT,
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
