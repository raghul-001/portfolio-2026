import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:protfolio/features/about/about.dart';
import 'package:protfolio/features/contact/contact.dart';
import 'package:protfolio/features/home/home_page.dart';
import 'package:protfolio/shared/extension.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _aboutScrollController = ScrollController();
  bool isAboutSectionVisible = false;
  double _lastOffset = 0.0;
  String scrollDirection = 'forward';

  @override
  void initState() {
    super.initState();

    _mainScrollController.addListener(() {
      final offset = _mainScrollController.offset;
      final delta = offset - _lastOffset;

      if (delta > 0) {
        scrollDirection = 'forward';
      } else if (delta < 0) {
        scrollDirection = 'backward';
      }

      if (isAboutSectionVisible) {
        final aboutOffset = _aboutScrollController.offset;
        final maxExtent = _aboutScrollController.position.maxScrollExtent;
        final minExtent = _aboutScrollController.position.minScrollExtent;

        /// FORWARD SCROLL
        if (delta > 0 && aboutOffset < maxExtent) {
          _mainScrollController.jumpTo(_lastOffset);

          final newOffset = (aboutOffset + delta).clamp(minExtent, maxExtent);

          _aboutScrollController.jumpTo(newOffset);
          return;
        }

        /// BACKWARD SCROLL
        if (delta < 0 && aboutOffset > minExtent) {
          _mainScrollController.jumpTo(_lastOffset);

          final newOffset = (aboutOffset + delta).clamp(minExtent, maxExtent);

          _aboutScrollController.jumpTo(newOffset);
          return;
        }
      }

      _lastOffset = offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _mainScrollController,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: context.screenHeight, child: HomePage()),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: Key('about-section'),
              onVisibilityChanged: (info) {
                print('ccccc ${info.visibleFraction}');
                if (info.visibleFraction >= 0.95) {
                  if (!isAboutSectionVisible) {
                    setState(() {
                      isAboutSectionVisible = true;
                    });
                  }
                } else {
                  if (isAboutSectionVisible) {
                    setState(() {
                      isAboutSectionVisible = false;
                    });
                  }
                }
              },
              child: SizedBox(
                height: context.screenHeight,
                child: About(aboutrighcontroller: _aboutScrollController),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: context.screenHeight, child: Contact()),
          ),
        ],
      ),
    );
  }
}
