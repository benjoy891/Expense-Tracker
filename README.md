# Expense Tracker

A simple Flutter app to track your daily expenses, categorize them, and visualize your spending habits with charts.

## Features

- **Add Expenses:** Quickly add new expenses with title, amount, date, and category.
- **Categorize Expenses:** Organize your spending into categories like Food, Travel, Work, and Leisure.
- **Expense List:** View all your expenses in a scrollable list.
- **Charts:** Visual summary of your expenses by category.
- **Undo Delete:** Accidentally deleted an expense? Easily undo it from the snackbar.
- **Responsive UI:** Works well on different screen sizes.
- **Light & Dark Mode:** Automatically adapts to your device’s theme.

## Download Link:

- https://drive.google.com/file/d/1Ftw4EfRqjS5M4vuPDbgBzDuLd1Q-vLAB/view?usp=drive_link

## Getting Started

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/expense_tracker.git
   cd expense_tracker
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

## Folder Structure

- `lib/`
  - `main.dart` - App entry point and theme setup
  - `expenses.dart` - Main screen with expense list and add button
  - `data/expense.dart` - Expense model and category definitions
  - `new_expense.dart` - Form to add a new expense
  - `charts/chart.dart` - Chart widget for visualizing expenses
  - `charts/chart_bar.dart` - Individual bar for the chart

## Customization

- Change categories or colors in `data/expense.dart` and `main.dart`.
- Add more features as needed

## Requirements

- Flutter SDK (3.x recommended)
- Dart


---

*Made with Flutter ❤️*
