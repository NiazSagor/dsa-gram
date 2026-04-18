import 'package:flutter/material.dart';

class PitfallCardScreen extends StatelessWidget {
  const PitfallCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'DSAgram',
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            _buildNavHint(Icons.keyboard_arrow_up_rounded, 'PREVIOUS', colorScheme),
            
            const SizedBox(height: 24),
            
            // Pitfall Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF421C1C),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF6B2D2D), width: 1),
              ),
              child: const Text(
                'CRITICAL PITFALL',
                style: TextStyle(
                  color: Color(0xFFFF5252),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF2C1616),
                        Color(0xFF1E1E1E),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: const Color(0xFF422121),
                      width: 1,
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                    child: Column(
                      children: [
                        // Warning Icon
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color(0xFFB71C1C),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(Icons.warning_amber_rounded, color: Colors.white, size: 40),
                          ),
                        ),
                        
                        const SizedBox(height: 40),
                        
                        Text(
                          'The Sliding Window Trap',
                          style: textTheme.displayLarge?.copyWith(
                            fontSize: 32,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: 24),
                        
                        Text(
                          'When implementing a fixed-size sliding window, many developers make the "re-calculation" mistake.',
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: 40),
                        
                        // Actionable Box
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A0D0D),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: const Color(0xFF3D1F1F), width: 1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.cancel_outlined, color: Color(0xFFFF5252), size: 16),
                                  const SizedBox(width: 8),
                                  Text(
                                    'WHAT NOT TO DO',
                                    style: TextStyle(
                                      color: const Color(0xFFFF5252).withValues(alpha: 0.7),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                '"Do not re-sum the entire window inside the loop."',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 40),
                        
                        // Complexity Spike Detail
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 2),
                              child: const Icon(Icons.error_outline_rounded, color: Color(0xFFFF5252), size: 16),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: colorScheme.onSurfaceVariant,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'Complexity spike: ',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(text: 'Calculating the sum of a window of size '),
                                    _valueSpan('K', colorScheme.onSurface),
                                    const TextSpan(text: ' manually inside a loop of size '),
                                    _valueSpan('N', colorScheme.onSurface),
                                    const TextSpan(text: ' turns an '),
                                    _valueSpan('O(N)', colorScheme.primary),
                                    const TextSpan(text: ' operation into '),
                                    _valueSpan('O(N * K)', const Color(0xFFFF5252)),
                                    const TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            _buildNavHint(Icons.keyboard_arrow_down_rounded, 'NEXT PATTERN', colorScheme, isEmerald: true),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  TextSpan _valueSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: 'monospace',
        backgroundColor: Colors.white.withValues(alpha: 0.05),
      ),
    );
  }

  Widget _buildNavHint(IconData icon, String label, ColorScheme colorScheme, {bool isEmerald = false}) {
    final color = isEmerald ? colorScheme.primary : colorScheme.onSurfaceVariant.withValues(alpha: 0.3);
    return Column(
      children: [
        if (!isEmerald) Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        if (isEmerald) const SizedBox(height: 4),
        if (isEmerald) Icon(icon, color: color, size: 20),
      ],
    );
  }
}
