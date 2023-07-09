import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendom/constants/colors.dart';

class Input extends StatefulWidget {
  late String label;
  late bool is_Password;
  late bool? isTextArea = false;
  late bool? isNumber = false;
  final Function(String value) onChange;
  final String? Function(String? value)? validator;

  Input(
      {super.key,
      required this.label,
      required this.is_Password,
      required this.onChange,
      this.isTextArea,
      this.isNumber,
      this.validator});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: widget.validator ?? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        cursorColor: CupertinoColors.white,
        maxLines: widget.isTextArea != null ? null : 1,
        controller: _controller,
        obscureText: widget.is_Password,
        style: TextStyle(color: CupertinoColors.white, fontFamily: "Exo"),
        onChanged: (value) {
          widget.onChange(value);
        },
        keyboardType: widget.isTextArea != null
            ? TextInputType.multiline
            : widget.isNumber == true
                ? TextInputType.number
                : TextInputType.emailAddress,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: const TextStyle(color: CupertinoColors.white),
          hintStyle: const TextStyle(color: CupertinoColors.inactiveGray),
          contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kThirdColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kThirdColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
