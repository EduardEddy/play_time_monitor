import 'package:flutter/material.dart';
import 'package:game_tracker_app/src/config/helpers/handle_validation_empty_input.dart';
import 'package:game_tracker_app/src/presentation/providers/guest/create/create_guest_provider.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_appbar.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_button.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_dropdown.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_form.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_input.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateGuestScreen extends StatelessWidget {
  final String attractionId;
  const CreateGuestScreen({super.key, required this.attractionId});
  static const String name = 'guest-create';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Nuevo',
        back: () => context.go('/attractions/$attractionId/guests'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => CreateGuestProvider(context, attractionId),
        child: Consumer<CreateGuestProvider>(
          builder: (__, data, child) => CustomForm(
            keyForm: data.formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  CustomInput(
                    hintText: 'Nombre del niño',
                    validate: (kid) =>
                        HandleValidationEmptyInput.emptyInput(kid),
                    iconLeft: Icons.person_pin,
                    controller: data.fullnameKid,
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    hintText: 'Descripión',
                    validate: (desc) => null,
                    iconLeft: Icons.abc_outlined,
                    controller: data.description,
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    hintText: 'Nombre del representante',
                    validate: (String? name) =>
                        HandleValidationEmptyInput.emptyInput(name),
                    iconLeft: Icons.person,
                    controller: data.fullnameParent,
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    hintText: 'Telf',
                    validate: (phone) =>
                        HandleValidationEmptyInput.emptyInput(phone),
                    keyboardType: TextInputType.phone,
                    iconLeft: Icons.phone_android,
                    controller: data.phone,
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    defaultValue: data.selected,
                    items: data.schedule,
                    onChange: (selected) => data.onChange(selected!),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.watch_later_outlined),
                        const SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            text: 'Hora estimada de inicio',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: data.parseTime(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(
                      label: 'Guardar y registrar otro',
                      icon: Icons.save_alt,
                      action: () => data.submit(context, '1'),
                      bgColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
