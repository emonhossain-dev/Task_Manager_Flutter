import 'package:flutter/material.dart';

class ChangeStatus_Card extends StatelessWidget {
  const ChangeStatus_Card({
    super.key, required this.count, required this.status,
  });

  final int count;
  final String status;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(count.toString(), style:_textTheme. titleLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
            )),
            Text(status, style:_textTheme.bodyLarge?.copyWith(
                color: Colors.black
            )),

          ],

        ),
      ),

    );
  }
}