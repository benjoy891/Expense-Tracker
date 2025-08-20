import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

// Enum representing the different categories an expense can belong to.
// This helps classify expenses into specific types for better organization and filtering.
enum Category { travel, food, work, leisure }

const categoryIcons = {
  Category.food: Icons.lunch_dining_sharp,
  Category.work: Icons.work_history_sharp,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.movie_creation_sharp,
};

class Expense {
  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  // Constructor that creates an ExpenseBucket with a specific category and a list of expenses.
  const ExpenseBucket({required this.category, required this.expenses});

  // Named constructor that filters allExpenses and keeps only those matching the given category.
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where(
            (expense) => expense.category == category,
          ) // Only keep expenses of this category.
          .toList();

  // The category this bucket represents (e.g., food, travel, etc.).
  final Category category;
  // The list of expenses that belong to this category.
  final List<Expense> expenses;

  // Getter that calculates the total amount spent in this bucket.
  double get totalExpense {
    double sum = 0;
    // Loop through each expense and add its amount to sum.
    for (final expense in expenses) {
      sum += expense.amount;
    }
    // Return the total sum of all expenses in this bucket.
    return sum;
  }
}
