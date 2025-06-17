import 'dart:ui';

import 'package:blog/core/config/config.dart';
import 'package:fl_chart/fl_chart.dart';

/// Minta chart data.
class ChartData {
  final paiChartSelectionDatas = [
    PieChartSectionData(color: AppTheme.primaryColor, value: 25, showTitle: false, radius: 25),
    PieChartSectionData(color: const Color(0xFF26E5FF), value: 20, showTitle: false, radius: 22),
    PieChartSectionData(color: const Color(0xFFFFCF26), value: 10, showTitle: false, radius: 19),
    PieChartSectionData(color: const Color(0xFFEE2727), value: 15, showTitle: false, radius: 16),
    PieChartSectionData(
      color: AppTheme.primaryColor.withAlpha((255.0 * 0.1).round()),
      value: 25,
      showTitle: false,
      radius: 13,
    ),
  ];
}
