import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class ModalSelect<Type> extends StatefulWidget {
  final String title;
  final Map<Type, String> items;
  const ModalSelect({
    Key? key,
    required this.items,
    required this.title,
  }) : super(key: key);

  @override
  State<ModalSelect<Type>> createState() => _ModalSelectState<Type>();
}

class _ModalSelectState<Type> extends State<ModalSelect<Type>> {
  @override
  Widget build(BuildContext context) {
    var selectables = widget.items.entries;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(SpacingConstants.kS16),
      contentPadding:
          const EdgeInsets.all(SpacingConstants.kS16).copyWith(top: 0),
      shape: StylesConstants.kDialogShape,
      title: Text(
        widget.title,
      ),
      // scrollable: true,
      titleTextStyle: TextStyle(
          fontWeight: StylesConstants.kTitleWeight,
          fontSize: StylesConstants.kTitleSize,
          color: Theme.of(context).primaryColor),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: selectables
              .map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          enableFeedback: false,
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: SpacingConstants.kS4),
                          onTap: () => Navigator.of(context).pop<Type>(e.key),
                          title: Text(
                            e.value,
                            style: const TextStyle(
                                fontWeight: StylesConstants.kSubTitleWeight,
                                fontSize: StylesConstants.kSubTitleSize,
                                color: ColorConstants.kBlack),
                          )),
                      if (selectables.last.key != e.key)
                        const Divider(
                          color: ColorConstants.kGrey,
                          thickness: SpacingConstants.kS1,
                          height: SpacingConstants.kS1,
                        ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
