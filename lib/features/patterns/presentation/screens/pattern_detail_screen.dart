import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/pattern_model.dart';
import '../../../cards/presentation/viewmodels/cards_viewmodel.dart';
import '../../../cards/data/models/card_model.dart';
import '../../../cards/presentation/screens/card_detail_screen.dart';
import '../../../cards/presentation/screens/pitfall_card_screen.dart';

class PatternDetailScreen extends StatefulWidget {
  final PatternModel pattern;
  const PatternDetailScreen({super.key, required this.pattern});

  @override
  State<PatternDetailScreen> createState() => _PatternDetailScreenState();
}

class _PatternDetailScreenState extends State<PatternDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardsViewModel>().fetchCardsByPatternId(widget.pattern.id);
    });
  }

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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
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
      body: Consumer<CardsViewModel>(
        builder: (context, viewModel, child) {
          final cards = viewModel.getCardsForPattern(widget.pattern.id);

          if (viewModel.isLoading && cards.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Column(
              children: [
                _buildNavHint(
                  icon: Icons.keyboard_double_arrow_up_rounded,
                  label: 'SWIPE DOWN TO CLOSE',
                  colorScheme: colorScheme,
                ),
                
                Expanded(
                  child: cards.isEmpty 
                    ? _buildEmptyState(colorScheme, textTheme)
                    : PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          return _buildCardWrapper(card, colorScheme, textTheme);
                        },
                      ),
                ),
                
                _buildNavHint(
                  icon: Icons.keyboard_double_arrow_down_rounded,
                  label: 'SWIPE UP FOR NEXT',
                  subLabel: 'CONTINUE JOURNEY',
                  colorScheme: colorScheme,
                  isBottom: true,
                ),
                
                // Action Bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_outline, color: Colors.white),
                        label: const Text(
                          'Save Pattern',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        ),
                        child: const Text(
                          'Practice',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme, TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.style_outlined, size: 64, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.2)),
          const SizedBox(height: 16),
          Text(
            'No cards available for this pattern yet.',
            style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWrapper(CardModel card, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to detail view based on card type
          if (card.type == 'pitfall') {
             Navigator.push(context, MaterialPageRoute(builder: (_) => const PitfallCardScreen()));
          } else {
             Navigator.push(context, MaterialPageRoute(builder: (_) => const CardDetailScreen()));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: colorScheme.outlineVariant,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pattern.category.toUpperCase(),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    card.title ?? widget.pattern.title,
                    style: textTheme.displayLarge,
                  ),
                  const SizedBox(height: 24),
                  if (card.content != null)
                    Text(
                      card.content!,
                      style: textTheme.bodyLarge,
                    ),
                  const SizedBox(height: 32),
                  
                  // Simple placeholder for visualization if needed
                  if (card.type == 'visualization')
                    _buildVisualizationPlaceholder(colorScheme),
                  
                  const SizedBox(height: 32),
                  
                  // Complexity placeholder
                  Row(
                    children: [
                      _buildComplexityStat(
                        label: 'COMPLEXITY',
                        value: 'O(n) Time',
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                      const SizedBox(width: 40),
                      _buildComplexityStat(
                        label: 'MEMORY',
                        value: 'O(1) Space',
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVisualizationPlaceholder(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Icon(Icons.analytics_outlined, color: colorScheme.primary, size: 40),
      ),
    );
  }

  Widget _buildNavHint({
    required IconData icon,
    required String label,
    String? subLabel,
    required ColorScheme colorScheme,
    bool isBottom = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: isBottom ? 0 : 8, bottom: isBottom ? 8 : 0),
      child: Column(
        children: [
          if (!isBottom) Icon(icon, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3), size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          if (subLabel != null)
            Text(
              subLabel,
              style: TextStyle(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (isBottom) const SizedBox(height: 4),
          if (isBottom) Icon(icon, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3), size: 20),
        ],
      ),
    );
  }

  Widget _buildComplexityStat({
    required String label,
    required String value,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.primary,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
