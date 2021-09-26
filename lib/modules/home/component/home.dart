import 'package:aipetto/components/custom_navigation_bar.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/my_appointments_page.dart';
import 'package:aipetto/modules/home/pages/drawer/drawer_page.dart';
import 'package:aipetto/modules/home/pages/home_page.dart';
import 'package:aipetto/modules/home/widgets/app_bar_title_widget.dart';
import 'package:aipetto/modules/home/widgets/nav_bar_item_widget.dart';
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
    if (_pageController.hasClients) _pageController.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _pages = [
      HomePage(user: widget.user),
      Container(),
      MyAppointmentsPage(),
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
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
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
              floatingActionButton: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x202e83f8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.of(context).pushNamed(Routes.categories);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:kAmphibianColorGreenLight,
                      ),
                      child: Icon(
                        Icons.pets,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomNavigationBar(
                backgroundColor:
                    true ? Color(0xff121212) : Colors.white,
                strokeColor: kAmphibianColorGreenLight,
                items: [
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(0);
                    },
                    image: 'icon_home',
                    isSelected: _selectedIndex == 0,
                  ),
                  NavBarItemWidget(
                    onTap: () {},
                    image: '',
                    isSelected: false,
                  ),
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(2);
                    },
                    image: 'calendar',
                    isSelected: _selectedIndex == 2,
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
