import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/components/text_form_field.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChatDialogFlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.home),
            icon: Icon(
              Icons.close,
            ),
          )
        ],
      ),
      body: WidgetAIChat(),
    );
  }
}

class WidgetAIChat extends StatefulWidget {
  @override
  _WidgetAIChatState createState() => _WidgetAIChatState();
}

class _WidgetAIChatState extends State<WidgetAIChat> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  MessageItem(
                    send: false,
                    message:
                    'I`m happy you curious about pets, what would like to know?',
                  )
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[200], width: 0.5),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                        BorderSide(color: Colors.transparent, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                        BorderSide(color: Colors.transparent, width: 0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[250],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      hintText: 'Escriba tu mensaje',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    autofocus: false,
                    style: TextStyle(
                      color: kColorDarkBlue,
                    ),
                    cursorWidth: 1,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

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
            radius: 45,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/images/owl-300.jpg',
              height: 85, width: 85,
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
                color: send ? kColorDarkBlue : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Visibility(
          visible: send,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/images/icon_man.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
