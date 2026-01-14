import 'package:flutter/material.dart';
import 'package:pro_sport/page_exercise/arm.dart';
import 'package:pro_sport/page_exercise/back_abs.dart';
import 'package:pro_sport/page_exercise/chest.dart';
import 'package:pro_sport/page_exercise/legs.dart';
import 'package:pro_sport/locale/app_localizations.dart';

class SelectDayPage extends StatelessWidget {
  const SelectDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 80.0, right: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 140),
            Text(
              locale?.selectTrainingDay ?? 'Select training day',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.textTheme.displaySmall?.color ?? Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 120),
            _buildTrainingButton(
              context: context,
              text: locale?.legs ?? 'Legs',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LegsPage()),
                );
              },
            ),
            SizedBox(height: 30),
            _buildTrainingButton(
              context: context,
              text: locale?.backAndAbs ?? 'Back and Abs',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BackAbs()),
                );
              },
            ),
            SizedBox(height: 30),
            _buildTrainingButton(
              context: context,
              text: locale?.arm ?? 'Arm',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArmPage()),
                );
              },
            ),
            SizedBox(height: 30),
            _buildTrainingButton(
              context: context,
              text: locale?.chest ?? 'Chest',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChestPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainingButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    final theme = Theme.of(context);
    
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        shadowColor: theme.colorScheme.shadow,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}