// ignore: duplicate_ignore
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:flutter_app/common/text_constants.dart';

import 'package:flutter_app/data/models/rating_chips.dart';
import 'package:flutter_app/data/models/service_personnel.dart';

import 'package:flutter_app/presentation/widgets/app_bar_icon.dart';
import 'package:flutter_app/presentation/widgets/dynamic_text.dart';
import 'package:flutter_app/presentation/widgets/rating_chips.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonnelProfileView extends StatefulWidget {

  final ServicePersonnelModel serviceModel;
  const PersonnelProfileView({
    required this.serviceModel
  });

  @override
  _PersonnelProfileViewState createState() => _PersonnelProfileViewState();
}

class _PersonnelProfileViewState extends State<PersonnelProfileView> with SingleTickerProviderStateMixin {

  final skills = [
    const RatingChipsModel(title: 'Cleaning', icon: FontAwesomeIcons.cookie),
    const RatingChipsModel(title: 'Laundry', icon: Icons.cleaning_services),
    const RatingChipsModel(title: 'Cooking', icon: Icons.verified),
    const RatingChipsModel(title: 'Dancing', icon: FontAwesomeIcons.walking),
  ];

  static const animationDuration = 800;
  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: animationDuration)
  );

  late Animation<Offset> slideUpAnimation;

  @override
  void initState() {
    animationController.forward();
    slideUpAnimation = Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    var heroTag = widget.serviceModel.name[0] + widget.serviceModel.perHour;
    print('heroTag in view is:\t$heroTag');

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.35,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Stack(
                        children: [
                          Hero(
                            tag: heroTag,
                            child: Image(
                              height: size.height * .35,
                              width: size.width,
                              image: AssetImage(widget.serviceModel.imagePath,),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            child: Padding(
                            padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppBarIcon(
                                      icon: FontAwesomeIcons.chevronLeft,
                                      onPressed: ()=> Navigator.pop(context),
                                    ),
                                    AppBarIcon(
                                      icon: Icons.favorite_outlined,
                                      onPressed: ()=>{},
                                    ),
                                  ],
                                ),
                              )
                            ),
                        ]
                      )
                    ),
                    const SizedBox(height: 10.0),
                    SlideTransition(
                      position: slideUpAnimation,
                      child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SlideTransition(
                                  position: slideUpAnimation,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Miranda Olsen',
                                            style: GoogleFonts.getFont('Poppins').copyWith(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey,
                                            )
                                        ),
                                        Row(
                                            children: [
                                              const Icon(Icons.star, color: Colors.orange),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                  '4.7',
                                                  style: GoogleFonts.getFont('Poppins').copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.blueGrey,
                                                  )
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                  '(17)',
                                                  style: GoogleFonts.getFont('Poppins').copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.blueGrey,
                                                  )
                                              ),
                                            ]
                                        )
                                      ]
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                // ignore: sized_box_for_whitespace
                                Container(
                                  constraints: const BoxConstraints(
                                    maxHeight: 50.0,
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: skills.length,
                                    itemBuilder: (context, index) => RatingChips(
                                        ratingsModel: skills[index]
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                const DynamicText(title: 'About', fontSize: 25.0, fontWeight: FontWeight.w900,),
                                const DynamicText(title: TextLiterals.personnelAboutText, fontSize: 18.0, fontWeight: FontWeight.w400,),
                                const SizedBox(height: 15.0),
                                const DynamicText(title: 'Work area', fontSize: 25.0, fontWeight: FontWeight.w900,),
                                const SizedBox(height: 10.0),
                                Container(
                                    height: size.height * 0.3,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                    )
                                ),
                                const SizedBox(height: 100.0),
                              ]
                          )
                      )
                    )
                  ]
                )
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0,),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              text: '\$20',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700
                              ),
                              children: [
                                TextSpan(
                                  text: '/hour',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                              ]
                            ),
                          )
                        ]
                      ),
                      Container(
                        height: 60.0,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            color: Theme.of(context).primaryColor
                        ),
                        child: Center(
                            child: Text(
                              'Hire now',
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
                    ]
                  )
                )
              )
            ]
          )
        )
      )
    );
  }

}