import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: isHovered ? 10 : 0),
        height: 48,
        transform: isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isHovered
              ? const Color(0xFF1D4ED8) // hover blue
              : const Color(0xFF2563EB), // normal blue
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: const Color(0x332563EB),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isHovered
              ? const Color(0xFFF1F5F9) // hover bg
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isHovered
                ? const Color(0xFF2563EB)
                : const Color(0xFFE2E8F0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x14000000),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
              color: isHovered
                  ? const Color(0xFF2563EB)
                  : const Color(0xFF0F172A),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
