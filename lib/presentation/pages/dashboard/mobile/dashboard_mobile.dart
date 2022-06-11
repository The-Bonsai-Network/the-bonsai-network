import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/application/dashboard_notifier.dart';
import 'package:bonsai_network/presentation/routes/app_router.dart';
import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';
import 'package:bonsai_network/presentation/pages/cofounders/cofounders_page.dart';

class DashboardPageMobile extends StatefulWidget {
  const DashboardPageMobile({Key? key}) : super(key: key);

  @override
  State<DashboardPageMobile> createState() => _DashboardPageMobileState();
}

class _DashboardPageMobileState extends State<DashboardPageMobile> {
  final String homeSvg = 'assets/images/home.svg';

  final String hamburgerSvg = 'assets/images/hamburger.svg';

  // int _selectedIndex = 0;

  // bool _showBottomSheet = false;

  // void _onItemTapped(
  //     BuildContext context, int index, SupplementarySidemenuNotifier model) {
  //   setState(() {
  //     _selectedIndex = index;

  //     _showBottomSheet = !_showBottomSheet && _selectedIndex == 1;

  //     if (_selectedIndex == 0) {
  //       model.currentRoute = CofoundersRoute.name;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardNotifier, SupplementarySidemenuNotifier>(
      builder: (context, model1, model2, _) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            AutoRouter(
              placeholder: (_) => CofoundersPage(),
              builder: (_, child) {
                switch (model2.currentRoute) {
                  case CofoundersRoute.name:
                    return CofoundersPage();

                  default:
                    return CofoundersPage();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
