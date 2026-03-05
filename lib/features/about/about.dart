import 'package:flutter/material.dart';
import 'package:protfolio/features/about/widgets.dart';
import 'package:protfolio/features/home/widgets.dart';
import 'package:protfolio/shared/extension.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: context.screenWidth * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xFF2563EB)),
                  ),
                  child: Text(
                    'Skills',
                    style: TextStyle(color: Color(0xFF2563EB)),
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Why Hire Me For Your Next ',
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
                  'I pay close attention to detail, ensure smooth user experiences, and follow structured development practices to keep projects organized and scalable',
                  style: TextStyle(
                    color: Color(0xFF475569),
                    fontSize: 16,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32),
                PrimaryButton(text: 'Hire me', onPressed: () {}),
              ],
            ),
          ),

          // right Section
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: SkillCards(
                      iconAddress: 'assets/image/pulse.svg',
                      discription:
                          'Develop interactive, high-fidelity prototypes in Figma to validate product ideas before development and reduce implementation risks.',
                      title: 'Design Prototyping',
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: SkillCards(
                      iconAddress: 'assets/image/school.svg',
                      title: 'Publishing',
                      discription:
                          'Deploy applications to Google Play Store, Apple App Store, and web hosting platforms with proper CI/CD setup.',
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: SkillCards(
                      iconAddress: 'assets/image/diamond.svg',
                      title: 'Optimization',
                      discription:
                          'Optimize performance, reduce load time, and handle full deployment to Play Store, App Store, and Web.',
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: SkillCards(
                      iconAddress: 'assets/image/school.svg',
                      title: 'Publishing',
                      discription:
                          'Deploy applications to Google Play Store, Apple App Store, and web hosting platforms with proper CI/CD setup.',
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: SkillCards(
                      iconAddress: 'assets/image/diamond.svg',
                      title: 'Optimization',
                      discription:
                          'Optimize performance, reduce load time, and handle full deployment to Play Store, App Store, and Web.',
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: SkillCards(
                      iconAddress: 'assets/image/school.svg',
                      title: 'Publishing',
                      discription:
                          'Deploy applications to Google Play Store, Apple App Store, and web hosting platforms with proper CI/CD setup.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
