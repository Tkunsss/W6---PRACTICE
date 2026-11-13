import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Button types
enum ButtonType { primary, secondary, disabled }

// Icon positions
enum IconPosition { left, right }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom Buttons")),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "Submit",
                icon: Icons.check,
                type: ButtonType.primary,
              ),

              SizedBox(height: 20),

              CustomButton(
                label: "Time",
                icon: Icons.access_time,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),

              SizedBox(height: 20),

              CustomButton(
                label: "Account",
                icon: Icons.account_tree,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Button Widget defination
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;
  //constructor
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    // Set button color
    Color buttonColor;

    switch (type) {
      case ButtonType.primary:
        buttonColor = Colors.blue;
        break;

      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;

      case ButtonType.disabled:
        buttonColor = Colors.grey;
        break;
    }

    // Set icon position
    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconPosition == IconPosition.left
          ? [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
              Text(label),
            ]
          : [
              Text(label),
              const SizedBox(width: 8),
              Icon(icon, color: Colors.white),
            ],
    );

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: type == ButtonType.disabled ? null : () {},

        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),

        child: buttonContent,
      ),
    );
  }
}
