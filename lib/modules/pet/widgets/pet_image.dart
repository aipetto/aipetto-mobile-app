import 'package:flutter/material.dart';

class PetImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding (
        padding: EdgeInsets.only( left: 40, right: 40, top: 50),
        child: Container(
          decoration: _buildBoxDecoration(),
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: FadeInImage(
            image: NetworkImage('https://res.cloudinary.com/aipetto/image/upload/v1630018099/dog_plrual.png'),
            placeholder: AssetImage('assets/images/aipetto/dog-photo-color.png'),
            fit: BoxFit.cover,
          ),
       ),
     ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only( topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: Offset(0,5)
      )
    ]
  );
}
