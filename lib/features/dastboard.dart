import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:protfolio/features/about/about.dart';
import 'package:protfolio/features/contact/contact.dart';
import 'package:protfolio/features/home/home_page.dart';

class Dastboard extends StatefulWidget {
  const Dastboard({super.key});

  @override
  State<Dastboard> createState() => _DastboardState();
}

class _DastboardState extends State<Dastboard> {
  final ScrollController _mainController = ScrollController();
  final ScrollController _aboutRightController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            if (!_mainController.hasClients) return;
            final dy = event.scrollDelta.dy;
            final aboutStart = vh;
            final aboutEnd = vh * 2;
            final current = _mainController.offset;
            final maxMain = _mainController.position.maxScrollExtent;
            final goingDown = dy > 0;

            double clamp(double v, double min, double max) {
              if (v < min) return min;
              if (v > max) return max;
              return v;
            }

            void scrollMain(double target) {
              final t = clamp(target, 0, maxMain);
              _mainController.jumpTo(t);
            }

            bool rightReady = _aboutRightController.hasClients;
            final rightMax = rightReady
                ? _aboutRightController.position.maxScrollExtent
                : 0.0;
            void scrollRight(double target) {
              if (!rightReady) return;
              final t = clamp(target, 0, rightMax);
              _aboutRightController.jumpTo(t);
            }

            if (goingDown) {
              final newMain = current + dy;
              if (current < aboutStart && newMain >= aboutStart) {
                scrollMain(aboutStart);
                if (rightReady) {
                  scrollRight(_aboutRightController.offset + dy);
                }
                return;
              }
              if (current >= aboutStart && current < aboutEnd) {
                if (rightReady && _aboutRightController.offset < rightMax) {
                  scrollRight(_aboutRightController.offset + dy);
                  scrollMain(aboutStart);
                  return;
                }
                scrollRight(rightMax);
                scrollMain(current + dy);
                return;
              }
              scrollMain(current + dy);
              return;
            } else {
              final newMain = current + dy;
              if (current > aboutEnd && newMain <= aboutEnd) {
                scrollMain(aboutEnd);
                if (rightReady) {
                  scrollRight(_aboutRightController.offset + dy);
                }
                return;
              }
              if (current >= aboutStart && current <= aboutEnd) {
                if (rightReady && _aboutRightController.offset > 0) {
                  scrollRight(_aboutRightController.offset + dy);
                  scrollMain(aboutEnd);
                  return;
                }
                scrollRight(0);
                scrollMain(current + dy);
                return;
              }
              scrollMain(current + dy);
              return;
            }
          }
        },
        child: SingleChildScrollView(
          controller: _mainController,
          child: Column(
            children: [
              SizedBox(height: vh, child: HomePage()),
              SizedBox(height: vh, child: About()),
              SizedBox(height: vh, child: Contact()),
            ],
          ),
        ),
      ),
    );
  }
}
