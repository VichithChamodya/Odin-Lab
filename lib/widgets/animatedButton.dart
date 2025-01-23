import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color tapColor; // Tapping color
  final Color normalColor; // Normal button color
  final TextStyle textStyle;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.tapColor = Colors.blueAccent,
    this.normalColor = Colors.transparent,
    this.textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent,
    ),
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false; // To track button press state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Animation duration
      lowerBound: 0.95, // Shrink to 95%
      upperBound: 1.0, // Grow back to original size
    );
    _controller.value = 1.0; // Initialize at normal size
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    setState(() {
      _isPressed = true;
    });
    _controller.reverse(); // Shrink
  }

  void _onTapUp(_) {
    setState(() {
      _isPressed = false;
    });
    _controller.forward(); // Grow back
    widget.onPressed(); // Trigger button action
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _controller.forward(); // Reset size
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _controller,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          decoration: BoxDecoration(
            color: _isPressed
                ? widget.tapColor
                : widget.normalColor, // Change color on tap
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            widget.text,
            style: widget.textStyle,
          ),
        ),
      ),
    );
  }
}
