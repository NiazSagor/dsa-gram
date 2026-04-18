import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'MODULE 04: SEARCHING ALGORITHMS',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Binary Search',
                  style: textTheme.displayLarge?.copyWith(fontSize: 40),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                    children: [
                      const TextSpan(text: 'The divide-and-conquer classic. Optimal\nsearching in '),
                      TextSpan(
                        text: 'O(log n)',
                        style: TextStyle(color: colorScheme.tertiary, fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Code Editor Card
              _buildCodeEditor(colorScheme),
              
              const SizedBox(height: 24),
              
              // Tip Card
              _buildTipCard(colorScheme),
              
              const Spacer(),
              
              // Interaction Footer
              _buildInteractionFooter(colorScheme),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeEditor(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outlineVariant, width: 1),
      ),
      child: Column(
        children: [
          // Editor Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildDot(Colors.redAccent),
                _buildDot(Colors.amberAccent),
                _buildDot(Colors.blueAccent),
                const SizedBox(width: 16),
                Text(
                  'PYTHON',
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                Icon(Icons.copy_rounded, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5), size: 16),
              ],
            ),
          ),
          
          // Code Content
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.black.withValues(alpha: 0.3),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                  height: 1.6,
                ),
                children: [
                  _codeSpan('def ', colorScheme.tertiary),
                  _codeSpan('binary_search', colorScheme.primary),
                  _codeSpan('(arr, target):\n', Colors.white),
                  _codeSpan('    low, high = ', Colors.white),
                  _codeSpan('0', colorScheme.tertiary),
                  _codeSpan(', ', Colors.white),
                  _codeSpan('len', colorScheme.primary),
                  _codeSpan('(arr) - ', Colors.white),
                  _codeSpan('1\n\n', colorScheme.tertiary),
                  _codeSpan('    while ', colorScheme.tertiary),
                  _codeSpan('low <= high:\n', Colors.white),
                  _codeSpan('        mid = (low + high) // ', Colors.white),
                  _codeSpan('2\n', colorScheme.tertiary),
                  _codeSpan('        guess = arr[mid]\n\n', Colors.white),
                  _codeSpan('        if ', colorScheme.tertiary),
                  _codeSpan('guess == target: ', Colors.white),
                  _codeSpan('return ', colorScheme.tertiary),
                  _codeSpan('mid\n', Colors.white),
                  _codeSpan('        if ', colorScheme.tertiary),
                  _codeSpan('guess > target: high = mid - ', Colors.white),
                  _codeSpan('1\n', colorScheme.tertiary),
                  _codeSpan('        else', colorScheme.tertiary),
                  _codeSpan(': low = mid + ', Colors.white),
                  _codeSpan('1\n\n', colorScheme.tertiary),
                  _codeSpan('    return ', colorScheme.tertiary),
                  _codeSpan('None', colorScheme.tertiary),
                ],
              ),
            ),
          ),
          
          // Metrics Footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: colorScheme.outlineVariant, width: 1)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildMetric('TIME', 'O(log n)', colorScheme.tertiary),
                ),
                Container(width: 1, height: 24, color: colorScheme.outlineVariant),
                Expanded(
                  child: _buildMetric('SPACE', 'O(1)', colorScheme.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _codeSpan(String text, Color color) {
    return TextSpan(text: text, style: TextStyle(color: color));
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildMetric(String label, String value, Color valueColor) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white30, fontSize: 10, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(color: valueColor, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
        ),
      ],
    );
  }

  Widget _buildTipCard(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.tertiary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.lightbulb_outline_rounded, color: colorScheme.tertiary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The Midpoint Calculation',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 13),
                    children: [
                      const TextSpan(text: 'Use '),
                      TextSpan(
                        text: 'low + (high - low) // 2',
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontFamily: 'monospace',
                          backgroundColor: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                      const TextSpan(text: ' to prevent integer overflow.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionFooter(ColorScheme colorScheme) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircularButton(Icons.close_rounded, Colors.white, colorScheme),
            const SizedBox(width: 20),
            _buildLargeAction(colorScheme),
            const SizedBox(width: 20),
            _buildCircularButton(Icons.favorite_rounded, colorScheme.primary, colorScheme),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: [
             Text(
              'SWIPE UP FOR NEXT',
              style: TextStyle(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3)),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularButton(IconData icon, Color iconColor, ColorScheme colorScheme) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colorScheme.outlineVariant, width: 1.5),
        color: colorScheme.surfaceContainerLow,
      ),
      child: Icon(icon, color: iconColor),
    );
  }

  Widget _buildLargeAction(ColorScheme colorScheme) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: [colorScheme.primary, const Color(0xFF06B77F)]),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Save to Deck',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.bookmark_rounded, color: Colors.black, size: 20),
        ],
      ),
    );
  }
}
