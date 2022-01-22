import 'package:flutter/material.dart';

class AppBarIcon extends StatefulWidget {

  final IconData? icon;
  final VoidCallback? onPressed;

  // ignore: use_key_in_widget_constructors
  const AppBarIcon({ required this.icon, required this.onPressed});

  @override
  _AppBarIconState createState() => _AppBarIconState();
}

class _AppBarIconState extends State<AppBarIcon> with SingleTickerProviderStateMixin {

  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400)
  );

  @override
  void initState() {
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 45.0,
            minHeight: 45.0,
            minWidth: 48.0,
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3.0,
                    blurRadius: 10.0
                )
              ]
          ),
          child: Center(
              child: Icon(widget.icon, color: Colors.grey)
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}