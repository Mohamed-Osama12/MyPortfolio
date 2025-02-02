import 'package:flutter/material.dart';

class HelperClass extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final double paddingWidth;
  final Color backgroundColor;
  final Color backgroundColor2;
  const HelperClass({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.paddingWidth,
    required this.backgroundColor,
    required this.backgroundColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return Container(
            // height: size.height,
            width: size.width,
            alignment: Alignment.center,
            // color: backgroundColor,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
               colors: [
                backgroundColor,
                backgroundColor2,
              ]
              ),
            ),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.05, horizontal: 18),
            child: mobile,
          );
        } else if (constraints.maxWidth < 1200) {
          return Container(
            // height: size.height,
            width: size.width,
            alignment: Alignment.center,
            // color: backgroundColor,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    backgroundColor,
                    backgroundColor2,
                  ]
              ),
            ),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.1, horizontal: paddingWidth),
            child: tablet,
          );
        } else {
          return Container(
            // height: size.height,
            width: size.width,
            alignment: Alignment.center,
            // color: backgroundColor,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    backgroundColor,
                    backgroundColor2,
                    backgroundColor2,
                  ]
              ),
            ),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.18, horizontal: paddingWidth),
            child: desktop,
          );
        }
      },
    );
  }
}
