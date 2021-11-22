import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final bool send;
  final String message;

  const MessageItem({Key key, @required this.send, @required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: send ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: !send,
          child: CircleAvatar(
            radius: 48,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/images/owl-300.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(
              left: !send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
              right: send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(send ? 20 : 0),
                bottomRight: Radius.circular(send ? 0 : 20),
              ),
              color: send ? Color(0xffeaf2fe) : kAmphibianColorGreenLight,
            ),
            child: SelectableText(
              message,
              style: TextStyle(
                color: send ? kColorDarkBlue : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}