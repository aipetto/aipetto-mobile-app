import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage>
    with AutomaticKeepAliveClientMixin<MessagesPage> {


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MessageListItem(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.chatDetail);
            },
            imagePath: 'assets/images/owl-300.jpg',
            name: 'Sofia',
            message: 'chat_bot_ai_introduction_message'.tr(),
            date: DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
            unread: 1,
            online: true,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MessageListItem extends StatelessWidget {
  final Function onTap;
  final String imagePath;
  final String name;
  final String message;
  final String date;
  final int unread;
  final bool online;

  const MessageListItem(
      {Key key,
      @required this.onTap,
      @required this.imagePath,
      @required this.name,
      @required this.message,
      @required this.date,
      this.unread,
      this.online})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Visibility(
                    visible: online,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(1),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  date,
                  style: TextStyle(
                    color: kColorPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Visibility(
                  visible: (unread != 0 && unread != null) ? true : false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kColorPrimary,
                    ),
                    child: Text(
                      unread.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
