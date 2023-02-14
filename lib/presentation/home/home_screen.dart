import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../core/collaction_icons.dart';
import '../routes/app_routes.gr.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        CrowdactionRouter(),
        UserProfileRouter(),
        if (!kReleaseMode) ...[
          DemoScreenRouter(),
        ],
      ],
      bottomNavigationBuilder: (_, tabsRouter) => bottomNavbar(
        tabsRouter,
        context,
      ),
    );
  }

  Widget bottomNavbar(TabsRouter tabsRouter, BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: context.background,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: context.colors.enabledButtonColor,
      unselectedItemColor: context.colors.disabledButtonColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CollactionIcons.collaction),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CollactionIcons.user),
          label: '',
        ),
        if (!kReleaseMode) ...[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_outlined,
            ),
            label: '',
          ),
        ],
      ],
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
    );
  }
}
