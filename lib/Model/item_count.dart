import 'package:flutter/material.dart';

class ListCardViewStatusBar extends StatelessWidget {
  final double? width;
  final int countNumber;
  final String statusName;

  const ListCardViewStatusBar({
    super.key,
    this.width,
    required this.countNumber,
    required this.statusName,
  });

  const ListCardViewStatusBar.empty(this.countNumber, this.statusName, {
    super.key,
    this.width,
  });


  // Getter for countNumber
  int get getCountNumber => countNumber;

  // Getter for statusName
  String get getStatusName => statusName;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                countNumber.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(statusName),
            ],
          ),
        ),
      ),
    );
  }
}