import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_tracker_app/src/config/helpers/handle_validation_email.dart';
import 'package:game_tracker_app/src/config/helpers/handle_validation_empty_input.dart';
import 'package:game_tracker_app/src/presentation/providers/login/login_provider.dart';
import 'package:game_tracker_app/src/presentation/screens/games/games_screen.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_form.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_button.dart';
import 'package:game_tracker_app/src/presentation/widgets/custom_input.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'widgets/wave.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const name = 'login';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          const Wave(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: size.height * .35,
                  child: SvgPicture.asset('assets/images/park.svg'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: _FormLogin(textStyle: textStyle, size: size),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({
    required this.textStyle,
    required this.size,
  });

  final TextTheme textStyle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final navigate = context;
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (__, data, child) => CustomForm(
          keyForm: data.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity),
              SizedBox(height: size.height * .04),
              Center(
                child: Text(
                  'Login',
                  style: textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Text(
                'Email',
                style: textStyle.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: size.height * .002),
              CustomInput(
                hintText: 'Ingrese email',
                controller: data.email,
                keyboardType: TextInputType.emailAddress,
                iconLeft: Icons.mail,
                validate: (email) => HandleValidationEmail.validEmail(email),
              ),
              SizedBox(height: size.height * .004),
              Text(
                'Clave',
                style: textStyle.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: size.height * .002),
              CustomInput(
                controller: data.password,
                hintText: 'Ingrese clave',
                iconLeft: Icons.password,
                validate: (clave) =>
                    HandleValidationEmptyInput.emptyInput(clave),
                isObscureText: data.showPassword,
                iconRight: IconButton(
                  onPressed: () => data.handlerShowPassword(),
                  icon: !data.showPassword
                      ? const Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                        )
                      : const Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: size.height * .04),
              Center(
                child: CustomButton(
                    label: 'Login',
                    icon: Icons.login,
                    action: () async {
                      final login = await data.submit(context);
                      if (login) {
                        navigate.pushNamed(GamesScreen.name);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
