import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class DecoratedContentCard extends StatelessWidget {
  final Widget title;
  final double? elevation;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final Color titleBgColor;
  final Widget content;
  final Color contentBgColor;
  final List<Widget>? actions;
  final double? height;

  const DecoratedContentCard({
    Key? key,
    required this.title,
    required this.titleBgColor,
    required this.content,
    this.actions,
    this.height,
    required this.contentBgColor,
    this.titlePadding = const EdgeInsets.all(SpacingConstants.kS0),
    this.contentPadding = const EdgeInsets.all(SpacingConstants.kS0),
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = Padding(
      padding: contentPadding,
      child: Column(
        children: [
          content,
          if (actions != null)
            Padding(
              padding: titlePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: actions!
                    .map(
                      (e) => Expanded(
                        child: Row(children: [
                          Expanded(child: e),
                          if (actions!.indexOf(e) != actions!.length - 1)
                            SizedBox(
                              width: contentPadding.horizontal / 2,
                            ),
                        ]),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
    var column = Column(
      children: [
        Container(
            padding: titlePadding,
            decoration: ShapeDecoration(
                shape: StylesConstants.kCardTitleShape, color: titleBgColor),
            child: title),
        child,
      ],
    );
    return Card(
      elevation: elevation,
      shape: StylesConstants.kCardShape,
      color: contentBgColor,
      child: height == null
          ? column
          : SizedBox(
              width: double.infinity,
              height: height,
              child: column,
            ),
    );
  }
}
