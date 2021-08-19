import 'package:aipetto/model/pet_type/pet_type.dart' as PetType;
import 'package:flutter/material.dart';

class AddNewPetPage extends StatelessWidget {

  final String petTypeId;
  final String petTypeName;

  const AddNewPetPage({Key key, this.petTypeId, this.petTypeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final String textContent = "Quickly and easily";
    final String bgImg = 'assets/images/aipetto/cafe_pet_friendly.jpg';
    final String walkImg = 'assets/images/illustrations/pet-playing.png';

    //final args = ModalRoute.of(context).settings.arguments as PetType.PetTypeSelected;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add your pet'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        /**Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: h * 0.05),
                                height: h * 0.5,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    bgImg != null ? Image.asset(bgImg, width: width, height: h * 0.5, fit: BoxFit.fill) : Container(),
                                    CachedNetworkImage(
                                      placeholder: placeholderWidgetFn(),
                                      imageUrl: walkImg,
                                      width: width * 0.8,
                                      height: h * 0.6,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h * 0.08,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 28.0, right: 28.0),
                                child: Text(
                                  "Texto informativo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),**/
                        Theme(
                          data: ThemeData(
                            appBarTheme: AppBarTheme(
                              iconTheme: IconThemeData(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            child: Center(
                              child: Text(
                                petTypeId,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            child: Center(
                              child: Text(
                                petTypeName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //InputWidget(),
                          SizedBox(
                            height: 35,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('assets/images/grey.jpg', fit: BoxFit.cover);
