import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final IconData? icon;
  final String? label;
  final int? linha;
  final bool? isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool? enabled;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final GlobalKey<FormFieldState>? formFieldKey;
  const CustomFormField(
      {Key? key,
      this.icon,
      this.label,
      this.isSecret,
      this.inputFormatters,
      this.initialValue,
      this.readOnly,
      this.validator,
      this.onSaved,
      this.controller,
      this.keyboardType,
      this.formFieldKey,
      this.linha,
      this.enabled})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          enabled: widget.enabled,
          key: widget.formFieldKey,
          onSaved: widget.onSaved,
          keyboardType: widget.keyboardType,
          initialValue: widget.initialValue,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          controller: widget.controller,
          maxLines: widget.linha,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            labelText: widget.label,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
        ));
  }
}
