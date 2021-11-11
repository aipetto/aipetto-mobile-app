import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/config/environment.dart';
import 'package:aipetto/modules/business/widgets/AppWidget.dart';
import 'package:aipetto/modules/business/widgets/BHColors.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessServicePrice/bloc/business_services_prices_bloc.dart';
import 'package:aipetto/modules/businessServicePrice/models/business_service_prices.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/cart/booking_cart_bloc.dart';
import 'package:aipetto/modules/shared/widgets/no_data_available_widget.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class BusinessProfilePage extends StatefulWidget {
  static String tag = '/NewSliverCustom';
  final BusinessPlace businessPlace;

  const BusinessProfilePage({Key key, this.businessPlace}) : super(key: key);

  @override
  BusinessProfilePageState createState() => BusinessProfilePageState();
}

class BusinessProfilePageState extends State<BusinessProfilePage>
    with SingleTickerProviderStateMixin {
  String _radioValue = '';
  TabController controller;

  void serviceSelectedToReserve(String serviceId) {
    setState(() {
      _radioValue = serviceId;
      print(_radioValue);
    });
  }

  int selectedRadio;

  @override
  void initState() {
    super.initState();
    _radioValue = '';
  }

  @override
  Widget build(BuildContext context) {

    final direction = widget.businessPlace.address ?? '';
    final addressNumber = widget.businessPlace.addressNumber ?? '';
    final state = widget.businessPlace.addressState ?? '';
    final addressCity = widget.businessPlace.addressCity ?? '';
    final addressCountry = widget.businessPlace.addressCountry.name ?? '';
    final zipCode = widget.businessPlace.addressZipCode ?? '';
    final address = direction + ' ' + addressNumber;
    final addressState = state + ' ' + addressCity + ' ' + addressCountry;
    final addressZipCode = zipCode;

    changeStatusColor(Colors.transparent);
    Widget aboutWidget(BusinessServicePrice businessOwnerOfServices) {
      return Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.1),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'general'.tr(),
                      style: TextStyle(
                          color: BHAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Text(businessOwnerOfServices.businessId.notes ?? '',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.1),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.height,
                    Text(
                      'contact'.tr(),
                      style: TextStyle(
                          color: BHAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        Icon(Icons.call, size: 16),
                        8.width,
                        Text(businessOwnerOfServices.businessId.contactPhone ?? '',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.call, size: 16),
                        8.width,
                        Text('Whatsapp:' + businessOwnerOfServices.businessId.contactPhone ?? '',
                            style:
                            TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.web, size: 16),
                        8.width,
                        Text(businessOwnerOfServices.businessId.website ?? '',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.1),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'opening_time'.tr(),
                      style: TextStyle(
                          color: BHAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(widget.businessPlace.openTime ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                            8.height,
                            Text(widget.businessPlace.closeTime ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.1),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        address,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 3,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.1),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        addressState,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 3,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    8.width,
                    Expanded(
                      child: Text(
                        addressZipCode,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 3,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget serviceWidget(List<BusinessServicePrice> servicesPricesList) {

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                child: CustomButton(
                  onPressed: () {
                    if(_radioValue != ''){
                      BlocProvider.of<BookingCartBloc>(context).add(AddBookingService(_radioValue));
                      Navigator.of(context).pushNamed(Routes.checkAuthentication);
                    }
                  },
                  text: 'reserve'.tr(),
                )),
            ListView.builder(
              itemCount: servicesPricesList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                          color: BHGreyColor.withOpacity(0.1),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0)
                    ],
                  ),
                  child: Row(
                    children: [
                      /**ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        child:commonCacheImageWidget(servicesList[index].img, 80, width: 80, fit: BoxFit.cover),
                      ),**/
                      8.width,
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              servicesPricesList[index].service.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(
                                '${servicesPricesList[index].servicePrice}' + ' ' + servicesPricesList[index].currency.symbol,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kAmphibianColorBlueDarkAlternative),
                              ),
                            ],
                          ),
                        ],
                      ).expand(),
                      Radio(
                        value: servicesPricesList[index].id,
                        groupValue: _radioValue,
                        activeColor: kAmphibianColorBlueDarkAlternative,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => kAmphibianColorBlueDarkAlternative),
                        onChanged: (value) => serviceSelectedToReserve(value),
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                child: CustomButton(
                  onPressed: () {
                    if(_radioValue != ''){
                      BlocProvider.of<BookingCartBloc>(context).add(AddBookingService(_radioValue));
                      Navigator.of(context).pushNamed(Routes.checkAuthentication);
                    }
                  },
                  text: 'reserve'.tr(),
                )),
          ],
        ),
      );
    }

    return BlocBuilder<BusinessServicesPricesBloc, BusinessServicesPricesState>(
      builder: (context, state) {
          if (state == null || state is BusinessServicesPricesEmpty) {
            BlocProvider.of<BusinessServicesPricesBloc>(context).add(FetchBusinessServicesPrices(businessTenant: widget.businessPlace.tenant));
          }
          if (state is BusinessServicesPricesError) {
            return NoDataAvailableWidget();
          }
          if (state is BusinessServicesPricesLoaded) {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.bookingStep1FindPlacesNearby);
                        },
                        tooltip: MaterialLocalizations
                            .of(context)
                            .openAppDrawerTooltip,
                      );
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.home),
                      icon: Icon(
                        Icons.home,
                      ),
                    )
                  ],
                ),
                body: NestedScrollView(
                  headerSliverBuilder: (BuildContext context,
                      bool innerBoxIsScrolled) {
                    return <Widget>[
                      Container(
                        child: SliverAppBar(
                          backgroundColor: kAmphibianColorBlueDarkAlternative,
                          pinned: false,
                          elevation: 2,
                          automaticallyImplyLeading: false,
                          expandedHeight: 300,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            titlePadding: EdgeInsets.all(10),
                            background: Stack(
                              overflow: Overflow.visible,
                              children: [
                                widget.businessPlace.photoLogo
                                    .first['privateUrl']
                                    .startsWith('assets') ?
                                Image.asset(
                                  widget.businessPlace.photoLogo
                                      .first['privateUrl'],
                                  height: 500,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  fit: BoxFit.cover,
                                ) :
                                Image.network(
                                  Environment.aipettoCloudStorageHost +
                                      widget.businessPlace.photoLogo
                                          .first['privateUrl'],
                                  height: 500,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Vet',
                                              style: TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 16),
                                              textAlign: TextAlign.left),
                                          Container(
                                            height: 25,
                                            width: 75,
                                            margin: EdgeInsets.only(right: 16),
                                            child: FlatButton(
                                              onPressed: () {},
                                              child: Text(widget.businessPlace.isOpen
                                                  ? 'business_open'.tr()
                                                  : 'business_closed'.tr(),
                                                  style: TextStyle(
                                                      color: whiteColor,
                                                      fontSize: 14)),
                                              color: kAmphibianColorBlueDarkAlternative,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            centerTitle: true,
                          ),
                          bottom: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            isScrollable: true,
                            indicatorColor: kAmphibianColorBlueDarkAlternative,
                            tabs: [
                              Tab(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('services_title'.tr(),
                                        style: TextStyle(fontSize: 18))),
                              ),
                              Tab(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Info',
                                        style: TextStyle(fontSize: 18))),
                              ),
                            ],
                            controller: controller,
                          ),
                          actions: [],
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      serviceWidget(state.businessServicePrice),
                      aboutWidget(state.businessServicePrice.first),
                    ],
                  ),
                ),
              ),
            );
          }
         return Center(
           child: CircularProgressIndicator(),
         );
       },
     );
  }
}
