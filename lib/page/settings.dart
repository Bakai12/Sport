import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pro_sport/main.dart'; // ThemeProvider
import 'package:pro_sport/providers/locale_provider.dart';
import 'package:pro_sport/locale/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(locale?.settings ?? 'Settings'),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: ListView(
        children: [
          // Profile Section
          _buildSectionHeader(locale?.profile ?? 'PROFILE', context),
          _buildSettingTile(
            context: context,
            title: locale?.username ?? 'Username',
            subtitle: 'Bakai',
            icon: Icons.person,
          ),
          _buildSettingTile(
            context: context,
            title: locale?.email ?? 'Email',
            subtitle: 'bakai@example.com',
            icon: Icons.email,
          ),
          
          // App Settings Section
          _buildSectionHeader(locale?.appSettings ?? 'APP SETTINGS', context),
          _buildSettingTile(
            context: context,
            title: locale?.darkMode ?? 'Dark Mode',
            icon: Icons.dark_mode,
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.setThemeMode(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
              activeColor: theme.colorScheme.primary,
            ),
          ),
          _buildSettingTile(
            context: context,
            title: locale?.language ?? 'Language',
            subtitle: localeProvider.getNativeLanguageName(localeProvider.currentLanguageCode),
            icon: Icons.language,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showLanguageDialog(context, localeProvider);
            },
          ),
          _buildSettingTile(
            context: context,
            title: locale?.units ?? 'Units',
            subtitle: locale?.metricKg ?? 'Metric (kg)',
            icon: Icons.straighten,
          ),
          
          // Notifications Section
          _buildSectionHeader(locale?.notifications ?? 'NOTIFICATIONS', context),
          _buildSettingTile(
            context: context,
            title: locale?.pushNotifications ?? 'Push Notifications',
            icon: Icons.notifications,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: theme.colorScheme.primary,
            ),
          ),
          _buildSettingTile(
            context: context,
            title: locale?.workoutReminders ?? 'Workout Reminders',
            subtitle: locale?.dailyAt7pm ?? 'Daily at 7:00 PM',
            icon: Icons.access_time,
          ),
          
          // Other Section
          _buildSectionHeader(locale?.other ?? 'OTHER', context),
          _buildSettingTile(
            context: context,
            title: locale?.privacyPolicy ?? 'Privacy Policy',
            icon: Icons.privacy_tip,
          ),
          _buildSettingTile(
            context: context,
            title: locale?.termsOfService ?? 'Terms of Service',
            icon: Icons.description,
          ),
          _buildSettingTile(
            context: context,
            title: locale?.rateApp ?? 'Rate App',
            icon: Icons.star,
          ),
          _buildSettingTile(
            context: context,
            title: locale?.contactSupport ?? 'Contact Support',
            icon: Icons.help,
          ),
          _buildSettingTile(
            context: context,
            title: locale?.logOut ?? 'Log Out',
            icon: Icons.logout,
            textColor: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6) ?? Colors.grey,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required BuildContext context,
    required String title,
    String? subtitle,
    required IconData icon,
    Widget? trailing,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? theme.textTheme.titleLarge?.color,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: theme.textTheme.bodyMedium?.color,
              ),
            )
          : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap ?? () {},
    );
  }

  void _showLanguageDialog(BuildContext context, LocaleProvider localeProvider) {
    final locale = AppLocalizations.of(context);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(locale?.selectLanguage ?? 'Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption(
                context: context,
                localeProvider: localeProvider,
                languageCode: 'en',
                languageName: locale?.english ?? 'English',
                nativeName: 'English',
              ),
              _buildLanguageOption(
                context: context,
                localeProvider: localeProvider,
                languageCode: 'ru',
                languageName: locale?.russian ?? 'Russian',
                nativeName: 'Русский',
              ),
              _buildLanguageOption(
                context: context,
                localeProvider: localeProvider,
                languageCode: 'kk',
                languageName: locale?.kazakh ?? 'Kazakh',
                nativeName: 'Қазақша',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required LocaleProvider localeProvider,
    required String languageCode,
    required String languageName,
    required String nativeName,
  }) {
    return ListTile(
      title: Text(languageName),
      subtitle: Text(nativeName),
      trailing: localeProvider.currentLanguageCode == languageCode
          ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
          : null,
      onTap: () {
        localeProvider.setLocale(Locale(languageCode));
        Navigator.pop(context);
      },
    );
  }
}