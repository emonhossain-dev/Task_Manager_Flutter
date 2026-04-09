import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required TextTheme textTheme,
  }) : _textTheme = textTheme;

  final TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("data"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description"),
          SizedBox(height: 10,),
          Text("date: 12/12/2026"),
          SizedBox(height: 8,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [

              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all( color: Colors.grey)

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("data", style: _textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )),
                ),


              ),

              Row(children: [
                Icon(Icons.edit),
                Icon(Icons.delete),
              ],)


            ],


          )


        ],



      ),

    );
  }
}