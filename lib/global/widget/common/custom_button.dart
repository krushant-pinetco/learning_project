import 'package:flutter/material.dart';
import 'package:learning_project/global/packages/config_package.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final double? padding;
  final double? radius;
  final Function()? onTap;
  final TextStyle? style;
  final Color? color;
  final Widget? icon;
  final double? width;
  final Border? border;

  const CustomButton({
    Key? key,
    this.title,
    this.padding = 15,
    this.radius = 5,
    this.onTap,
    this.style,
    this.color,
    this.icon,
    this.width,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        appScreenUtil.borderRadius(radius!),
      ),
      child: Container(
        color: color ?? appColor.primaryColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(appScreenUtil.size(padding!)),
              width: width != null ? appScreenUtil.size(width!) : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: border,
                borderRadius: radius! > 0 ? BorderRadius.circular(appScreenUtil.borderRadius(radius!)) : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!helper.isNull(icon))
                    Row(
                      children: [
                        icon!,
                        SizedBox(
                          width: appScreenUtil.size(10),
                        ),
                      ],
                    ),
                  Text(
                    title!,
                    style: style ?? appCss.h2.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
