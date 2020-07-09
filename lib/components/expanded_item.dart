import 'package:flutter/material.dart';

class ExpandedItem extends StatelessWidget {
  ExpandedItem(
      {@required this.text,
      @required this.buttonColor,
      @required this.onPress});
  final String text;
  final Color buttonColor;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    bottomRight: Radius.circular(48)),
              ),
              onPressed: onPress,
              color: buttonColor,
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
