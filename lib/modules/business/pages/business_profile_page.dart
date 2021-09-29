import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/modules/business/models/businessGeneralModel.dart';
import 'package:aipetto/modules/business/widgets/AppWidget.dart';
import 'package:aipetto/modules/business/widgets/BHColors.dart';
import 'package:aipetto/modules/business/widgets/BHConstants.dart';
import 'package:aipetto/modules/business/widgets/BHDataProvider.dart';
import 'package:aipetto/modules/business/widgets/BHImages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:nb_utils/nb_utils.dart';

class BusinessProfilePage extends StatefulWidget {
  static String tag = '/NewSliverCustom';

  @override
  BusinessProfilePageState createState() => BusinessProfilePageState();
}

class BusinessProfilePageState extends State<BusinessProfilePage>
    with SingleTickerProviderStateMixin {
  int _radioValue1 = 0;
  TabController controller;

  List<BHCategoryModel> categoryList;
  List<BHOfferModel> offerList;
  List<BHServicesModel> servicesList;

  @override
  void initState() {
    super.initState();
    servicesList = getServicesList();
    categoryList = getCategory();
    offerList = getOfferList();
  }

  void serviceSelectedToReserve(int value) {
    setState(() {
      _radioValue1 = value;
      print(_radioValue1);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    Widget aboutWidget() {
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
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BHTxtInformation,
                      style: TextStyle(
                          color: BHAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Text(BHDetailTitle,
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BHTxtContact,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.call, size: 16),
                        8.width,
                        Text('+1(55)1111 1111',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.web, size: 16),
                        8.width,
                        Text('www.aipetto.com',
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
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BHTxtOpeningTime,
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
                        Text('Monday - Friday',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        Column(
                          children: [
                            Text('7:30 - 11:30 AM',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                            8.height,
                            Text('7:30 - 11:30 AM',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16))
                          ],
                        )
                      ],
                    ),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sunday',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        Text('7:30 - 11:30 AM',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
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
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      BHTxtAddress,
                      style: TextStyle(
                          color: BHAppTextColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.width,
                    Text('301 Dorthy walks,chicago,Us.',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget serviceWidget() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Image.asset(categoryList[index].img,
                            height: 40, width: 40),
                        8.height,
                        Text(
                          categoryList[index].categoryName,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Text(
                BHTxtPopularServices,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 14),
              ),
            ),
            ListView.builder(
              itemCount: servicesList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: BHGreyColor.withOpacity(0.3),
                    boxShadow: [
                      BoxShadow(
                          color: BHGreyColor.withOpacity(0.3),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0)
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
                              servicesList[index].serviceName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(
                                servicesList[index].time,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              8.width,
                              Text(
                                '\$${servicesList[index].price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kAmphibianColorGreenLight),
                              ),
                            ],
                          ),
                        ],
                      ).expand(),
                      Radio(
                        value: servicesList[index].radioVal,
                        groupValue: _radioValue1,
                        activeColor: kAmphibianColorGreenLight,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => kAmphibianColorGreenLight),
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
                    Navigator.of(context)
                        .pushNamed(Routes.bookingStep3ServiceAvailability);

                    /// TODO get the pet profile passing the pet.id
                  },
                  text: 'reserve'.tr(),
                )),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              Container(
                child: SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: kAmphibianColorGreenLight),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                  backgroundColor: kAmphibianColorGreenLight,
                  pinned: true,
                  elevation: 2,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    titlePadding: EdgeInsets.all(10),
                    background: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Image.asset(
                          BHDashedBoardImage6,
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Vet',
                                      style: TextStyle(
                                          color: whiteColor, fontSize: 16),
                                      textAlign: TextAlign.left),
                                  Container(
                                    height: 25,
                                    width: 75,
                                    margin: EdgeInsets.only(right: 16),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(BHBtnOpen,
                                          style: TextStyle(
                                              color: whiteColor, fontSize: 14)),
                                      color: kAmphibianColorGreenLight,
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
                    indicatorColor: kAmphibianColorGreenLight,
                    tabs: [
                      Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(BHTabServices,
                                style: TextStyle(fontSize: 18))),
                      ),
                      Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(BHTabAbout,
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
              serviceWidget(),
              aboutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
