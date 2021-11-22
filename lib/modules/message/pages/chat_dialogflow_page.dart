import 'package:aipetto/modules/message/widgets/build_messages_widget.dart';
import 'package:aipetto/routes/routes.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BuildMessagesWidget()
    );
  }
}





