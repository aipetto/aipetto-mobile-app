import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import 'message_item.dart';


class BuildMessagesWidget extends StatefulWidget {
  const BuildMessagesWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _BuildMessagesWidget();
}

class _BuildMessagesWidget extends State<BuildMessagesWidget> {

  final List<MessageItem> _messages = <MessageItem>[];
  final TextEditingController _textEditingController = TextEditingController();
  final languageSymbolFromUserPreferences = Prefs.getString(Prefs.LANGUAGE);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    'chat_bot_ai_introduction_message'.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
        )),
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
                  child: TextField(
                    controller: _textEditingController,
                    onSubmitted: _handleSubmitted,
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
                      hintText: 'chat_send_message'.tr(),
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
                  icon: Icon(
                    Icons.send,
                    size: 25,
                  ),
                  onPressed: () => _textEditingController.value.text.isNotEmpty ? _handleSubmitted(_textEditingController.text) : null
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void Response(query) async {
    _textEditingController.clear();
    AuthGoogle authGoogle =
          await AuthGoogle(fileJson: "assets/credentials.json")
              .build();

    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: languageSymbolFromUserPreferences);
    AIResponse response = await dialogflow.detectIntent(query);
    MessageItem message = new MessageItem(
      message: response.getMessage() ?? new CardDialogflow(response.getListMessage()[0]).title,
      send: false,
    );
    setState((){
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text){

    if (text.isNotEmpty){
      _textEditingController.clear();
      MessageItem message = new MessageItem(message: text, send: true);
      setState(() {
        _messages.insert(0, message);
      });
      Response(text);
    }
  }
}
