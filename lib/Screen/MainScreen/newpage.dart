import 'package:flutter/material.dart';

import '../Widget/itemlist.dart';
import 'addnewdata.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100, // horizontal list height
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ListCardViewStatusBar(
                    width: cardWidth,
                    countNumber: 10,
                    statusName: "NewTask",
                  ),
                  ListCardViewStatusBar(
                    width: cardWidth,
                    countNumber: 10,
                    statusName: "Complete",
                  ),
                  ListCardViewStatusBar(
                    width: cardWidth,
                    countNumber: 7,
                    statusName: "Progress",
                  ),
                  ListCardViewStatusBar(
                    width: cardWidth,
                    countNumber: 5,
                    statusName: "Canceled",
                  ),
                ],
              ),
            ),
          ),

          // Vertical list of cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(

                itemCount: 10,
                  itemBuilder: (context, index) {
                  return Item_List("New");

                  },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewData.name);
        },
        child: Icon(Icons.add),
      ),
    );
  }


}

class ListCardViewStatusBar extends StatelessWidget {
  final double width;
  final int countNumber;
  final String statusName;

  const ListCardViewStatusBar({
    super.key,
    required this.width,
    required this.countNumber,
    required this.statusName,
  });

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
