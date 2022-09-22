import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class ChipInputTextField extends HookConsumerWidget {
  final FormControl<String> formControl;
  final void Function(FormControl<String> formControl)? onChanged;

  const ChipInputTextField({
    Key? key,
    required this.formControl,
    this.onChanged,
  }) : super(key: key);

  // StreamSubscription _listenChanges() {
  //   return formControl.valueChanges.listen(
  //     (value) {
  //       onChanged?.call(formControl);
  //     },
  //     cancelOnError: true,
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   final subscription = _listenChanges();
    //   return subscription.cancel;
    // });
    return ReactiveFormField<String, String>(
        formControl: formControl,
        builder: (ReactiveFormFieldState<String, String> field) {
          final isDisabled = field.control.disabled;
          return InputDecorator(
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(SpacingConstants.kS0),
              enabled: !isDisabled,
              errorText: field.errorText,
              errorStyle: const TextStyle(
                color: ColorConstants.kErrorRed,
                height: 0.2,
              ),
              errorMaxLines: 5,
            ),
            child: Chip(
              shape: StadiumBorder(
                  side: BorderSide(
                      color: field.control.hasErrors
                          ? ColorConstants.kErrorRed
                          : ColorConstants.kTransparent)),
              backgroundColor: ColorConstants.kWhite,
              label: ReactiveTextField<String>(
                formControl: formControl,
                showErrors: (_) => false,
                onChanged: onChanged,
                decoration: const InputDecoration(
                  hintText: StringConstants.kEnterTable,
                  isDense: true,
                  errorText: null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(SpacingConstants.kS4),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstants.kWhite.getForegroundColor(),
                  fontSize: StylesConstants.kTitleSize,
                  fontWeight: StylesConstants.kTitleWeight,
                ),
              ),
            ),
          );
        });
  }
}
// class ChipInputTextField extends StatefulWidget {
//   final FormControl<String> formControl;
//   final void Function(FormControl<String> formControl)? onChanged;
//
//   const ChipInputTextField({
//     Key? key,
//     required this.formControl,
//     this.onChanged,
//   }) : super(key: key);
//
//   @override
//   State<ChipInputTextField> createState() => _ChipInputTextFieldState();
// }
//
// class _ChipInputTextFieldState extends State<ChipInputTextField> {
//   StreamSubscription? _subscription;
//
//   @override
//   void initState() {
//     super.initState();
//     _subscription = _listenChanges();
//   }
//
//
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveFormField<String, String>(
//         formControl: widget.formControl,
//         builder: (ReactiveFormFieldState<String, String> field) {
//           final isDisabled = field.control.disabled;
//           return InputDecorator(
//             decoration: InputDecoration(
//               isDense: true,
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.all(SpacingConstants.kS0),
//               enabled: !isDisabled,
//               errorText: field.errorText,
//               errorStyle: const TextStyle(
//                 color: ColorConstants.kErrorRed,
//                 height: 0.2,
//               ),
//               errorMaxLines: 5,
//             ),
//             child: Chip(
//               shape: StadiumBorder(
//                   side: BorderSide(
//                       color: field.control.hasErrors
//                           ? ColorConstants.kErrorRed
//                           : ColorConstants.kTransparent)),
//               backgroundColor: ColorConstants.kWhite,
//               label: ReactiveTextField<String>(
//                 formControl: widget.formControl,
//                 showErrors: (_) => false,
//                 decoration: const InputDecoration(
//                   hintText: StringConstants.kEnterTable,
//                   isDense: true,
//                   errorText: null,
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.all(SpacingConstants.kS4),
//                 ),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: ColorConstants.kWhite.getForegroundColor(),
//                   fontSize: StylesConstants.kTitleSize,
//                   fontWeight: StylesConstants.kTitleWeight,
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
