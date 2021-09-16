import 'package:flutter/material.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/notification/models/notification.dart' as notif;

class NotificationListItem extends StatelessWidget {
  final notif.Notification notification;
  final Function onTap;

  const NotificationListItem({
    Key key,
    @required this.notification,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = true;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        child: Row(
          children: <Widget>[
            Image.asset(notification.icon),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    notification.title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    notification.body + '\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              notification.date,
              style: TextStyle(
                color: isDark
                    ? Colors.white.withOpacity(0.5)
                    : Colors.grey.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
