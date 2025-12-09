import 'package:flutter/material.dart';

Card Item_List(String progrss_status) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8,bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Title",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Subtitle", maxLines: 2, overflow: TextOverflow.ellipsis,),
          const SizedBox(height: 8),
          const Text("Date: 02/02/2025", style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Button
              ElevatedButton(
                onPressed: () {
                  // Button action
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all(const Size(100, 40)),

                ),
                child: Text(
                  progrss_status,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Right: two icons
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.red)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit, color: Colors.grey)),

                ],
              ),
            ],
          )


        ],
      ),
    ),
  );
}