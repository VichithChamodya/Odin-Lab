import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background with animation
          const AnimatedBackground(),

          // diagonal lines in the background
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalLinePainter(),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // glowing logo with animation
                const AnimatedGlowLogo(
                  assetPath: "assets/images/logo.png",
                  size: 200,
                ),
                const SizedBox(height: 20),
                // add gradient colors to the text
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      kWhiteColor,
                      kSubMainColor,
                      kMainColor,
                      kBlackColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds),
                  child: const Text(
                    "Odin Lab",
                    style: TextStyle(
                      fontFamily: "Orbitron",
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Empowering Education, Innovating Learning",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// animated Background
class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  AnimatedBackgroundState createState() => AnimatedBackgroundState();
}

class AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                kBlackColor,
                Color(0xFF202C5A),
                Color(0xFF2A5298),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0 + (_animationController.value * 0.5),
                0.5 + (_animationController.value * 0.3),
                1.0,
              ],
            ),
          ),
        );
      },
    );
  }
}

// glowing logo animation
class AnimatedGlowLogo extends StatelessWidget {
  final String assetPath;
  final double size;

  const AnimatedGlowLogo({
    required this.assetPath,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlowingLogo(assetPath: assetPath, size: size);
  }
}

class GlowingLogo extends StatefulWidget {
  final String assetPath;
  final double size;

  const GlowingLogo({required this.assetPath, required this.size, super.key});

  @override
  GlowingLogoState createState() => GlowingLogoState();
}

class GlowingLogoState extends State<GlowingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final scale = 1 + (_controller.value * 0.1);
        return Transform.scale(
          scale: scale,
          child: Image.asset(
            widget.assetPath,
            width: widget.size,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// diagonal line painter
class DiagonalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, 0.03)
      ..strokeWidth = 1;

    for (double i = -size.height; i < size.width; i += 30) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
