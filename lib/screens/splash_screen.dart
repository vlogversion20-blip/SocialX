import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fluteController;
  late AnimationController _glowController;
  late AnimationController _textController;

  late Animation<double> _fluteFloat;
  late Animation<double> _fluteRotate;
  late Animation<double> _glowOpacity;
  late Animation<double> _textOpacity;
  late Animation<double> _textScale;

  @override
  void initState() {
    super.initState();

    _fluteController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _fluteFloat = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _fluteController, curve: Curves.easeInOut),
    );

    _fluteRotate = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _fluteController, curve: Curves.easeInOut),
    );

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _glowOpacity = Tween<double>(begin: 0.3, end: 0.9).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _textOpacity = CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
    );

    _textScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutBack),
    );

    Future.delayed(const Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, anim, __) => FadeTransition(
              opacity: anim,
              child: const WelcomeScreen(),
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _fluteController.dispose();
    _glowController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.deepBlue, AppColors.peacockBlue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge([_fluteController, _glowController]),
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gold
                                  .withOpacity(_glowOpacity.value * 0.6),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, _fluteFloat.value),
                        child: Transform.rotate(
                          angle: _fluteRotate.value,
                          child: Container(
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              color: AppColors.deepBlue.withOpacity(0.4),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.gold.withOpacity(0.7),
                                width: 1.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.music_note_rounded,
                              size: 60,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 36),
              FadeTransition(
                opacity: _textOpacity,
                child: ScaleTransition(
                  scale: _textScale,
                  child: const Text(
                    '॥ राधे राधे ॥',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightGold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeTransition(
                opacity: _textOpacity,
                child: const Text(
                  'SocialX',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
