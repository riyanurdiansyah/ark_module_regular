import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkRowWithWidgetAndString extends StatelessWidget {
  final Widget? leftWidget;
  final double spaceBetween;
  final String? rightString;
  final TextStyle? rightTextStyle;
  final bool expandedRightString;

  const ArkRowWithWidgetAndString({
    Key? key,
    this.leftWidget,
    this.spaceBetween = 5,
    this.rightString,
    this.rightTextStyle,
    this.expandedRightString = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leftWidget!,
        SizedBox(width: spaceBetween),
        expandedRightString == true
            ? SizedBox(
                width: Get.width * 0.3,
                child: Text(
                  rightString!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: rightTextStyle ??
                      TextStyle(
                        color: Colors.white,
                        fontSize: Get.size.shortestSide < 600 ? 11.5 : 18,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              )
            : Text(
                rightString!,
                maxLines: 1,
                style: rightTextStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: Get.size.shortestSide < 600 ? 11.5 : 18,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
      ],
    );
  }
}
