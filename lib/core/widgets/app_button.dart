// widget for app button used across the app
import 'package:disk_analyzer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  // 1. Define the parameters you need
  final String labelText;
  final IconData iconData; // Parameter for the specific icon
  final Color buttonColor;

  // 2. Add them to the constructor as 'required'
  const AppButton({
    Key? key,
    required this.labelText,
    required this.iconData,
    this.buttonColor = AppColors.primaryBlue, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        // Use ElevatedButton.icon
        onPressed: () {},
        icon: Icon(iconData, color: Colors.white), // Use the passed iconData
        label: Text(
          labelText,
          style: const TextStyle(fontSize: 18, color: AppColors.textPrimary),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
