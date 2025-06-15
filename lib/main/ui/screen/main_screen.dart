import 'package:blog/core/widget/layout/layout_widget.dart';
import 'package:blog/main/ui/widget/main_pie_chart_widget.dart';
import 'package:blog/main/ui/widget/main_recent_blog_widget.dart';
import 'package:blog/main/ui/widget/main_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:blog/core/theme/app_theme.dart';

/// Főoldal képernyő.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      main: MainSummaryWidget(),
      summary: Container(
      decoration: const BoxDecoration(
        color: AppTheme.cardBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            MainPieChartWidget(),
            SizedBox(height: 20),
            MainRecentBlogWidget(),
          ],
        ),
      ),
    ),
    );
  }
}
