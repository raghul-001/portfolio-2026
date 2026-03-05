import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController mainController = ScrollController();
  final ScrollController rightController = ScrollController();

  // Whether right section should scroll
  bool captureRightScroll = false;

  @override
  void initState() {
    super.initState();

    // Track right scroll and enable/disable main scroll
    rightController.addListener(() {
      if (rightController.offset > 0 &&
          rightController.offset < rightController.position.maxScrollExtent) {
        if (!captureRightScroll) setState(() => captureRightScroll = true);
      } else {
        if (captureRightScroll) setState(() => captureRightScroll = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            if (captureRightScroll) {
              // Forward scroll to rightController
              final newOffset = rightController.offset + event.scrollDelta.dy;
              if (newOffset < 0) {
                rightController.jumpTo(0);
              } else if (newOffset > rightController.position.maxScrollExtent) {
                rightController.jumpTo(
                  rightController.position.maxScrollExtent,
                );
              } else {
                rightController.jumpTo(newOffset);
              }
            } else {
              // Forward scroll to mainController
              final newOffset = mainController.offset + event.scrollDelta.dy;
              if (newOffset < 0) {
                mainController.jumpTo(0);
              } else if (newOffset > mainController.position.maxScrollExtent) {
                mainController.jumpTo(mainController.position.maxScrollExtent);
              } else {
                mainController.jumpTo(newOffset);
              }
            }
          }
        },
        child: SingleChildScrollView(
          controller: mainController,
          child: Column(
            children: [
              // HOME
              Container(
                height: 600,
                color: Colors.blue,
                child: const Center(child: Text("Home Section")),
              ),

              // ABOUT
              Container(
                height: 600,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: const Center(child: Text("About Left")),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.teal[50],
                        child: SingleChildScrollView(
                          controller: rightController,
                          child: Column(
                            children: List.generate(
                              20,
                              (index) => Container(
                                height: 80,
                                margin: const EdgeInsets.all(8),
                                color: Colors.teal[200],
                                child: Center(
                                  child: Text("Right Content $index"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // CONTACT
              Container(
                height: 600,
                color: Colors.green,
                child: const Center(child: Text("Contact Section")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
