import 'package:aipetto/config/environment.dart';
import 'package:aipetto/modules/businessServicesTypes/models/business_services_type.dart'
    as BusinessServiceTypeModel;
import 'package:flutter/material.dart';

class ServiceTypeItem extends StatelessWidget {
  final BusinessServiceTypeModel.BusinessServiceTypeRow serviceType;
  final void Function()? onTap;

  const ServiceTypeItem(
      {required this.serviceType, required this.onTap});
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
              serviceType.serviceImage!.isNotEmpty
                  ? CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      backgroundImage: NetworkImage(
                          Environment.aipettoCloudStorageHost +
                              serviceType.serviceImage!.first.privateUrl),
                      radius: 20,
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                    ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  (serviceType.name ?? '') + '\n',
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
