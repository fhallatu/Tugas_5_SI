import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, this.backgroundcolor, this.title, this.actions, this.leading})
      : super(key: key);

  final Widget? title;
  final Color? backgroundcolor;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundcolor,
      title: title,
      leading: leading,
      actions: actions,
    );
  }
}
