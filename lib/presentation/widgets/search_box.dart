import 'package:flutter/material.dart';
import 'package:flutter_app/common/text_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatelessWidget {

  final searchController = TextEditingController();

  SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.075,
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)
        ),
      ),
      child: TextFormField(
        controller: searchController,
        autofocus: false,
        decoration: const InputDecoration(
          hintText: TextLiterals.searchHintText,
          hintStyle: TextStyle(
            color: Colors.blueGrey,
            fontSize: 22.0,
            fontWeight: FontWeight.w400
          ),
          contentPadding: EdgeInsets.fromLTRB(-5, -7, 0, 0),
          prefixIcon: FaIcon(FontAwesomeIcons.search),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }

}