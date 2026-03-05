import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SkillCards extends StatelessWidget {
  const SkillCards({
    super.key,
    required this.title,
    required this.discription,
    required this.iconAddress,
  });
  final String title;
  final String discription;
  final String iconAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 28, width: 28, child: SvgPicture.asset(iconAddress)),
        SizedBox(height: 14),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 14),

        SizedBox(
          width: 300,
          child: Text(
            discription,
            style: TextStyle(
              color: Color(0xFF475569),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
