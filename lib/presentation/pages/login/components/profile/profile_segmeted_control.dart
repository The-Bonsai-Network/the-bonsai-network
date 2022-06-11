import 'package:bonsai_network/application/user_provider_notifier.dart';
import 'package:flutter/material.dart';

import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/presentation/pages/common/material_segmented_control.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as p;

class ProfileSegmentedControlWidget extends ConsumerStatefulWidget {
  const ProfileSegmentedControlWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileSegmentedControlWidget> createState() =>
      _ProfileSegmentedControlWidgetState();
}

class _ProfileSegmentedControlWidgetState
    extends ConsumerState<ProfileSegmentedControlWidget> {
  Map<int, Widget> _segementedControlChildren(BuildContext context) => {
        0: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width / 3,
          child: const Center(child: Text('Male')),
        ),
        1: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width / 3,
          child: const Center(child: Text('Female')),
        ),
        2: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width / 3,
          child: const Center(child: Text('Other')),
        ),
      };

  Widget _buildSegmentedControl(LoginMenuNotifier model) {
    return FittedBox(
      fit: BoxFit.fill,
      child: MaterialSegmentedControl(
        children: _segementedControlChildren(context),
        selectionIndex: model.currentGenderIndex,
        borderColor: Colors.transparent,
        selectedColor: ThemeColor.primaryGreen.color,
        unselectedColor: ThemeColor.secondaryBackground.color,
        borderRadius: 6.0,
        verticalOffset: 8.0,
        horizontalPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        onSegmentChosen: (index) {
          setState(
            () {
              model.currentGenderIndex = index as int;
              ref.read(userProfileProvider.notifier).updateGender(index);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return p.Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => _buildSegmentedControl(model),
    );
  }
}
