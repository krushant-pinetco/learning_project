import 'package:flutter/material.dart';
import 'package:learning_project/global/packages/config_package.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? container;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final double? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  // final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final double? padding;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final TextAlignVertical? textAlignVertical;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const CustomTextFormField({
    Key? key,
    this.container,
    this.hint,
    this.hintText,
    this.labelText,
    // this.obscureText = false,
    this.errorText,
    this.radius,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.keyboardType,
    this.padding = 10,
    this.fillColor,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.maxLength,
    this.onTap,
    this.textAlignVertical,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.focusNode,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        appScreenUtil.borderRadius(radius ?? appScreenUtil.size(12)),
      ),
      borderSide: BorderSide(
        color: appColor.inputBorder,
        width: 1,
      ),
    );

    return TextFormField(
      controller: container,
      decoration: InputDecoration(
        prefixIcon: !helper.isNull(prefixIcon)
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: appScreenUtil.size(12)),
                child: prefixIcon,
              )
            : null,
        suffix: suffixIcon,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        errorBorder: inputBorder,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        contentPadding: EdgeInsets.all(appScreenUtil.size(padding!)),
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        errorMaxLines: 2,
      ),
      style: style ?? appCss.bodyStyle1.copyWith(color: appColor.blackColor),
      validator: validator,
      // obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      maxLength: maxLength,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      textAlign: TextAlign.justify,
      textAlignVertical: textAlignVertical,
      focusNode: focusNode,
    );
  }
}
