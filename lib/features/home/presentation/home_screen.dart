import 'package:disk_analyzer/core/theme/app_colors.dart';
import 'package:disk_analyzer/core/widgets/app_button.dart';
import 'package:disk_analyzer/core/widgets/file_type_summary.dart';
import 'package:disk_analyzer/core/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        // app bar contents which are humburger menu, title and settings icon
        title: Center(child: const Text('Storage Analyzer')),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],

        // bottom border
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(color: AppColors.cardDark, width: 1),
        ),
      ),

      // body contents
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            // Progress Ring Section
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    value: 0.7, // 70% used
                    strokeWidth: 22,
                    strokeCap: StrokeCap.round,
                    backgroundColor: AppColors.cardDark,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryBlue,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Used',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '70%',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '54,5 GB of 64 GB',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // scan short info section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'Internal Storage',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Last scan: 2 hours ago',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      labelText: 'Start smart Scan',
                      iconData: Icons.rocket_launch,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    onPressed: () {
                      // Handle advanced options
                    },
                    label: const Text('Advanced Options'),
                    icon: const Icon(Icons.tune),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),

            // File type summary section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cartegory Breakdown',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.0,
                children: [
                  StorageInfoCard(
                    category: 'Photos',
                    size: '3.4 GB',
                    percentage: 16,
                    icon: Icons.photo_library,
                    iconColor: AppColors.imageBlue,
                    progressColor: AppColors.imageBlue,
                  ),
                  StorageInfoCard(
                    category: 'Videos',
                    size: '12.1 GB',
                    percentage: 35,
                    icon: Icons.video_library,
                    iconColor: AppColors.videoPurple,
                    progressColor: AppColors.videoPurple,
                  ),
                  StorageInfoCard(
                    category: 'Apps & Data',
                    size: '4.2 GB',
                    percentage: 20,
                    icon: Icons.apps,
                    iconColor: AppColors.docsGreen,
                    progressColor: AppColors.docsGreen,
                  ),
                  StorageInfoCard(
                    category: 'Others',
                    size: '1.1 GB',
                    percentage: 10,
                    icon: Icons.folder,
                    iconColor: AppColors.others,
                    progressColor: AppColors.others,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
