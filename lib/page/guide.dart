import 'package:flutter/material.dart';
import 'package:pro_sport/locale/app_localizations.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale?.guide ?? 'Guide',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Back Squat
          _buildExerciseCard(
            context: context,
            title: 'Back Squat',
            description: 'This is a guide for performing Back Squat exercises effectively and safely.',
            instructions: [
              'Stand with feet shoulder-width apart',
              'Place barbell on upper back',
              'Lower hips until thighs parallel to floor',
              'Drive through heels to return to start'
            ],
          ),
          const SizedBox(height: 16),
          
          // Push Ups
          _buildExerciseCard(
            context: context,
            title: 'Push Ups',
            description: 'Push Ups are great for building upper body strength.',
            instructions: [
              'Start in plank position',
              'Lower chest to floor',
              'Keep body straight',
              'Push back to starting position'
            ],
          ),
          const SizedBox(height: 16),
          
          // Deadlift
          _buildExerciseCard(
            context: context,
            title: 'Deadlift',
            description: 'Deadlifts are essential for building full-body strength.',
            instructions: [
              'Stand with feet hip-width apart',
              'Grip barbell with hands outside legs',
              'Lift bar by extending hips and knees',
              'Lower bar with controlled motion'
            ],
          ),
          const SizedBox(height: 16),
          
          // Bench Press
          _buildExerciseCard(
            context: context,
            title: 'Bench Press',
            description: 'Bench Press targets the chest, shoulders, and triceps.',
            instructions: [
              'Lie flat on bench',
              'Grip barbell slightly wider than shoulders',
              'Lower bar to chest',
              'Press bar upward to full extension'
            ],
          ),
          const SizedBox(height: 16),
          
          // Pull Ups
          _buildExerciseCard(
            context: context,
            title: 'Pull Ups',
            description: 'Pull Ups are excellent for back and arm development.',
            instructions: [
              'Grip bar with palms facing away',
              'Hang with arms fully extended',
              'Pull body up until chin clears bar',
              'Lower body with control'
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard({
    required BuildContext context,
    required String title,
    required String description,
    List<String>? instructions,
  }) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: theme.brightness == Brightness.dark ? 0 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: theme.brightness == Brightness.dark
            ? BorderSide(color: theme.dividerColor)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getExerciseIcon(title),
                    color: theme.colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: theme.textTheme.bodyMedium?.color,
                height: 1.4,
              ),
            ),
            
            if (instructions != null && instructions.isNotEmpty) ...[
              const SizedBox(height: 12),
              Divider(
                color: theme.dividerColor,
                thickness: 1,
              ),
              const SizedBox(height: 8),
              Text(
                'Instructions:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.titleMedium?.color,
                ),
              ),
              const SizedBox(height: 8),
              ...instructions.map((instruction) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        instruction,
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getExerciseIcon(String title) {
    switch (title.toLowerCase()) {
      case 'back squat':
        return Icons.fitness_center;
      case 'push ups':
        return Icons.sports_gymnastics;
      case 'deadlift':
        return Icons.self_improvement;
      case 'bench press':
        return Icons.sports;
      case 'pull ups':
        return Icons.arrow_upward;
      default:
        return Icons.extension;
    }
  }
}