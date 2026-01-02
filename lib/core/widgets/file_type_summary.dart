// file type summary widget for my app
import 'package:disk_analyzer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StorageInfoCard extends StatelessWidget {
  final String category;
  final String size;
  final double percentage;
  final IconData icon;
  final Color iconColor;
  final double iconSize = 30;
  final Color progressColor;

  const StorageInfoCard({
    Key? key,
    required this.category,
    required this.size,
    required this.percentage,
    required this.icon,
    required this.iconColor,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a dark color close to the image's background
    const Color cardColor = AppColors.cardDark;
    const Color textColor = AppColors.textPrimary;

    final pct = (percentage.clamp(0, 100)) / 100.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: iconColor),
              ),
              Text(
                '${(pct * 100).round()}%',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            size,
            style: const TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 6,
              child: LinearProgressIndicator(
                value: pct,
                backgroundColor: Colors.white12,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: 6.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
