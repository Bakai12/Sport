import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final String exerciseName;

  const ExercisePage({super.key, required this.exerciseName});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int sets = 5;
  int repeats = 15;
  double weight = 80.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back squat'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Название упражнения
            Text(
              widget.exerciseName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            
            // Sets
            _buildExerciseParameter(
              label: "SETS",
              value: sets.toString(),
              onDecrement: () {
                setState(() {
                  if (sets > 1) sets--;
                });
              },
              onIncrement: () {
                setState(() {
                  sets++;
                });
              },
            ),
            const SizedBox(height: 20),

            // Repeats
            _buildExerciseParameter(
              label: "REPEATS",
              value: repeats.toString(),
              onDecrement: () {
                setState(() {
                  if (repeats > 1) repeats--;
                });
              },
              onIncrement: () {
                setState(() {
                  repeats++;
                });
              },
            ),
            const SizedBox(height: 20),

            // Weight
            _buildExerciseParameter(
              label: "WEIGHT",
              value: "${weight.toStringAsFixed(1)} KG",
              onDecrement: () {
                setState(() {
                  if (weight > 0.5) weight -= 0.5;
                });
              },
              onIncrement: () {
                setState(() {
                  weight += 0.5;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Виджет для отображения параметра упражнения
  Widget _buildExerciseParameter({
    required String label,
    required String value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove),
            ),
            Container(
              width: 80,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                value,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
