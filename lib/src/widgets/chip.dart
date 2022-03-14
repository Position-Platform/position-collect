import 'package:flutter/material.dart';

Widget chip(String label, Color color, Function()? onPressed) {
  return ActionChip(
    labelPadding: const EdgeInsets.all(5.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade600,
      child: Text(label[0].toUpperCase()),
    ),
    label: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    onPressed: () => onPressed,
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: const EdgeInsets.all(6.0),
  );
}
