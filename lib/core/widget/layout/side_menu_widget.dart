import 'package:blog/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/auth/presentation/bloc/auth_event.dart';
import 'package:blog/core/data/side_menu_data.dart';
import 'package:blog/core/model/ui/menu_model.dart';
import 'package:blog/core/route/app_routes.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A navigációt biztosító menü.
class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: const Color(0xFF171821),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(context, data, index),
      ),
    );
  }

  Widget buildMenuEntry(BuildContext context, SideMenuData data, int index) {
    final MenuModel menu = data.menu[index];
    final currentPath = ModalRoute.of(context)!.settings.name;
    final isSelected = menu is NavigationMenuModel && menu.path == currentPath;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        color: isSelected ? AppTheme.selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;

          if (menu is NavigationMenuModel) {
            AppRoutes.pushByPath(context, menu.path);
          } else if (SideMenuData.logout == menu.name) {
            context.read<AuthBloc>().add(AuthSignOutEvent());
          }
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(menu.icon, color: isSelected ? Colors.black : Colors.grey),
            ),
            Flexible(
              child: Text(
                menu.text,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.black : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
