import 'package:flutter/material.dart';

/// Власний незмінний віджет для відображення рейтингу від 0 до 5.
class RatingBadge extends StatelessWidget {
  final double rating;
  final String? label;

  const RatingBadge({
    super.key,
    required this.rating,
    this.label,
  }) : assert(rating >= 0 && rating <= 5, 'Рейтинг має бути в межах 0–5');

  Color getRatingColor(BuildContext context) {
    if (rating >= 4.0) return Colors.green;
    if (rating >= 2.5) return Colors.orange;
    return Theme.of(context).colorScheme.error;
  }

  @override
  Widget build(BuildContext context) {
    final color = getRatingColor(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(Icons.star, color: color, size: 28),
          Text(
            rating.toStringAsFixed(1).replaceAll('.', ','),
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          if (label != null && label!.trim().isNotEmpty)
            Text(label!.trim(), style: const TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}
