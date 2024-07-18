import 'package:flutter/material.dart';


class InputCustom extends StatelessWidget {
  /// Default Colors.redAccent
  final Color colorError;
  final Icon icono;
  final String helpText;
  final FormFieldValidator<String>? validate;
  final TextEditingController? cont;
  /// Default false
  final bool passwordField;
  /// Default 12
  final int max;
  final TextInputType keyboard;
  final int numberLines;
  final TextStyle textStyle;
  final TextStyle textStyle2;
  final String labelText;
  final bool activo;
  final Function()? onChange;

  const InputCustom({
    Key? key,
    this.colorError = Colors.redAccent,
    required this.icono,
    required this.helpText,
    this.validate,
    required this.cont,
    this.passwordField = false,
    this.max = 12,
    this.keyboard = TextInputType.text,
    this.numberLines = 1,
    this.textStyle = const TextStyle(color: Colors.blueGrey),
    this.textStyle2 = const TextStyle(color: Colors.black),
    required this.labelText,
    this.activo = true,
    this.onChange,
  }) : super(key: key);

  InputDecoration _inDec(String labelText, String helpText) => InputDecoration(
    labelStyle: textStyle,
    labelText: labelText,
    helperText: helpText,
    helperMaxLines: 2,
    errorStyle: TextStyle(color: colorError),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorError, width: 3.0),
        borderRadius: BorderRadius.circular(8.0)
    ),
    errorMaxLines: 2,
    prefixIcon: icono,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 1.0, bottom: 5.0),
        child: TextFormField(
          autocorrect: false,
          decoration: _inDec(labelText, helpText),
          obscureText: passwordField,
          maxLength: max,
          validator: validate,
          controller: cont,
          keyboardType: keyboard,
          maxLines: numberLines,
          style: textStyle,
          enabled: activo,
          onChanged:onChange!(),
        )
    );
  }
}