import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/persistence/database.dart';
import 'package:bonsai_network/application/dashboard_notifier.dart';
import 'package:bonsai_network/presentation/pages/dashboard/mobile/dashboard_mobile.dart';
import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BonsaiDatabase>(
          create: (context) => getIt<BonsaiDatabase>(),
          dispose: (context, db) => db.close(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<DashboardNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<SupplementarySidemenuNotifier>(),
        ),
      ],
      child: const _DashboardPageWidget(),
    );
  }
}

class _DashboardPageWidget extends StatefulWidget {
  const _DashboardPageWidget({Key? key}) : super(key: key);

  @override
  State<_DashboardPageWidget> createState() => _DashboardPageStateState();
}

class _DashboardPageStateState extends State<_DashboardPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardNotifier>(
      builder: (context, model, _) {
        return const DashboardPageMobile();
      },
    );
  }
}
