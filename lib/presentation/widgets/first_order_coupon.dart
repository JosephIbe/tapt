import 'package:flutter/material.dart';
import 'package:flutter_app/common/text_constants.dart';

import 'package:google_fonts/google_fonts.dart';

class FirstOrderCoupon extends StatefulWidget {

  const FirstOrderCoupon({Key? key}) : super(key: key);

  @override
  _FirstOrderCouponState createState() => _FirstOrderCouponState();
}

class _FirstOrderCouponState extends State<FirstOrderCoupon> with SingleTickerProviderStateMixin {

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

    return Container(
      width: size.width,
      height: size.height * 0.21,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(15.0))
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '20% OFF',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 1.5,
                              )
                          )
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                          'for the first order',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              )
                          )
                      ),
                      const SizedBox(height: 5.0),
                      ElevatedButton(
                        onPressed: ()=> {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))))
                        ),
                        child: Text(
                            TextLiterals.hireNow,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w700
                                )
                            )
                        ),
                      )
                    ]
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: SlideTransition(
                  position: slideUpAnimation,
                  child: Image.asset('assets/images/drake.jpg',),
                )
            )
          ]
      ),
    );
  }

}