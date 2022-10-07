import 'package:flutter/material.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({
    Key? key,
    required this.listMenu,
    this.icon,
    this.offset,
  }) : super(key: key);

  final List<PopupMenuEntry> listMenu;
  final Widget? icon;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      tooltip: '',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      offset: offset ?? const Offset(0, 0),
      itemBuilder: (context) => listMenu,
      icon: icon,
    );
  }
}
