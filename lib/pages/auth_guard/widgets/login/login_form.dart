import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/color_constants.dart';
import 'package:restaurant_orders/core/resources/icon_constants.dart';
import 'package:restaurant_orders/core/resources/radius_constants.dart';
import 'package:restaurant_orders/core/resources/spacing_constants.dart';
import 'package:restaurant_orders/core/resources/string_constants.dart';
import 'package:restaurant_orders/core/resources/styles_constants.dart';
import 'package:restaurant_orders/core/widgets/error_message_snack_bar.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/main.dart';
import 'package:restaurant_orders/state_management/auth_guard/auth_providers.dart';
import 'package:restaurant_orders/state_management/auth_guard/signin/signin_provider.dart';
import 'package:restaurant_orders/state_management/auth_guard/signin/signin_state.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late final FormGroup form;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      StringConstants.kMobileNumberKey: FormControl<String>(
          validators: [Validators.required, Validators.number], value: ''),
      StringConstants.kFPinKey: FormControl<String>(
          validators: [Validators.required, Validators.number], value: ''),
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ReactiveForm(
        formGroup: form,
        child: SizedBox(
          width: StylesConstants.kLoginFormWidth,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: const BorderRadius.only(
                  topLeft: RadiusConstants.kR16,
                  topRight: RadiusConstants.kR16,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: ColorConstants.kBlack50,
                    blurRadius: SpacingConstants.kS4,
                    offset: Offset(1.5, 1.5), // Shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: RadiusConstants.kR16,
                        topRight: RadiusConstants.kR16,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: SpacingConstants.kS20,
                      ),
                      child: Center(
                        child: Text(packageInfo.appName,
                            style: TextStyle(
                                fontWeight: StylesConstants.kHeadingWeight,
                                fontSize: StylesConstants.kHeadingSize,
                                color: Theme.of(context)
                                    .primaryColor
                                    .getForegroundColor())),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: SpacingConstants.kS10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: SpacingConstants.kS30,
                                vertical: SpacingConstants.kS10),
                            child: ReactiveTextField(
                              formControlName: StringConstants.kMobileNumberKey,
                              decoration: const InputDecoration(
                                prefixIcon: Center(
                                  widthFactor: 0,
                                  child: IconConstants.kMobileIcon,
                                ),
                                fillColor: ColorConstants.kWhite,
                                errorStyle: TextStyle(
                                  color: ColorConstants.kWhite,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorConstants.kWhite,
                                  ),
                                ),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(RadiusConstants.kR8),
                                ),
                                hintText: StringConstants.kMobileNumberLabel,
                              ),
                              onSubmitted: () {
                                form.control(StringConstants.kFPinKey).focus();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: SpacingConstants.kS30,
                              vertical: SpacingConstants.kS10,
                            ),
                            child: ReactiveTextField(
                              formControlName: StringConstants.kFPinKey,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                prefixIcon: const Center(
                                  widthFactor: 0,
                                  child: IconConstants.kMPINIcon,
                                ),
                                suffixIcon: IconButton(
                                  icon: hidePassword
                                      ? IconConstants.kHideMPIN
                                      : IconConstants.kShowMPIN,
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),
                                fillColor: ColorConstants.kWhite,
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorConstants.kWhite,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: ColorConstants.kWhite,
                                ),
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(RadiusConstants.kR8),
                                ),
                                hintText: StringConstants.kFPinLabel,
                              ),
                              onSubmitted: () {
                                var userNameControl = form
                                    .control(StringConstants.kMobileNumberKey);
                                if (userNameControl.value == null ||
                                    (userNameControl.value as String)
                                        .trim()
                                        .isEmpty) {
                                  userNameControl.focus();
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: SpacingConstants.kS30,
                              vertical: SpacingConstants.kS5,
                            ),
                            child: Consumer(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    minimumSize: const Size(
                                        double.infinity, SpacingConstants.kS50),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(RadiusConstants.kR8),
                                    ),
                                  ),
                                  onPressed: () {
                                    _onLoginButtonPressed();
                                  },
                                  child: Text(
                                    StringConstants.kLogin.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: StylesConstants.kTitleWeight,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .getForegroundColor(),
                                      fontSize: StylesConstants.kTitleSize,
                                    ),
                                  ),
                                ),
                                builder: (context, ref, child) {
                                  ref.listen<SignInState>(
                                      signInNotifierProvider,
                                      (previous, state) {
                                    state.maybeWhen(
                                        orElse: () {},
                                        error: (failure, onRetry) =>
                                            ErrorMsgSnackBar.build(
                                                message: failure.message),
                                        authenticated: () {
                                          ref
                                              .read(
                                                  authNotifierProvider.notifier)
                                              .isUserLoggedIn();
                                        });
                                  });
                                  final state =
                                      ref.watch(signInNotifierProvider);
                                  return state.maybeWhen(
                                    orElse: () => Column(
                                      children: [
                                        child!,
                                        const SizedBox(
                                          height: SpacingConstants.kS40,
                                        )
                                      ],
                                    ),
                                    submitting: () {
                                      FocusScope.of(context).unfocus();
                                      return const Loading();
                                    },
                                  );
                                }),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginButtonPressed() {
    if (form.valid) {
      String username = form.control(StringConstants.kMobileNumberKey).value;
      String password = form.control(StringConstants.kFPinKey).value;
      ref.refresh(signInNotifierProvider);
      ref
          .read(signInNotifierProvider.notifier)
          .signInWithCredentials(mobileNumber: username, fPin: password);
    } else {
      form.markAllAsTouched();
    }
  }
}
