import 'package:flutter/material.dart';

class BottomNavBarItem extends BottomNavigationBarItem {
  final context;
  final String label;
  final bool active;
  final IconData icon_;

  BottomNavBarItem({
    this.context,
    required this.icon_,
    required this.label,
    required this.active,
  }) : super(
          label: label,
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(icon_, size: 24),
          ),
        );
}
