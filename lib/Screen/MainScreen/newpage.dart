import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api Integration/Base_url.dart';
import '../../Model/item_count.dart';
import '../Widget/itemlist.dart';
import 'addnewdata.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}



class _NewPageState extends State<NewPage> with RouteAware{

  int newCount = 0;
  int completeCount = 0;
  int progressCount = 0;
  int canceledCount = 0;


  final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();


  @override
  void initState() {
    super.initState();
    ListRequest();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  
  @override
  void didPopNext() {
    ListRequest(); // back থেকে আসলে fresh API call
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

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
                    countNumber: newCount,
                    statusName: "NewTask",
                  ),
                  ListCardViewStatusBar(
                    width: cardWidth,
                    countNumber: completeCount,
                    statusName: "Complete",
                  ),
                  ListCardViewStatusBar(
                    width: cardWidth,
                    countNumber: progressCount,
                    statusName: "Progress",
                  ),
                  ListCardViewStatusBar(
                    width: cardWidth,
                    countNumber: canceledCount,
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


  void ListRequest() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      print("Token not found");
      return;
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: BaseUrl().BASEURL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );

    try {
      Response response = await dio.get(BaseUrl().LIST_URL);

      if (response.statusCode == 200) {
        var res = response.data;             // পুরো JSON Map
        bool success = res['success'] ?? false;
        List dataList = res['data'] ?? [];  // data হলো List

      //  print("Total items: ${dataList.length}");

        // List এর মধ্যে loop চালিয়ে প্রতিটি item access করা
        for (var item in dataList) {
          int id = item['id'];
          int userId = item['user_id'];
          String title = item['title'];
          String description = item['description'];
          String status = item['status'];
          String createdAt = item['created_at'];
          String updatedAt = item['updated_at'];

          print("ID: $id, Title: $title, Status: $status");
        }

        print("Total items: ${dataList.length}");

        // Status অনুযায়ী count calculate
        int _new = dataList.where((item) => item['status'] == 'new').length;
        int _complete = dataList.where((item) => item['status'] == 'complete').length;
        int _progress = dataList.where((item) => item['status'] == 'progress').length;
        int _canceled = dataList.where((item) => item['status'] == 'canceled').length;


        newCount = _new;
        completeCount = _complete;
        progressCount = _progress;
        canceledCount = _canceled;
        // Update UI
        setState(() {
        });
        print("New: $newCount, Complete: $completeCount, Progress: $progressCount, Canceled: $canceledCount");


      }

    } catch (e) {
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exception: $e")),
      );
    }
  }

}


