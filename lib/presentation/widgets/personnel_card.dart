import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:flutter/material.dart';

import 'package:flutter_app/common/route_constants.dart';
import 'package:flutter_app/data/models/service_personnel.dart';

import 'package:google_fonts/google_fonts.dart';

class PersonnelCard extends StatefulWidget {

  final ServicePersonnelModel model;

  const PersonnelCard({
    Key? key,
    required this.model
  }) : super(key: key);

  @override
  _PersonnelCardState createState() => _PersonnelCardState();
}

class _PersonnelCardState extends State<PersonnelCard> {

  static const animationDuration = 800;
  bool isAnimating = false;

  @override
  Widget build(BuildContext context) {

    timeDilation = 1.5;
    Size size = MediaQuery.of(context).size;

    var heroTag = widget.model.name[0] + widget.model.perHour;

    return InkWell(
      onTap: ()=> {
        setState(()=> {
          isAnimating = !isAnimating
        }),
        Future.delayed(
          const Duration(milliseconds: 1200),
          ()=>{
            Navigator.pushNamed(
              context,
              RouteLiterals.personnelProfileRoute,
              arguments: ServicePersonnelModel(
                heroTag: widget.model.heroTag,
                rating: widget.model.rating,
                perHour: widget.model.perHour,
                location: widget.model.location,
                imagePath: widget.model.imagePath,
                name: widget.model.name
              )
            )
          }
        )
      },
      child: AnimatedSize(
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: animationDuration),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: isAnimating ? 190.0 : 200.0,
              maxWidth: isAnimating ? size.width * .38: size.width * .4
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Hero(
                      tag: heroTag,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.model.imagePath,),
                            fit: BoxFit.cover,
                          )
                        )
                      )
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: isAnimating ? const EdgeInsets.all(5.0) : const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              )
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_on, color: Colors.blueGrey, size: 15.0,),
                              Text(
                                widget.model.location,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  )
                                ),
                              ),
                            ]
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${widget.model.perHour}/hour',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w700,
                                            )
                                        ),
                                      ),
                                      Row(
                                          children:  [
                                            const Icon(Icons.star, color: Colors.orange, size: 18.0,),
                                            Text(widget.model.rating)
                                          ]
                                      )
                                    ]
                                ),
                              ]
                          ),
                        )
                    ),
                  ]
              )
          ),
        )
      )
    );

  }

}