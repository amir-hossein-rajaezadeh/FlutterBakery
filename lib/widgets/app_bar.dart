import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  
  final Color backgroundColor;
  final Widget leadingIcon;

  final Widget title;

  final List<Widget> actions;

  CustomAppBar({
    super.key,
    this.backgroundColor = Colors.blue,
    required this.leadingIcon,
    required this.title,
    this.actions = const [],
  }) : super(
          backgroundColor: backgroundColor,
          leading: leadingIcon,
          title: title,
          actions: actions,
        );
}
