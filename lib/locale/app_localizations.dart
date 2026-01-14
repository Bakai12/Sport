import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Pro Sport',
      'trainings': 'Trainings',
      'guide': 'Guide',
      'notes': 'Notes',
      'settings': 'Settings',
      'select_training_day': 'Select training day',
      'legs': 'Legs',
      'back_and_abs': 'Back and Abs',
      'arm': 'Arm',
      'chest': 'Chest',
      'profile': 'PROFILE',
      'username': 'Username',
      'email': 'Email',
      'app_settings': 'APP SETTINGS',
      'dark_mode': 'Dark Mode',
      'language': 'Language',
      'units': 'Units',
      'metric_kg': 'Metric (kg)',
      'notifications': 'NOTIFICATIONS',
      'push_notifications': 'Push Notifications',
      'workout_reminders': 'Workout Reminders',
      'daily_at_7pm': 'Daily at 7:00 PM',
      'other': 'OTHER',
      'privacy_policy': 'Privacy Policy',
      'terms_of_service': 'Terms of Service',
      'rate_app': 'Rate App',
      'contact_support': 'Contact Support',
      'log_out': 'Log Out',
      'enter_your_note': 'Enter your note',
      'add_note': 'Add Note',
      'no_notes_yet': 'No notes yet',
      'type_your_note': 'Type your note here...',
      'delete_note': 'Delete Note',
      'are_you_sure_delete': 'Are you sure you want to delete this note?',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'edit_note': 'Edit Note',
      'edit_your_note': 'Edit your note...',
      'save': 'Save',
      'select_language': 'Select Language',
      'english': 'English',
      'russian': 'Russian',
      'kazakh': 'Kazakh',
    },
    'ru': {
      'app_title': 'Про Спорт',
      'trainings': 'Тренировки',
      'guide': 'Гайд',
      'notes': 'Заметки',
      'settings': 'Настройки',
      'select_training_day': 'Выберите день тренировки',
      'legs': 'Ноги',
      'back_and_abs': 'Спина и Пресс',
      'arm': 'Руки',
      'chest': 'Грудь',
      'profile': 'ПРОФИЛЬ',
      'username': 'Имя пользователя',
      'email': 'Электронная почта',
      'app_settings': 'НАСТРОЙКИ ПРИЛОЖЕНИЯ',
      'dark_mode': 'Темная тема',
      'language': 'Язык',
      'units': 'Единицы измерения',
      'metric_kg': 'Метрические (кг)',
      'notifications': 'УВЕДОМЛЕНИЯ',
      'push_notifications': 'Пуш-уведомления',
      'workout_reminders': 'Напоминания о тренировках',
      'daily_at_7pm': 'Ежедневно в 19:00',
      'other': 'ДРУГОЕ',
      'privacy_policy': 'Политика конфиденциальности',
      'terms_of_service': 'Условия использования',
      'rate_app': 'Оценить приложение',
      'contact_support': 'Связаться с поддержкой',
      'log_out': 'Выйти',
      'enter_your_note': 'Введите вашу заметку',
      'add_note': 'Добавить заметку',
      'no_notes_yet': 'Пока нет заметок',
      'type_your_note': 'Введите вашу заметку здесь...',
      'delete_note': 'Удалить заметку',
      'are_you_sure_delete': 'Вы уверены, что хотите удалить эту заметку?',
      'cancel': 'Отмена',
      'delete': 'Удалить',
      'edit_note': 'Редактировать заметку',
      'edit_your_note': 'Редактируйте вашу заметку...',
      'save': 'Сохранить',
      'select_language': 'Выберите язык',
      'english': 'Английский',
      'russian': 'Русский',
      'kazakh': 'Казахский',
    },
    'kk': {
      'app_title': 'Pro Sport',
      'trainings': 'Жаттығулар',
      'guide': 'Нұсқау',
      'notes': 'Жазбалар',
      'settings': 'Баптаулар',
      'select_training_day': 'Жаттығу күнін таңдаңыз',
      'legs': 'Аяқтар',
      'back_and_abs': 'Арқа және Бауыр',
      'arm': 'Қол',
      'chest': 'Кеуде',
      'profile': 'ПРОФИЛЬ',
      'username': 'Қолданушы аты',
      'email': 'Электрондық пошта',
      'app_settings': 'ҚОСЫЛЫМ БАПТАУЛАРЫ',
      'dark_mode': 'Қараңғы тақырып',
      'language': 'Тіл',
      'units': 'Өлшем бірліктері',
      'metric_kg': 'Метрикалық (кг)',
      'notifications': 'ХАБАРЛАНДЫРУЛАР',
      'push_notifications': 'Push хабарландырулар',
      'workout_reminders': 'Жаттығу еске салулары',
      'daily_at_7pm': 'Күнделікті сағат 19:00',
      'other': 'БАСҚА',
      'privacy_policy': 'Құпиялылық саясаты',
      'terms_of_service': 'Пайдалану шарттары',
      'rate_app': 'Қосымшаны бағалау',
      'contact_support': 'Қолдау қызметіне хабарласу',
      'log_out': 'Шығу',
      'enter_your_note': 'Жазбаңызды енгізіңіз',
      'add_note': 'Жазба қосу',
      'no_notes_yet': 'Әлі жазба жоқ',
      'type_your_note': 'Жазбаңызды осында енгізіңіз...',
      'delete_note': 'Жазбаны жою',
      'are_you_sure_delete': 'Бұл жазбаны жойғыңыз келетініне сенімдісіз бе?',
      'cancel': 'Болдырмау',
      'delete': 'Жою',
      'edit_note': 'Жазбаны өңдеу',
      'edit_your_note': 'Жазбаңызды өңдеңіз...',
      'save': 'Сақтау',
      'select_language': 'Тілді таңдаңыз',
      'english': 'Ағылшын',
      'russian': 'Орыс',
      'kazakh': 'Қазақ',
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]!['app_title']!;
  String get trainings => _localizedValues[locale.languageCode]!['trainings']!;
  String get guide => _localizedValues[locale.languageCode]!['guide']!;
  String get notes => _localizedValues[locale.languageCode]!['notes']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get selectTrainingDay => _localizedValues[locale.languageCode]!['select_training_day']!;
  String get legs => _localizedValues[locale.languageCode]!['legs']!;
  String get backAndAbs => _localizedValues[locale.languageCode]!['back_and_abs']!;
  String get arm => _localizedValues[locale.languageCode]!['arm']!;
  String get chest => _localizedValues[locale.languageCode]!['chest']!;
  String get profile => _localizedValues[locale.languageCode]!['profile']!;
  String get username => _localizedValues[locale.languageCode]!['username']!;
  String get email => _localizedValues[locale.languageCode]!['email']!;
  String get appSettings => _localizedValues[locale.languageCode]!['app_settings']!;
  String get darkMode => _localizedValues[locale.languageCode]!['dark_mode']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get units => _localizedValues[locale.languageCode]!['units']!;
  String get metricKg => _localizedValues[locale.languageCode]!['metric_kg']!;
  String get notifications => _localizedValues[locale.languageCode]!['notifications']!;
  String get pushNotifications => _localizedValues[locale.languageCode]!['push_notifications']!;
  String get workoutReminders => _localizedValues[locale.languageCode]!['workout_reminders']!;
  String get dailyAt7pm => _localizedValues[locale.languageCode]!['daily_at_7pm']!;
  String get other => _localizedValues[locale.languageCode]!['other']!;
  String get privacyPolicy => _localizedValues[locale.languageCode]!['privacy_policy']!;
  String get termsOfService => _localizedValues[locale.languageCode]!['terms_of_service']!;
  String get rateApp => _localizedValues[locale.languageCode]!['rate_app']!;
  String get contactSupport => _localizedValues[locale.languageCode]!['contact_support']!;
  String get logOut => _localizedValues[locale.languageCode]!['log_out']!;
  String get enterYourNote => _localizedValues[locale.languageCode]!['enter_your_note']!;
  String get addNote => _localizedValues[locale.languageCode]!['add_note']!;
  String get noNotesYet => _localizedValues[locale.languageCode]!['no_notes_yet']!;
  String get typeYourNote => _localizedValues[locale.languageCode]!['type_your_note']!;
  String get deleteNote => _localizedValues[locale.languageCode]!['delete_note']!;
  String get areYouSureDelete => _localizedValues[locale.languageCode]!['are_you_sure_delete']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get delete => _localizedValues[locale.languageCode]!['delete']!;
  String get editNote => _localizedValues[locale.languageCode]!['edit_note']!;
  String get editYourNote => _localizedValues[locale.languageCode]!['edit_your_note']!;
  String get save => _localizedValues[locale.languageCode]!['save']!;
  String get selectLanguage => _localizedValues[locale.languageCode]!['select_language']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get russian => _localizedValues[locale.languageCode]!['russian']!;
  String get kazakh => _localizedValues[locale.languageCode]!['kazakh']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru', 'kk'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}