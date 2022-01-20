import 'package:aipetto/modules/notification/models/notification.dart';
import 'package:aipetto/modules/notification/widgets/notification_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          indent: 0,
          endIndent: 0,
        ),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationListItem(
            notification: notifications[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
