import 'package:flutter/material.dart';

class SearchHeaderBar extends StatelessWidget {
  final Widget leading; // Accepts either an Icon or an Image
  final String text;

  const SearchHeaderBar({super.key, required this.leading, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          // ignore: deprecated_member_use
          colors: [Colors.white, Colors.white.withOpacity(0.5)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.73, color: Colors.white),
          borderRadius: BorderRadius.circular(6.72),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7.31,
            offset: Offset(0, 7.31),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 2.93,
            offset: Offset(0, 2.93),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 0,
            offset: Offset(0, 0.73),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Customizable leading widget (Icon or Image)
          leading,
          const SizedBox(width: 7),
          // Customizable Text
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF202720),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
