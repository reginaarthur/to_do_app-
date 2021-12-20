import 'package:flutter/material.dart';
import 'package:to_do_app/todopage.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);
  final GlobalKey<FormState> createTodokey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create To-do"),
        actions: [Icon(Icons.list)],
      ),
      body: Form(
        key: createTodokey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field must not be empty";
                    }
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field must not be empty";
                      }
                    },
                    decoration: InputDecoration(
                      label: Padding(
                        padding: const EdgeInsets.only(bottom: 120),
                        child: Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(5000));
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field must not be empty";
                          }
                        },
                        decoration: InputDecoration(
                          label: Text(
                            'Start Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: TextFormField(
                        onTap: () {
                         showTimePicker(context: context,
                          initialTime: TimeOfDay.now());
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field must not be empty";
                          }
                        },
                        decoration: InputDecoration(
                          label: Text(
                            'Time',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (createTodokey.currentState!.validate()) {
                    //send to database
                  } else {
                    //dont send to database
                  }
                },
                child: Text(
                  "create",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
