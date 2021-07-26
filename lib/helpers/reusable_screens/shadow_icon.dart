import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef VoidCallback = void Function();

class AdaptableShadowIcon extends StatelessWidget {
  final Color boxShadow;
  final String iconUrl;
  final num radius;
  final num imageHeight;
  final num imageWidth;
  final VoidCallback voidCallback;
  const AdaptableShadowIcon(
      {Key key,
        this.boxShadow,
        this.iconUrl,
        this.radius,
        this.imageHeight,
        this.imageWidth,
        this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: boxShadow, spreadRadius: radius)]
        ),
        child: Image.asset(iconUrl, height: imageHeight, width: imageWidth),
      ),
    );
  }
}
