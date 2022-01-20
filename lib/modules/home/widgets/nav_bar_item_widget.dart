import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class NavBarItemWidget extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final bool isSelected;
  final String menuText;

  const NavBarItemWidget({
    Key? key,
    required this.onTap,
    required this.image,
    required this.menuText,
    required this.isSelected,
  }) : super(key: key);

  Color? get _color => isSelected
      ? kColorPrimary
      : true
          ? Colors.grey[900]
          : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 60,
          child: Column(
            children: <Widget>[
              Center(
                child: image.isEmpty
                    ? Container()
                    : Image.asset(
                        'assets/images/$image.png',
                        height: 25,
                        color: _color,
                      ),
              ),
              Text(
                '$menuText',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )),
    );
  }
}
