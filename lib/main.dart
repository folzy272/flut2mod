import 'package:flutter/material.dart';

import 'rating_badge.dart';

void main() => runApp(const RatingApp());

class RatingApp extends StatelessWidget {
  const RatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RatingBadge — практичне завдання 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const RatingPage(),
    );
  }
}

/// Стан потрібен тільки екрану введення, а не RatingBadge.
class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final _ratingController = TextEditingController(text: '4,7');
  final _labelController = TextEditingController(text: 'Відмінно');

  double? _rating = 4.7;
  String _label = 'Відмінно';

  @override
  void dispose() {
    _ratingController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  void _changeRating(String text) {
    final parsed = double.tryParse(text.trim().replaceAll(',', '.'));
    setState(() {
      _rating = parsed != null && parsed.isFinite && parsed >= 0 && parsed <= 5
          ? parsed
          : null;
    });
  }

  void _changeLabel(String text) => setState(() => _label = text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Оцінювання рейтингу')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Введення даних',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _ratingController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Рейтинг від 0 до 5',
                    hintText: 'Наприклад, 4,7',
                    border: const OutlineInputBorder(),
                    errorText: _rating == null ? 'Введіть число від 0 до 5' : null,
                  ),
                  onChanged: _changeRating,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _labelController,
                  decoration: const InputDecoration(
                    labelText: 'Підпис (необов’язково)',
                    hintText: 'Наприклад, Відмінно',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _changeLabel,
                ),
                const SizedBox(height: 28),
                Text('Результат:', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                if (_rating != null)
                  RatingBadge(
                    rating: _rating!,
                    label: _label.trim().isEmpty ? null : _label.trim(),
                  )
                else
                  const Text('Уведіть правильний рейтинг.'),
                const SizedBox(height: 32),
                const Divider(),
                const SizedBox(height: 12),
                Text('Приклади:', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    RatingBadge(rating: 4.7, label: 'Відмінно'),
                    RatingBadge(rating: 3.2, label: 'Добре'),
                    RatingBadge(rating: 1.2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
