import 'package:flutter/material.dart';

// Define a stateful widget called CategorySelector
class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

// Define the state for the CategorySelector widget
class _CategorySelectorState extends State<CategorySelector> {
  // List of categories to display
  List<String> categories = [
    "CRABS",
    "STARTERS",
    "SALMON",
    "LOBSTERS",
    "SHRIMPS",
  ];
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Return a horizontally scrollable list of categories
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // Generate a list of TextButton widgets for each category
        children: List.generate(categories.length, (index) {
          // Check if the current index is the selected index
          bool isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            // Create a TextButton for each category
            child: TextButton(
              onPressed: () {
                // Update the selected index when the button is pressed
                setState(() {
                  selectedIndex = index;
                });
              },
              // Style the button based on whether it is selected
              style: TextButton.styleFrom(
                backgroundColor:
                    isSelected ? Colors.blue[200] : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              ),
              // Display the category name in the button
              child: Text(
                categories[index],
                // Style the text based on whether the button is selected
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 0.4,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
