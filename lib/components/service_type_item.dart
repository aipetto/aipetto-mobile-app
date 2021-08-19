import 'package:aipetto/model/business_service_type/type_services.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ServiceTypeItem extends StatelessWidget {
  final TypeServices serviceType;
  final Function onTap;

  const ServiceTypeItem(
      {Key key, @required this.serviceType, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: AssetImage(serviceType.imagePath),
                radius: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  serviceType.name.tr() + '\n',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
