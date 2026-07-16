import 'package:flutter/material.dart';

class Program {
  final String id;
  final String title;
  final String shortDescription;
  final String longDescription;
  final IconData icon;
  final double progress; // 0..1
  final String goalAmount;
  final String raisedAmount;
  final String category;

  const Program({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.icon,
    required this.progress,
    required this.goalAmount,
    required this.raisedAmount,
    required this.category,
  });
}