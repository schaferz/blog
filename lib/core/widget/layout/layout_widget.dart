import 'package:blog/core/util/responsive.dart';
import 'package:blog/core/widget/layout/header_widget.dart';
import 'package:blog/core/widget/layout/side_menu_widget.dart';
import 'package:flutter/material.dart';

/// Minden képernyőn használható responzív elrendezést biztosító
/// [StatelessWidget]. Biztosítja bal oldalon a navigációt támogató
/// [SideMenuWidget]-et, középen a kapott elsődleges tartalmat
/// ([LayoutWidget.main]) és egy opcionális jobb  oldali részt
/// ([LayoutWidget.summary]).
class LayoutWidget extends StatelessWidget {
  /// Az elsődleges tartalom.
  final Widget main;

  /// Opcionális jobb oldali, összegző tartalom.
  final Widget? summary;

  const LayoutWidget({super.key, required this.main, this.summary});

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
                        const HeaderWidget(),
                        const SizedBox(height: 18),
                        main,
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
