import 'package:blog/core/widget/layout/header_widget.dart';
import 'package:blog/core/widget/layout/side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:ter_ui/ter_ui.dart';

/// Minden képernyőn használható responzív elrendezést biztosító
/// [StatelessWidget]. Biztosítja bal oldalon a navigációt támogató
/// [SideMenuWidget]-et, középen a kapott elsődleges tartalmat
/// ([LayoutWidget.main]) és egy opcionális jobb  oldali részt
/// ([LayoutWidget.summary]).
class LayoutWidget extends StatelessWidget {
  /// Maximális szélesség desktop méretű képernyő esetén.
  final double maxDesktopContentWidth;

  /// Az elsődleges tartalom.
  final Widget main;

  /// Opcionális jobb oldali, összegző tartalom.
  final Widget? summary;

  const LayoutWidget({
    super.key,
    required this.main,
    this.summary,
    this.maxDesktopContentWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      drawer: !isDesktop ? const SizedBox(width: 250, child: SideMenuWidget()) : null,
      endDrawer: isMobile && summary != null
          ? SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: summary)
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              ConstrainedBox(constraints: BoxConstraints(maxWidth: 250), child: SideMenuWidget()),
            Expanded(
              flex: 7,
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        HeaderWidget(hasSummary: summary != null),
                        const SizedBox(height: 18),
                        Container(
                          constraints: BoxConstraints(maxWidth: maxDesktopContentWidth),
                          child: main,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (isDesktop && summary != null) Expanded(flex: 3, child: summary!),
          ],
        ),
      ),
    );
  }
}
