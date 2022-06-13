import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/injection.dart';
import 'package:bonsai_network/application/supplementary_sidemenu_notifier.dart';

class CofoundersPage extends StatefulWidget {
  const CofoundersPage({Key? key}) : super(key: key);

  @override
  State<CofoundersPage> createState() => _CofoundersPageState();
}

class _CofoundersPageState extends State<CofoundersPage> {
  final auth = getIt<FirebaseAuth>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SupplementarySidemenuNotifier>(
      builder: (context, model, _) => Center(
        child: ElevatedButton(
          child: const Text('Logout'),
          onPressed: () {
            setState(() {
              auth.signOut();
            });
          },
        ),
      ),
    );
  }
}
