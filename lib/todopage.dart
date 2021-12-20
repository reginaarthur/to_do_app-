

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:to_do_app/utilities.dart';

import 'createpage.dart';

class todoapp extends StatelessWidget {
  todoapp({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> completedTask = [];
  final List<Map<String, dynamic>> mydatabase = [
    {
      'name': 'lets chat',
      'response': 'dynamic reed',
      'time': 'Today',
      'isCompleted': true
    },
    {
      'name': 'I am confused',
      'response': 'Small small I will get it',
      'time': 'Today',
      'isCompleted': true
    },
    {
      'name': 'Do you gerrit?',
      'response': 'If you dont gerrit then forgerrabourrit',
      'time': 'Yesterday',
      'isCompleted': false
    }
  ];

  @override
  Widget build(BuildContext context) {
    for (var element in mydatabase) {
      if (element['isCompleted'] == true) {
        completedTask.add(element);
      }
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                "https://media.istockphoto.com/photos/headshot-of-camel-oman-picture-id1141528670?b=1&k=20&m=1141528670&s=170667a&w=0&h=JFSWaYU5ofoJH6YKXm0BpRDGDuOLHzfK6A-L_FIcBzU="),
          ),
        ),
        title: Text(
          "My tasks",
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.filter_list,
            color: Colors.indigo.shade900,
          ),
          Icon(Icons.search_rounded, color: Colors.indigo.shade900)
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return listwidget(
                name: mydatabase[index]['name'],
                response: mydatabase[index]['response'],
               
                time: mydatabase[index]['time']);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: mydatabase.length),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return listwidget(
                              name: completedTask[index]['name'],
                              response: completedTask[index]['response'],
                              time: completedTask[index]['time']);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: completedTask.length);
                  });
            },
            child: Card(
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.blue),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("completed"),
                  ),
                  Icon(Icons.arrow_drop_down),
                  SizedBox(
                    width: 110,
                  ),
                  Text(completedTask.length.toString())
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  CreateTodo()));
        },
        child: Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}

class listwidget extends StatelessWidget {
  const listwidget(
      {Key? key,
      required this.name,
      required this.response,
      
      required this.time})
      : super(key: key);

  final String name;
  final String response;

  
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.0, left: 15, right: 15),
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(
                Icons.check_circle_outline,
                color: color(time),
                size: 20,
              ),
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.indigo.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.5),
              ),
              minLeadingWidth: 2,
              horizontalTitleGap: 6,
              subtitle: Text(
                response,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.6,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: color(time),
                      size: 15,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 10, color: color(time)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
