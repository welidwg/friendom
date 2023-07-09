import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  ActionButton(
      {super.key,
        this.onPressed,
        required this.label,
        required this.color,
        this.textColor,
        this.icon});

  late VoidCallback? onPressed;
  late String label;
  late Color color;
  late IconData? icon;
  late Color? textColor = Colors.white;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      elevation: 5.0,
      textStyle: TextStyle(color: Colors.white),
      child: MaterialButton(
          padding: const EdgeInsets.all(0),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style:
                TextStyle(color: widget.textColor,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "Exo")
              ),
              SizedBox(
                width: 6,
              ),
              widget.icon != null
                  ? Icon(
                widget.icon,
                color: widget.textColor,
              )
                  : Container()
            ],
          )),
    );
  }
}
