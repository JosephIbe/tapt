import 'package:flutter/material.dart';

import 'package:flutter_app/data/models/rating_chips.dart';

import 'package:google_fonts/google_fonts.dart';

class RatingChips extends StatefulWidget {

  final RatingChipsModel ratingsModel;
  // final String title;
  // final IconData icon;

  const RatingChips({
    Key? key,
    required this.ratingsModel,
    // required this.title,
    // required this.icon,
  }) : super(key: key);

  @override
  _RatingChipsState createState() => _RatingChipsState();
}

class _RatingChipsState extends State<RatingChips> {

  // @override
  // Widget build(BuildContext context) {
  //   return TweenAnimationBuilder<double>(
  //     tween: Tween(begin: 1.0, end: 0.0),
  //     duration: const Duration(milliseconds: 800),
  //     child: Card(
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //         ),
  //         child: Container(
  //           padding: const EdgeInsets.all(10.0),
  //           constraints: const BoxConstraints(
  //             maxHeight: 35.0,
  //             minWidth: 80.0,
  //           ),
  //           decoration: const BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //               color: Colors.white,
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: Colors.blueGrey,
  //                     blurRadius: 3,
  //                     spreadRadius: 2,
  //                     offset: Offset(2, 2)
  //                 )
  //               ]
  //           ),
  //           child: Row(
  //             children: [
  //               Icon(widget.ratingsModel.icon),
  //               const SizedBox(width: 5.0),
  //               Text(
  //                   widget.ratingsModel.title,
  //                   style: GoogleFonts.poppins(
  //                     textStyle: const TextStyle(
  //                         color: Colors.blueGrey,
  //                         fontSize: 16.0
  //                     ),
  //                   )
  //               )
  //             ],
  //           ),
  //         )
  //     ),
  //     builder: (context, animationValue, child) {
  //       return Transform.translate(
  //         offset: Offset(animationValue * 100, 0.0),
  //         child: child,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints(
            maxHeight: 35.0,
            minWidth: 80.0,
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(2, 2))
              ]),
          child: Row(
            children: [
              Icon(widget.ratingsModel.icon),
              const SizedBox(width: 5.0),
              Text(widget.ratingsModel.title,
                  style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                  ))
            ],
          ),
        ));
  }

}
