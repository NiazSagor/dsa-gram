import 'package:flutter/material.dart';

class PatternCompletionScreen extends StatelessWidget {
  const PatternCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Icon(
                Icons.keyboard_arrow_up_rounded,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              ),
              const Spacer(),
              
              // Success Illustration
              _buildSuccessIllustration(colorScheme),
              
              const SizedBox(height: 48),
              
              Text(
                'Pattern Completed',
                style: textTheme.displayLarge?.copyWith(fontSize: 36),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                '🎉',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 18,
                  ),
                  children: [
                    const TextSpan(text: 'Logic decoded. Your '),
                    TextSpan(
                      text: 'Sliding Window',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' pathways are now strengthened.'),
                  ],
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Summary Cards
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      label: 'TIME COMPLEXITY',
                      value: 'O(n)',
                      colorScheme: colorScheme,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSummaryCard(
                      label: 'SPACE COMPLEXITY',
                      value: 'O(1)',
                      colorScheme: colorScheme,
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Action Buttons
              _buildPrimaryButton(
                label: 'Next Pattern',
                icon: Icons.arrow_forward_rounded,
                colorScheme: colorScheme,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              _buildSecondaryButton(
                label: 'Restart Pattern',
                icon: Icons.refresh_rounded,
                colorScheme: colorScheme,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              _buildTertiaryButton(
                label: 'Explore Library',
                icon: Icons.explore_outlined,
                colorScheme: colorScheme,
                onPressed: () {},
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIllustration(ColorScheme colorScheme) {
    return SizedBox(
      height: 160,
      width: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Square
          Transform.rotate(
            angle: 0.2,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Icon(
                  Icons.terminal_rounded,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  size: 32,
                ),
              ),
            ),
          ),
          // Foreground Square
          Transform.rotate(
            angle: -0.1,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: colorScheme.outlineVariant,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.check_circle_rounded,
                  color: colorScheme.primary,
                  size: 56,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String label,
    required String value,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton({
    required String label,
    required IconData icon,
    required ColorScheme colorScheme,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            const Color(0xFF06B77F),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 12),
            Icon(icon, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryButton({
    required String label,
    required IconData icon,
    required ColorScheme colorScheme,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.surfaceContainerHighest,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTertiaryButton({
    required String label,
    required IconData icon,
    required ColorScheme colorScheme,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
