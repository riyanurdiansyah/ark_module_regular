import 'package:flutter/material.dart';

class ButtonReusableWidget extends StatelessWidget {
  final bool isOutlinedButton;
  final VoidCallback onPressed;
  final String? title;
  final Widget? widget;
  final double? width;
  final double? height;
  final MaterialStateProperty<OutlinedBorder>? shapeOutline;
  final List<Color>? colorGradient;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final OutlinedBorder? shape;
  final Color? backgroundColor;
  final MaterialStateProperty<Color?>? backgroundColorOutline;
  final MaterialStateProperty<EdgeInsetsGeometry?>? paddingOutline;
  final MaterialStateProperty<Size?>? minimumSize;
  final MaterialStateProperty<Size?>? maximumSize;
  final MaterialStateProperty<Size?>? fixedSize;
  final MaterialStateProperty<BorderSide?>? borderSide;
  final Gradient? isGradient;

  const ButtonReusableWidget({
    Key? key,
    required this.isOutlinedButton,
    required this.onPressed,
    this.widget,
    this.title,
    this.height,
    this.maximumSize,
    this.minimumSize,
    this.fixedSize,
    this.paddingOutline,
    this.shapeOutline,
    this.borderSide,
    this.borderRadius,
    this.margin,
    this.width,
    this.backgroundColorOutline,
    this.colorGradient,
    this.isGradient,
    this.titleStyle,
    this.shape,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOutlinedButton == true
        ? SizedBox(
            width: width,
            height: height,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: shapeOutline,
                backgroundColor: backgroundColorOutline,
                padding: paddingOutline,
                minimumSize: minimumSize,
                maximumSize: maximumSize,
                fixedSize: fixedSize,
                side: borderSide,
              ),
              onPressed: onPressed,
              child: widget ??
                  Center(
                    child: Text(
                      title!,
                      style: titleStyle,
                    ),
                  ),
            ),
          )
        : InkWell(
            onTap: onPressed,
            child: Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                color: isGradient == null ? backgroundColor : null,
                borderRadius: borderRadius,
                gradient: isGradient != null
                    ? LinearGradient(
                        //You have be able to inizialized colors as []
                        //Then you can put the colors as you want on property 'colorGradient'
                        colors: colorGradient ??
                            const [
                              Color(0xff0977BE),
                              Color(0xff139DD6),
                            ],
                      )
                    : null,
              ),
              child: widget ??
                  Center(
                    child: Text(
                      title!,
                      style: titleStyle,
                    ),
                  ),
            ),
          );
  }
}
