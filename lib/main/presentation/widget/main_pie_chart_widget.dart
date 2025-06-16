import 'package:blog/core/data/chart_data.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Minta chart a jobb oldali panelra.
class MainPieChartWidget extends StatelessWidget {
  const MainPieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pieChartData = ChartData();

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: pieChartData.paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppTheme.defaultPadding),
                Text(
                  "70%",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, height: 0.5),
                ),
                const SizedBox(height: 8),
                const Text("100%-ból"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
