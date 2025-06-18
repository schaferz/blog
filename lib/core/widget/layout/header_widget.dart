import 'package:blog/core/core.dart';
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
        Expanded(child: NavigationAutocomplete()),
        if (Responsive.isMobile(context))
          Row(
            children: [
              SizedBox(width: 10),
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

/// Menü keresést és navigációt megvalósító autocomplete.
class NavigationAutocomplete extends StatelessWidget {
  static List<String> options = List.from(AppRoutes.navigationMap.keys);

  const NavigationAutocomplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      displayStringForOption: (option) => AppRoutes.routeNameMap[option] ?? option,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return options.where((String option) {
          return AppRoutes.routeNameMap[option]!.contains(textEditingValue.text);
        });
      },
      onSelected: (String selection) {
        AppRoutes.pushByPath(context, selection);
      },
      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          decoration: const InputDecoration(
            hintText: 'Keresés',
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 21),
          ),
          // decoratteion: const InputDecoration(border: OutlineInputBorder()),
          controller: textEditingController,
          focusNode: focusNode,
        );
      },
    );
  }
}
