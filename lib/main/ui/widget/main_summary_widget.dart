import 'package:blog/core/data/summary_data.dart';
import 'package:blog/core/util/responsive.dart';
import 'package:blog/main/ui/widget/main_summary_card_widget.dart';
import 'package:flutter/material.dart';

/// Főoldalon használt összegzés, mely [MainSummaryCardWidget] kártyákon
/// jeleníti meg a kiemelt infókat.
///
/// Lásd [SummaryData].
class MainSummaryWidget extends StatelessWidget {
  const MainSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final summaryData = SummaryData();

    return GridView.builder(
      itemCount: summaryData.healthData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) => MainSummaryCardWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              summaryData.healthData[index].icon,
              color: summaryData.healthData[index].color,
              size: 36,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 4),
              child: Text(
                summaryData.healthData[index].value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              summaryData.healthData[index].title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
