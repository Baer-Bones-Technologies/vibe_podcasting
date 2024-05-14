import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_podcasting/themes/default_light_theme.dart';

final themeProvider = StateProvider<ThemeData>((ref) => defaultLightTheme);