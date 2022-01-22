import 'package:flutter/material.dart';

import 'package:flutter_app/common/route_constants.dart';
import 'package:flutter_app/common/text_constants.dart';

import 'package:flutter_app/data/models/category_item.dart';

import 'package:flutter_app/presentation/widgets/app_bar_icon.dart';
import 'package:flutter_app/presentation/widgets/category_item.dart';
import 'package:flutter_app/presentation/widgets/dynamic_text.dart';
import 'package:flutter_app/presentation/widgets/first_order_coupon.dart';
import 'package:flutter_app/presentation/widgets/search_box.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {

  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {

  final categories = [
    const CategoryItemModel(
      title: TextLiterals.cleaning,
      icon: Icons.cleaning_services,
    ),
    const CategoryItemModel(
      title: TextLiterals.repair,
      icon: Icons.home_repair_service_outlined,
    ),
    const CategoryItemModel(
      title: TextLiterals.delivery,
      icon: FontAwesomeIcons.shuttleVan,
    ),
    const CategoryItemModel(
      title: TextLiterals.dogWalking,
      icon: FontAwesomeIcons.dog,
    ),
    const CategoryItemModel(
      title: TextLiterals.labour,
      icon: Icons.settings,
    ),
    const CategoryItemModel(
      title: TextLiterals.nurse,
      icon: FontAwesomeIcons.userNurse,
    ),
  ];

  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800)
  );

  late Animation animation;
  static const animationDuration = 800;

  @override
  void initState() {
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
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
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: SingleChildScrollView(
                child: Column(
                  // ignore: prefer_const_constructors
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: animationController,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.8, end: 0.0),
                        duration: const Duration(milliseconds: animationDuration),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextLiterals.goodMorningText,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w800
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5.0, 5.0, 0),
                              child: AppBarIcon(
                                icon: FontAwesomeIcons.bell,
                                onPressed: ()=>{},
                              ),
                            )
                          ],
                        ),
                        builder: (context, value, child){
                          return Transform.translate(
                              offset: Offset(value * 100, 0.0),
                              child: child
                          );
                        },
                      ),
                    ),
                    /**
                     *  Location Button
                     * */
                    FadeTransition(
                      opacity: animationController,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: const Duration(milliseconds: animationDuration),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(Icons.location_on, color: Colors.grey),
                            Text(
                                TextLiterals.cityName,
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                          ],
                        ),
                        builder: (context, animationValue, child){
                          return Transform.translate(
                            offset: Offset(animationValue * 100, 0.0),
                            child: child
                          );
                        },
                      )
                    ),

                    /**
                     *  Miscellaneous Widgets
                     * */
                    const SizedBox(height: 10.0,),
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0, end: 0.0),
                      duration: const Duration(milliseconds: animationDuration),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FirstOrderCoupon(),
                          const SizedBox(height: 10.0,),
                          SearchBox(),
                          const SizedBox(height: 10.0,),
                          const DynamicText(title: 'Categories', fontSize: 22.0),
                        ]
                      ),
                      builder: (context, value, child){
                        return Transform.translate(
                          offset: Offset(value * 100.0, 0.0),
                          child: child,
                        );
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    /**
                     *  Categories
                     * */
                    const SizedBox(height: 10.0,),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0
                      ),
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => CategoryItem(
                        onTapped: ()=> Navigator.pushNamed(context, RouteLiterals.categoryDetailsRoute),
                        model: categories[index],
                      ),
                    )
                  ],
                )
            )
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