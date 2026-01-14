import 'dart:async';

import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final String exerciseName;
  final String imagePath;

  const ExercisePage({
    super.key, 
    required this.exerciseName,
    required this.imagePath,
  });

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int sets = 7;
  int repeats = 10;
  double weight = 80.0;

  // Таймеры для удержания кнопок
  Timer? _decrementTimer;
  Timer? _incrementTimer;
  Timer? _fastTimer;

  @override
  void dispose() {
    _decrementTimer?.cancel();
    _incrementTimer?.cancel();
    _fastTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalWeight = sets * repeats * weight;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.50; // 35% от высоты экрана 

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.exerciseName.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Фото упражнения с адаптивной высотой
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: double.infinity,
                  height: imageHeight,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // SETS
              _buildExerciseParameter(
                label: "SETS",
                value: sets.toString(),
                onDecrement: () {
                  if (sets > 1) {
                    setState(() {
                      sets--;
                    });
                  }
                },
                onIncrement: () {
                  setState(() {
                    sets++;
                  });
                },
                onDecrementLongPressStart: (_) => _startDecrementTimer(() {
                  if (sets > 1) {
                    setState(() {
                      sets--;
                    });
                  }
                }),
                onDecrementLongPressEnd: (_) => _stopDecrementTimer(),
                onIncrementLongPressStart: (_) => _startIncrementTimer(() {
                  setState(() {
                    sets++;
                  });
                }),
                onIncrementLongPressEnd: (_) => _stopIncrementTimer(),
              ),
              const SizedBox(height: 25),

              // REPS
              _buildExerciseParameter(
                label: "REPS",
                value: repeats.toString(),
                onDecrement: () {
                  if (repeats > 1) {
                    setState(() {
                      repeats--;
                    });
                  }
                },
                onIncrement: () {
                  setState(() {
                    repeats++;
                  });
                },
                onDecrementLongPressStart: (_) => _startDecrementTimer(() {
                  if (repeats > 1) {
                    setState(() {
                      repeats--;
                    });
                  }
                }),
                onDecrementLongPressEnd: (_) => _stopDecrementTimer(),
                onIncrementLongPressStart: (_) => _startIncrementTimer(() {
                  setState(() {
                    repeats++;
                  });
                }),
                onIncrementLongPressEnd: (_) => _stopIncrementTimer(),
              ),
              const SizedBox(height: 25),

              // WEIGHT
              _buildExerciseParameter(
                label: "WEIGHT",
                value: "${weight.toStringAsFixed(1)} KG",
                onDecrement: () {
                  if (weight > 0.5) {
                    setState(() {
                      weight -= 0.5;
                    });
                  }
                },
                onIncrement: () {
                  setState(() {
                    weight += 0.5;
                  });
                },
                onDecrementLongPressStart: (_) => _startDecrementTimer(() {
                  if (weight > 0.5) {
                    setState(() {
                      weight -= 0.5;
                    });
                  }
                }),
                onDecrementLongPressEnd: (_) => _stopDecrementTimer(),
                onIncrementLongPressStart: (_) => _startIncrementTimer(() {
                  setState(() {
                    weight += 0.5;
                  });
                }),
                onIncrementLongPressEnd: (_) => _stopIncrementTimer(),
              ),
              const SizedBox(height: 30),

              // Total Weight
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Total Weight:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${totalWeight.toStringAsFixed(1)} KG",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Методы для обработки удержания кнопок
  void _startDecrementTimer(VoidCallback decrementFunction) {
    _decrementTimer?.cancel();
    _decrementTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      decrementFunction();
    });

    // Ускоренный таймер после 1 секунды
    _fastTimer = Timer(const Duration(seconds: 1), () {
      _decrementTimer?.cancel();
      _decrementTimer = Timer.periodic(const Duration(milliseconds: 20), (_) {
        decrementFunction();
      });
    });
  }

  void _stopDecrementTimer() {
    _decrementTimer?.cancel();
    _decrementTimer = null;
    _fastTimer?.cancel();
    _fastTimer = null;
  }

  void _startIncrementTimer(VoidCallback incrementFunction) {
    _incrementTimer?.cancel();
    _incrementTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      incrementFunction();
    });

    // Ускоренный таймер после 1 секунды
    _fastTimer = Timer(const Duration(seconds: 1), () {
      _incrementTimer?.cancel();
      _incrementTimer = Timer.periodic(const Duration(milliseconds: 20), (_) {
        incrementFunction();
      });
    });
  }

  void _stopIncrementTimer() {
    _incrementTimer?.cancel();
    _incrementTimer = null;
    _fastTimer?.cancel();
    _fastTimer = null;
  }

  // Виджет для отображения параметра упражнения
  Widget _buildExerciseParameter({
    required String label,
    required String value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
    required void Function(LongPressStartDetails) onDecrementLongPressStart,
    required void Function(LongPressEndDetails) onDecrementLongPressEnd,
    required void Function(LongPressStartDetails) onIncrementLongPressStart,
    required void Function(LongPressEndDetails) onIncrementLongPressEnd,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Кнопка уменьшения
              GestureDetector(
                onTap: onDecrement,
                onLongPressStart: onDecrementLongPressStart,
                onLongPressEnd: onDecrementLongPressEnd,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.remove, size: 24),
                ),
              ),
              const SizedBox(width: 15),
              // Поле значения
              Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 15),
              // Кнопка увеличения
              GestureDetector(
                onTap: onIncrement,
                onLongPressStart: onIncrementLongPressStart,
                onLongPressEnd: onIncrementLongPressEnd,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, size: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}