import 'package:flutter/material.dart';
import 'package:protfolio/features/home/widgets.dart';

class RightSection extends StatefulWidget {
  const RightSection({super.key});

  @override
  State<RightSection> createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 270,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Full name'),
                ),
              ),
              SizedBox(
                width: 270,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Phone number'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 56,
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Your email'),
            ),
          ),
          SizedBox(
            child: TextFormField(
              maxLines: 8,
              decoration: InputDecoration(hintText: 'Your email'),
            ),
          ),
          SizedBox(height: 12),
          PrimaryButton(text: 'Submit Message', onPressed: () {}),
        ],
      ),
    );
  }
}
