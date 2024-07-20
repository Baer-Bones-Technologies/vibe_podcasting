import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/themes/default_dark_theme.dart';


final themeProvider = StateProvider<ThemeData>((ref) => defaultDarkTheme);