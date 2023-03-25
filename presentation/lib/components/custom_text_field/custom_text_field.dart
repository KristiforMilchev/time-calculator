import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:presentation/components/custom_text_field/time_text_input_formatter.dart';

//ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  //General Color Properties
  double height;
  double borderRadius;

  double radialRadius;
  Color cursorColor;
  Color textColor;

  //Text Specific properties
  String textFontFamily;
  double fontSize;
  FontWeight fontWeight;
  TextAlign textAlign;
  double letterSpacing;

  //Label Specific properties
  String floatingLabel;
  Color labelColor;
  FloatingLabelAlignment labelAlignment;

  //Border Specific properties
  Color borderRegularColor;
  Color borderFocusedColor;
  Function onChanged;

  CustomTextField({
    super.key,
    this.height = 56,
    this.borderRadius = 10,
    this.radialRadius = 25,
    this.cursorColor = const Color.fromRGBO(255, 255, 255, 0.2),
    this.textColor = ThemeStyles.fontPrimary,
    this.textFontFamily = "Loto",
    this.fontSize = 18,
    this.letterSpacing = 1.26,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.center,
    required this.floatingLabel,
    this.labelColor = const Color.fromRGBO(255, 255, 255, 0.72),
    this.labelAlignment = FloatingLabelAlignment.center,
    this.borderRegularColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.borderFocusedColor = const Color.fromRGBO(255, 215, 214, 0.1),
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ThemeStyles.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: TextField(
        onChanged: (value) => onChanged.call(value),
        inputFormatters: [
          MaskedInputFormatter(
            '##:##',
            allowedCharMatcher: RegExp(r'^[0-9:]+$'),
          )
        ],
        textAlign: TextAlign.center,
        cursorColor: cursorColor,
        cursorWidth: 1,
        style: TextStyle(
          color: textColor,
          fontFamily: textFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          label: Text(
            floatingLabel,
            textAlign: textAlign,
            style: ThemeStyles.regularHeading,
          ),
          floatingLabelStyle: TextStyle(
            color: labelColor,
          ),
          floatingLabelAlignment: labelAlignment,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(
              color: borderRegularColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(
              color: borderRegularColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(
              color: borderFocusedColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
