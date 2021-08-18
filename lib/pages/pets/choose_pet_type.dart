import 'package:aipetto/components/pet_type_item.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:aipetto/bloc/pet_type/pet_type_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';

class ChoosePetTypePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PetTypeBloc, PetTypeState>(
      builder: (context, state) {
        if (state == null || state is PetTypeEmpty) {
          BlocProvider.of<PetTypeBloc>(context).add(FetchPetType());
        }
        if (state is PetTypeError) {
          return noValuesWidget();
        }
        if (state is PetTypeLoaded) {

          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'categories_title'.tr(),
                ),
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'pet_type_choose'.tr(),
                                style: Theme.of(context).textTheme.headline6.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            state.petType.rows.length < 0 ? noValuesWidget() : StaggeredGridView.countBuilder(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              crossAxisCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.petType.rows.length,
                              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              itemBuilder: (context, index) {
                                return PetTypeItem(
                                  petType: state.petType.rows[index],
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        Routes.addNewPet
                                    );
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                  )
                ],
              )
          );

        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Center noValuesWidget() {
    return Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
            Image.asset('assets/images/pet_sick_icon.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Error',
                style: TextStyle(
                  color: kColorDarkBlue,
                  fontSize: 20,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        );
    }
}