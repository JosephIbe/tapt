import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/category_item.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryItem extends StatefulWidget {

  final VoidCallback onTapped;
  final CategoryItemModel model;

  const CategoryItem({Key? key, required this.onTapped, required this.model})
      : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> with SingleTickerProviderStateMixin {

  late final animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

  @override
  void initState() {
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ScaleTransition(
      scale: animationController,
      child: InkWell(
          onTap: widget.onTapped,
          child: Container(
            constraints: BoxConstraints(
                maxHeight: size.height * 0.1,
                maxWidth: size.width * 0.3
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.blueGrey,
                //       blurRadius: 5,
                //       spreadRadius: 1,
                //       offset: Offset(0, 0)
                //   )
                // ]
            ),
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(widget.model.icon, size: 30.0,),
                const SizedBox(height: 10.0),
                Text(
                    widget.model.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        )
                    )
                )
              ],
            ),
          )
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}