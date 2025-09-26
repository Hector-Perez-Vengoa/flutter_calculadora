import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1117),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCFCFCF),
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF9EA3AE),
          ),
          labelLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with TickerProviderStateMixin {
  late AnimationController _auroraController;
  late Animation<double> _auroraAnimation;

  @override
  void initState() {
    super.initState();
    _auroraController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
    
    _auroraAnimation = Tween<double>(
      begin: 0.0,
      end: 2.0 * math.pi,
    ).animate(CurvedAnimation(
      parent: _auroraController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _auroraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo animado de aurora
          AnimatedBuilder(
            animation: _auroraAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(
                      0.3 * math.sin(_auroraAnimation.value),
                      0.5 * math.cos(_auroraAnimation.value * 0.7),
                    ),
                    radius: 1.5,
                    colors: [
                      Color.lerp(
                        const Color(0xFF1A4A5C),
                        const Color(0xFF2A3F5F),
                        (math.sin(_auroraAnimation.value * 0.5) + 1) / 2,
                      )!,
                      Color.lerp(
                        const Color(0xFF0F1117),
                        const Color(0xFF1F2937),
                        (math.cos(_auroraAnimation.value * 0.3) + 1) / 2,
                      )!,
                      const Color(0xFF0F1117),
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              );
            },
          ),
          // Aurora secundaria
          AnimatedBuilder(
            animation: _auroraAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(_auroraAnimation.value * 0.3),
                    colors: [
                      Colors.transparent,
                      Color.lerp(
                        const Color(0x11CFCFCF),
                        const Color(0x22A0B4D8),
                        (math.sin(_auroraAnimation.value * 1.2) + 1) / 2,
                      )!,
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              );
            },
          ),
          // Contenido de la calculadora
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF171B22),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0x66C0C0C0),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '450 + 500 + 1000',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1950',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    // Primera fila: AC, +/-, %, ÷
                    Row(
                      children: [
                        Expanded(child: CalculatorButton(label: 'AC', isOperator: false, isSpecial: true)),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '+/-', isOperator: false, isSpecial: true)),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '%', isOperator: false, isSpecial: true)),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '÷', isOperator: true)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Segunda fila: 7, 8, 9, ×
                    Row(
                      children: [
                        Expanded(child: CalculatorButton(label: '7')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '8')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '9')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '×', isOperator: true)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Tercera fila: 4, 5, 6, -
                    Row(
                      children: [
                        Expanded(child: CalculatorButton(label: '4')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '5')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '6')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '-', isOperator: true)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Cuarta fila: 1, 2, 3, +
                    Row(
                      children: [
                        Expanded(child: CalculatorButton(label: '1')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '2')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '3')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '+', isOperator: true)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Quinta fila: 0 (doble ancho), ., =
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CalculatorButton(label: '0', isWide: true),
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '.')),
                        const SizedBox(width: 12),
                        Expanded(child: CalculatorButton(label: '=', isOperator: true)),
                      ],
                    ),
                  ],
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

class CalculatorButton extends StatefulWidget {
  final String label;
  final bool isOperator;
  final bool isSpecial;
  final bool isWide;

  const CalculatorButton({
    super.key,
    required this.label,
    this.isOperator = false,
    this.isSpecial = false,
    this.isWide = false,
  });

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton>
    with TickerProviderStateMixin {
  late AnimationController _pressController;
  late AnimationController _glowController;
  late AnimationController _entryController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _entryAnimation;
  late Animation<Offset> _slideAnimation;
  
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    
    // Animación de presión
    _pressController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _pressController,
      curve: Curves.easeInOut,
    ));
    
    // Animación de resplandor
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeOut,
    ));
    
    // Animación de entrada
    _entryController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _entryAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _entryController,
      curve: Curves.elasticOut,
    ));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entryController,
      curve: Curves.easeOutBack,
    ));
    
    // Iniciar animación de entrada con delay basado en la posición
    Future.delayed(Duration(milliseconds: (widget.label.hashCode % 500) + 100), () {
      if (mounted) {
        _entryController.forward();
      }
    });
  }

  @override
  void dispose() {
    _pressController.dispose();
    _glowController.dispose();
    _entryController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
    _pressController.forward();
    _glowController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    _pressController.reverse();
    _glowController.reverse();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _pressController.reverse();
    _glowController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // Definir colores usando la paleta de aurora
    List<Color> gradientColors;
    Color borderColor;
    Color textColor;
    
    if (widget.isOperator) {
      // Botones de operadores con colores aurora azulados
      gradientColors = [
        const Color(0xFF2A3F5F),
        const Color(0xFF1A4A5C),
      ];
      borderColor = const Color(0x88A0B4D8);
      textColor = const Color(0xFFCFCFCF);
    } else if (widget.isSpecial) {
      // Botones especiales con tonos aurora más claros
      gradientColors = [
        const Color(0xFF1F2937),
        const Color(0xFF374151),
      ];
      borderColor = const Color(0x66C0C0C0);
      textColor = const Color(0xFFE0E0E0);
    } else {
      // Botones numéricos con el gradiente original
      gradientColors = [
        const Color(0xFF1A2030),
        const Color(0xFF131826),
      ];
      borderColor = const Color(0x335F6B7A);
      textColor = const Color(0xFFE0E0E0);
    }
    
    return AnimatedBuilder(
      animation: Listenable.merge([_entryController, _pressController, _glowController]),
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _entryAnimation,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: GestureDetector(
                onTapDown: _handleTapDown,
                onTapUp: _handleTapUp,
                onTapCancel: _handleTapCancel,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Color.lerp(
                        borderColor,
                        borderColor.withOpacity(1.0),
                        _glowAnimation.value,
                      )!,
                      width: 1 + (_glowAnimation.value * 2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8 + (_glowAnimation.value * 4),
                        offset: const Offset(0, 4),
                      ),
                      if (_glowAnimation.value > 0)
                        BoxShadow(
                          color: borderColor.withOpacity(_glowAnimation.value * 0.5),
                          blurRadius: 20 * _glowAnimation.value,
                          offset: const Offset(0, 0),
                        ),
                    ],
                  ),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 150),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Color.lerp(
                          textColor,
                          textColor.withOpacity(0.8),
                          _isPressed ? 0.3 : 0.0,
                        ),
                        fontSize: 20 + (_glowAnimation.value * 2),
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                          ),
                          if (_glowAnimation.value > 0)
                            Shadow(
                              color: borderColor.withOpacity(_glowAnimation.value * 0.8),
                              offset: const Offset(0, 0),
                              blurRadius: 10 * _glowAnimation.value,
                            ),
                        ],
                      ),
                      child: Text(widget.label),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
