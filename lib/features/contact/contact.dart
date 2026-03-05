import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protfolio/features/contact/widgets.dart';
import 'package:protfolio/shared/extension.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isHovered = false;
  int hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: context.screenWidth * 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xFF2563EB)),
                  ),
                  child: Text(
                    'Contact',
                    style: TextStyle(color: Color(0xFF2563EB)),
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Let’s Discuss Your ',
                        style: TextStyle(
                          color: Color(0xFF0F172A),
                          fontSize: 56,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                      TextSpan(
                        text: ' Project? ',
                        style: TextStyle(
                          color: Color(0xFF2563EB),
                          fontSize: 56,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Let’s make something new, different and more meaningful or make thing more visual or conceptual',
                  style: TextStyle(
                    color: Color(0xFF475569),
                    fontSize: 16,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(2, (index) {
                    return MouseRegion(
                      onEnter: (_) => setState(() {
                        isHovered = true;
                        hoverIndex = index;
                      }),
                      onExit: (_) => setState(() {
                        isHovered = false;
                        hoverIndex = -1;
                      }),
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedContainer(
                          padding: EdgeInsets.all(4),
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: isHovered && hoverIndex == index
                                ? Color(0xFF2563EB).withOpacity(0.1)
                                : null,
                          ),
                          child: Row(
                            spacing: 18,
                            children: [
                              Container(
                                height: 56,
                                width: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2563EB),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  index == 0
                                      ? 'assets/image/phone.svg'
                                      : 'assets/image/email.svg',
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    index == 0 ? 'Call me' : 'Email me ',
                                    style: TextStyle(
                                      color: Color(0xFF475569),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  AutoSizeText(
                                    index == 0
                                        ? '+91 7449167736'
                                        : 'raghul17m@gmail.com',
                                    style: TextStyle(
                                      color: Color(0xFF475569),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 2),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(child: RightSection()),
        ],
      ),
    );
  }
}
