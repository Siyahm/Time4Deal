import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}
