import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/application/login_menu_notifier.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/profile_segmeted_control.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/profile_form_button.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/profile_form_header.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/profile_text_form_field.dart';
import 'package:bonsai_network/presentation/pages/login/components/profile/profile_form_date_picker.dart';

class LoginProfilePage extends StatefulWidget {
  const LoginProfilePage({Key? key}) : super(key: key);

  @override
  State<LoginProfilePage> createState() => _LoginProfilePageState();
}

class _LoginProfilePageState extends State<LoginProfilePage> {
  final _formKey = GlobalKey<FormState>();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginMenuNotifier>(
      builder: (context, model, _) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ProfileFormHeaderWidget(header: 'PERSONAL'),
              const ProfileTextFormFieldWidget(
                placeholder: 'First Name',
                validatorText: 'Fist Name is required',
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 8.0,
                endIndent: 8.00,
                color: ThemeColor.primaryGreen.color.withOpacity(0.4),
              ),
              const ProfileTextFormFieldWidget(
                placeholder: 'Surname',
                validatorText: 'Surname is required',
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              const ProfileFormHeaderWidget(header: 'CONTACT INFORMATION'),
              const ProfileTextFormFieldWidget(
                placeholder: 'Email',
                validatorText: 'Email is required',
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 8.0,
                endIndent: 8.00,
                color: ThemeColor.primaryGreen.color.withOpacity(0.4),
              ),
              const ProfileTextFormFieldWidget(
                placeholder: 'Confirm Email',
                validatorText: 'Confirm Email is required',
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              const ProfileFormHeaderWidget(header: 'GENERAL INFORMATION'),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(children: [
                  const ProfileSegmentedControlWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 1.0,
                      thickness: 1.0,
                      indent: 8.0,
                      endIndent: 8.00,
                      color: ThemeColor.primaryGreen.color.withOpacity(0.4),
                    ),
                  ),
                  const ProfileFormDatePickerWidget(),
                ]),
              ),
              ProfileFormButtonWidget(authFormKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}
