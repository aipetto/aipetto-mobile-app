import 'package:aipetto/components/custom_navigation_bar.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/step1/choose_service_to_reserve_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/my_appointments_page.dart';
import 'package:aipetto/modules/home/pages/drawer/drawer_page.dart';
import 'package:aipetto/modules/home/pages/home_page.dart';
import 'package:aipetto/modules/home/widgets/app_bar_title_widget.dart';
import 'package:aipetto/modules/home/widgets/nav_bar_item_widget.dart';
import 'package:aipetto/modules/message/pages/messages_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User user;

  const Home({Key key, this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  int _selectedIndex = 0;

  static PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _selectPage(int index) {
    if (_pageController.hasClients)
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _pages = [
      HomePage(user: widget.user),
      ChooseServiceToReservePage(),
      MyAppointmentsPage(),
      MessagesPage(),
    ];
    return Stack(
      children: <Widget>[
        DrawerPage(
          onTap: () {
            setState(
              () {
                xOffset = 0;
                yOffset = 0;
                scaleFactor = 1;
                isDrawerOpen = false;
              },
            );
          },
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor)
            ..rotateY(isDrawerOpen ? -0.5 : 0),
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0.0),
            child: Scaffold(
              appBar: AppBar(
                leading: isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(
                            () {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            },
                          );
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = size.width - size.width / 3;
                            yOffset = size.height * 0.1;
                            scaleFactor = 0.8;
                            isDrawerOpen = true;
                          });
                        },
                      ),
                title: AppBarTitleWidget(),
                actions: <Widget>[
                  _selectedIndex == 2
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                          ),
                        )
                      : IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Routes.notifications),
                          icon: Icon(
                            Icons.notifications_none,
                          ),
                        ),
                ],
              ),
              body: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: _pages,
              ),
              bottomNavigationBar: CustomNavigationBar(
                backgroundColor: false ? Color(0xff121212) : Colors.white,
                strokeColor: kAmphibianColorGreenLight,
                items: [
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(0);
                    },
                    image: 'icon_home',
                    menuText: "home".tr(),
                    isSelected: _selectedIndex == 0,
                  ),
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(1);
                    },
                    image: 'pawprint',
                    menuText: "services_title".tr(),
                    isSelected: _selectedIndex == 1,
                  ),
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(2);
                    },
                    image: 'calendar',
                    menuText: "my_appointments".tr(),
                    isSelected: _selectedIndex == 2,
                  ),
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(3);
                    },
                    image: 'messages',
                    menuText: "conversation_messages".tr(),
                    isSelected: _selectedIndex == 3,
                  ),
                ],
                currentIndex: _selectedIndex,
                elevation: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
