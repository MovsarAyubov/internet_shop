import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/app_bar_with_leading.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../validation/validation_type.dart';
import '../../../../validation/validator.dart';
import '../../domain/entities/account_entity.dart';
import '../cubit/auth_page_cubit.dart';
import '../cubit/auth_page_state.dart';
import '../widgets/greeting_text.dart';
import '../widgets/text_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final validator = Validator(globalKey: GlobalKey<FormState>());
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final authPageCubit = AuthPageCubit();

  void clear() {
    userNameController.clear();
    passwordController.clear();
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: RobotoText(
      authPageCubit.state.signInOrUp == SignInOrUp.signUp
          ? authPageCubit.isUserNameExist(userNameController.text)
              ? AppLocalizations.of(context)!.userNameTaken
              : AppLocalizations.of(context)!.successReg
          : authPageCubit.isUserExist(Account(
                  userName: userNameController.text,
                  password: passwordController.text))
              ? AppLocalizations.of(context)!.successSignIn
              : AppLocalizations.of(context)!.incorrectData,
      fontSize: 16,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithLeading(appBarHeith: 64),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const GreetingText(),
            const SizedBox(
              height: 40,
            ),
            Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: validator.globalKey,
              child: BlocBuilder<AuthPageCubit, AuthPageState>(
                  bloc: authPageCubit,
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomTextField(
                            validationType: LettersAndDash.lettersAndDash,
                            controller: userNameController,
                            title: AppLocalizations.of(context)!.userName),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            showContent: true,
                            validationType: LettersAndNumbers.lettersAndNumbers,
                            controller: passwordController,
                            minLenght: true,
                            title: AppLocalizations.of(context)!.password),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (state.signInOrUp == SignInOrUp.signUp &&
                                        validator.validate()) {
                                      showSnackBar();
                                      if (!authPageCubit.isUserNameExist(
                                          userNameController.text)) {
                                        authPageCubit.signUp(Account(
                                            userName: userNameController.text,
                                            password: passwordController.text));

                                        clear();
                                        authPageCubit.signInOrUp();
                                      }
                                    } else if (state.signInOrUp ==
                                            SignInOrUp.signIn &&
                                        validator.validate()) {
                                      showSnackBar();
                                      if (authPageCubit.isUserExist(Account(
                                          userName: userNameController.text,
                                          password: passwordController.text))) {
                                        authPageCubit.signIn(Account(
                                            userName: userNameController.text,
                                            password: passwordController.text));
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  },
                                  child: RobotoText(state.signInOrUp ==
                                          SignInOrUp.signUp
                                      ? AppLocalizations.of(context)!.signUp
                                      : AppLocalizations.of(context)!.signIn)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RobotoText(
                              state.signInOrUp == SignInOrUp.signUp
                                  ? AppLocalizations.of(context)!.haveAnAccount
                                  : AppLocalizations.of(context)!
                                      .haveNotAccount,
                              color: blackText,
                              fontSize: 16,
                            ),
                            MyTextButton(
                                title: state.signInOrUp == SignInOrUp.signUp
                                    ? AppLocalizations.of(context)!.signIn
                                    : AppLocalizations.of(context)!.signUp,
                                callback: () {
                                  authPageCubit.signInOrUp();
                                })
                          ],
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
