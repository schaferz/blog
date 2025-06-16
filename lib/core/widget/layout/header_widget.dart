import 'package:blog/core/util/responsive.dart';
import 'package:flutter/material.dart';

/// Általános fejléc mely tartalmazza a keresőt.
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.menu, color: Colors.grey, size: 25),
              ),
            ),
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Keresés',
                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 21),
              ),
            ),
          ),
        if (Responsive.isMobile(context))
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey, size: 25),
                onPressed: () {},
              ),
              InkWell(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Icon(Icons.info_outline, color: Colors.grey, size: 25),
              ),
            ],
          ),
      ],
    );
  }
}
