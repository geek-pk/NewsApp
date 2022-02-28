import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeButton extends StatelessWidget {
  final String name;
  final bool? isVisible;
  final dynamic onPress;
  final double? width;
  final double? marginV;
  final double? marginH;

  const ThemeButton(
      {Key? key,
      required this.name,
      this.isVisible,
      this.onPress,
      this.width,
      this.marginH,
      this.marginV})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => onPress(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        width: width ?? MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).brightness == Brightness.dark
                ? colorArsenic92
                : Theme.of(context).primaryColor),
        child: Text(name, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
