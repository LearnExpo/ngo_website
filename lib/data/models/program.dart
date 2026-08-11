import 'package:flutter/material.dart';
import '../../core/localization/localized_text.dart';

class Program {
  final String id;
  final LocalizedText title;
  final LocalizedText shortDescription;
  final LocalizedText longDescription;
  final LocalizedText category;
  final IconData icon;
  final double progress;
  final String goalAmount;
  final String raisedAmount;
  final String? imageUrl;

  const Program({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.category,
    required this.icon,
    required this.progress,
    required this.goalAmount,
    required this.raisedAmount,
    required this.imageUrl,
  });
}