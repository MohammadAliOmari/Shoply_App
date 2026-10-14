import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.iconData,
    this.color,
  });
  final String title;
  final IconData iconData;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, size: 30, color: color ?? Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
