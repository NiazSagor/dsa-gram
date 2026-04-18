import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ObsidianTheme {
  // Brand Colors
  static const Color surface = Color(0xFF0E0E0E);
  static const Color surfaceContainerLow = Color(0xFF131313);
  static const Color surfaceContainerHighest = Color(0xFF262626);
  static const Color surfaceContainerLowest = Color(0xFF000000);
  
  static const Color primaryEmerald = Color(0xFF69F6B8);
  static const Color primaryContainer = Color(0xFF06B77F);
  static const Color secondaryRuby = Color(0xFFFF716A);
  static const Color tertiarySapphire = Color(0xFF699CFF);
  
  static const Color onSurfaceVariant = Color(0xFFADAAAA);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: surface,
      
      // Color Scheme for Tonal Layering
      colorScheme: const ColorScheme.dark(
        surface: surface,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurface: Colors.white,
        onSurfaceVariant: onSurfaceVariant,
        primary: primaryEmerald,
        primaryContainer: primaryContainer,
        secondary: secondaryRuby,
        tertiary: tertiarySapphire,
        outlineVariant: Color(0x26484847), // 15% opacity Ghost Border
      ),

      // Typography: Space Grotesk for Headlines, Inter for Body
      textTheme: TextTheme(
        displayLarge: GoogleFonts.spaceGrotesk(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.0,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: onSurfaceVariant,
          height: 1.5,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),

      // Component Specifics
      cardTheme: CardThemeData(
        color: surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // xl corner radius
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryEmerald,
          foregroundColor: Colors.black,
          shape: const StadiumBorder(), // Full rounding
          elevation: 0,
        ),
      ),
    );
  }
}
