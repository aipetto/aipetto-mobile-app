import 'package:aipetto/modules/message/widgets/build_messages_widget.dart';
import 'package:aipetto/modules/message/widgets/message_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class MessagesDetailPage extends StatefulWidget {
  @override
  _MessagesDetailPageState createState() => _MessagesDetailPageState();
}

class _MessagesDetailPageState extends State<MessagesDetailPage> {

  final List<MessageItem> _messages = <MessageItem>[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sofia_the_owl'.tr(),
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
      ),
      body: BuildMessagesWidget()
    );
  }
}


