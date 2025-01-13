import 'package:flutter/widgets.dart';

import '../models/language_model.dart';

class AppConstants {
  AppConstants._();

  static const defaultPadding = EdgeInsets.all(20);

  static List<String> securityQuestions = [
    'What is the name of your favorite pet?',
    'Whats Your Childhood Nickname?',
    'What is your favorite movie?',
    'What is your favorite book?',
    'What is your favorite food?',
    'What is your favorite song?',
    'What is your favorite color?',
  ];

  static int maxRows = 500;

  static String maxCosts = 'maxCosts';

  static List<Language> languages = [
    Language(language: 'English', countryFlag: '🇺🇸', languageCode: 'en'),
    Language(language: 'Ukrainian', countryFlag: '🇺🇦', languageCode: 'uk'),
    Language(language: 'Polish', countryFlag: '🇵🇱', languageCode: 'pl'),
    Language(language: 'Bulgarian', countryFlag: '🇧🇬', languageCode: 'bg'),
    Language(language: 'Spanish', countryFlag: '🇪🇸', languageCode: 'es'),
    Language(language: 'German', countryFlag: '🇩🇪', languageCode: 'de'),
    Language(language: 'Czech', countryFlag: '🇨🇿', languageCode: 'cs'),
    Language(language: 'Russian', countryFlag: '🇷🇺', languageCode: 'ru'),
  ];
}
