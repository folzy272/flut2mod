# Завдання 2 — Власний Stateless-віджет RatingBadge

Віджет `RatingBadge` реалізовано у `lib/rating_badge.dart`. Він є `StatelessWidget` і має конструктор із `rating` (`double`, обов'язковий) та `label` (`String?`, необов'язковий). Через `Wrap` відображає зірку, число рейтингу з одним десятковим знаком і підпис (якщо його задано).

Колір вибирає окремий метод `getRatingColor(context)`:

- `rating >= 4.0` — зелений;
- `rating >= 2.5` — оранжевий;
- інакше — `Theme.of(context).colorScheme.error`.

В `lib/main.dart` створено екран із введенням даних. Він використовує `StatefulWidget`, оскільки текст у полях змінюється; сам `RatingBadge` залишається `StatelessWidget`. Користувач може вводити десятковий роздільник як кому або крапку, а некоректний рейтинг не показується.

## Запуск

У каталозі `task_02_flutter_rating` виконай:

```powershell
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
```

`flutter create --platforms=web .` потрібно виконати один раз для створення стандартних платформних файлів вебдодатка. Також можна просто скопіювати `lib/main.dart` і `lib/rating_badge.dart` до свого вже створеного Flutter-проєкту та запустити його.

## Тести

```powershell
flutter test
```
