import 'package:flutter/material.dart';
import 'package:aipetto/modules/petType/bloc/pet_type_bloc.dart';
import 'package:aipetto/modules/petType/models/pet_type.dart' as PetType;
import 'package:aipetto/modules/petType/widgets/pet_type_item.dart';
import 'package:aipetto/modules/shared/widgets/no_data_available_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PetTypeList extends StatefulWidget {
  @override
  _PetTypeListState createState() => _PetTypeListState();
}

class _PetTypeListState extends State<PetTypeList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetTypeBloc, PetTypeState>(
      builder: (context, state) {
        if (state == null || state is PetTypeEmpty) {
          BlocProvider.of<PetTypeBloc>(context).add(FetchPetType());
        }
        if (state is PetTypeError) {
          return NoDataAvailableWidget();
        }
        if (state is PetTypeLoaded) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('pet_type_choose'.tr(),
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 16)),
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        state.petType.rows.length < 0
                            ? NoDataAvailableWidget()
                            : StaggeredGridView.countBuilder(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                crossAxisCount: 4,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.petType.rows.length,
                                staggeredTileBuilder: (int index) =>
                                    StaggeredTile.fit(2),
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                itemBuilder: (context, index) {
                                  return PetTypeItem(
                                    petType: state.petType.rows[index],
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          Routes.addNewPet,
                                          arguments: PetType.PetTypeSelected(
                                              state.petType.rows[index].id,
                                              state.petType.rows[index].name));
                                    },
                                  );
                                },
                              ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ))
                ],
              ));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
