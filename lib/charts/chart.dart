import 'package:flutter/material.dart';
import 'package:expense_tracker/data/expense.dart';
import 'package:expense_tracker/charts/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    // Start with 0 as the maximum expense.
    double maxTotalExpense = 0;
    // Go through each expense bucket.
    for (final bucket in buckets) {
      // If this bucket's total is greater than the current max, update the max.
      if (bucket.totalExpense > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpense;
      }
    }
    // Return the highest total expense found.
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            // This makes the Row take up all available vertical space in the parent.
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.end, // Aligns all bars to the bottom.
              children: [
                // For each expense category bucket, create a ChartBar.
                for (final bucket
                    in buckets) // This is a simple alternative to using .map().
                  //  List of Widgets doesnt need curly brackets
                  ChartBar(
                    // The fill value determines the height of the bar.
                    // If there are no expenses in this category, the bar is empty (0).
                    // Otherwise, the bar's height is proportional to the category's total compared to the max.
                    fill: bucket.totalExpense == 0
                        ? 0
                        : bucket.totalExpense / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
