import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/text_constants.dart';
import 'package:flutter_app/data/models/rating_chips.dart';
import 'package:flutter_app/data/models/service_personnel.dart';

import 'package:flutter_app/presentation/widgets/app_bar_icon.dart';
import 'package:flutter_app/presentation/widgets/dynamic_text.dart';
import 'package:flutter_app/presentation/widgets/personnel_card.dart';
import 'package:flutter_app/presentation/widgets/rating_chips.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailsView extends StatefulWidget {

  const CategoryDetailsView({Key? key}) : super(key: key);

  @override
  _CategoryDetailsViewState createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> with SingleTickerProviderStateMixin {

  final ratings = [
    const RatingChipsModel(title: 'High rating', icon: Icons.star),
    const RatingChipsModel(title: 'Verified', icon: Icons.verified),
    const RatingChipsModel(title: 'Up to date', icon: Icons.star),
    const RatingChipsModel(title: 'High rating', icon: Icons.verified),
    const RatingChipsModel(title: 'Verified', icon: Icons.star),
    const RatingChipsModel(title: 'Up to date', icon: Icons.verified),
  ];

  final servicesPersonnel = [
    ServicePersonnelModel(
      name: 'Helen Lee',
      imagePath: 'assets/images/helen_lee.jpg',
      location: 'Camden',
      perHour: '27',
      rating: '4.77'
    ),
    ServicePersonnelModel(
      name: 'Miranda Olsen',
      imagePath: 'assets/images/miranda_olsen.jpg',
      location: 'Comoros',
      perHour: '27',
      rating: '4.7'
    ),
    ServicePersonnelModel(
      name: 'Jennifer Lopez',
      imagePath: 'assets/images/jennifer.jpg',
      location: 'USA',
      perHour: '17',
      rating: '2.4'
    ),
    ServicePersonnelModel(
      name: 'Drizzy Drake',
      imagePath: 'assets/images/drake.jpg',
      location: 'Canada',
      perHour: '97',
      rating: '4.97'
    ),
    ServicePersonnelModel(
      name: 'Ngozi',
      imagePath: 'assets/images/ngozi.jpg',
      location: 'Camden',
      perHour: '27',
      rating: '4.7'
    ),
  ];

  static const animationDuration = 2800;
  late final animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: animationDuration));

  @override
  void initState() {
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.white70,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBarIcon(
                        icon: FontAwesomeIcons.chevronLeft,
                        onPressed: ()=> Navigator.pop(context),
                      ),
                      AppBarIcon(
                        icon: Icons.more_horiz,
                        onPressed: ()=>{},
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: animationController,
                        child: Container(
                            height: 85.0,
                            width: 85.0,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/vjolis-drawer.PNG',),
                                    fit: BoxFit.cover
                                )
                            )
                        ),
                      ),
                      const SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeTransition(
                            opacity: animationController,
                            child: const DynamicText(title: TextLiterals.categoryTitle, fontSize: 25.0, fontWeight: FontWeight.w900,),
                          ),
                          FadeTransition(
                            opacity: animationController,
                            child: const DynamicText(title: TextLiterals.serviceType, fontSize: 20.0, fontWeight: FontWeight.w500,),
                          ),
                          FadeTransition(
                            opacity: animationController,
                            child: Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  SizedBox(width: 10.0),
                                  Text(
                                    '5.0',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
                      ),
                    ]
                  ),

                  const SizedBox(height: 15.0),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.3, end: 0.0),
                    duration: const Duration(milliseconds: animationDuration),
                    child: const DynamicText(title: 'Description', fontSize: 20.0, fontWeight: FontWeight.w900,),
                    builder: (context, animationValue, child){
                      return Transform.translate(
                        offset: Offset(animationValue * 100, 0.0),
                        child: child,
                      );
                    },
                  ),

                  const SizedBox(height: 5.0),
                  FadeTransition(
                    opacity: animationController,
                    child: const DynamicText(title: TextLiterals.serviceDescriptionText, fontSize: 16.0, fontWeight: FontWeight.w400,),
                  ),

                  const SizedBox(height: 10.0),
                  Container(
                    constraints: const BoxConstraints(
                      maxHeight: 50.0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: ratings.length,
                      padding: const EdgeInsets.only(right: 10.0),
                      itemBuilder: (context, index, ) => RatingChips(
                        ratingsModel: ratings[index],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10.0),
                  FadeTransition(
                    opacity: animationController,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.3, end: 0.0),
                      duration: const Duration(milliseconds: animationDuration),
                      child: const DynamicText(title: 'Cleaners', fontSize: 20.0, fontWeight: FontWeight.w900,),
                      builder: (context, animationValue, child){
                        return Transform.translate(
                          offset: Offset(animationValue * 100, 0.0),
                          child: child,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10.0),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 200.0,
                      maxWidth: size.width
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: servicesPersonnel.length,
                      itemBuilder: (context, index) {
                        var service = servicesPersonnel[index];
                        return PersonnelCard(
                          model: ServicePersonnelModel(
                            heroTag: service.name + service.perHour,
                            name: service.name,
                            imagePath: service.imagePath,
                            location: service.location,
                            perHour: service.perHour,
                            rating: service.rating
                          ),
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  ScaleTransition(
                    scale: animationController,
                    child: Container(
                      height: 50.0,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          color: Theme.of(context).primaryColor
                      ),
                      child: Center(
                          child: Text(
                            'Contact now',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                          )
                      ),
                    )
                  )
                ],
              )
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}