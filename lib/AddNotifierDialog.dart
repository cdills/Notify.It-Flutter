import 'package:flutter/material.dart';

Widget addNotifierDialog() {
  return SimpleDialog(
    title: Text("Add A Notifier"),
    children: [
      Container (
        margin: const EdgeInsets.all(20.0),
        child: AddNotifierForm()
        ),
      ],
  );
}

class AddNotifierForm extends StatefulWidget {
  @override
  AddNotifierFormState createState() {
    return AddNotifierFormState();
  }
}

class AddNotifierFormState extends State<AddNotifierForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context ) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("I want to be notified when a post is made to:"),
          TextFormField(
            decoration: InputDecoration(
              hintText: "reddit.com/r/"
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a subreddit';
              }
            },
          ),
          SizedBox(height: 20),
          Text("That contains:"), 
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter notifier text';
              }
            },
          ),
          SizedBox(height: 20),
          Center (
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () {
              if (_formKey.currentState.validate()) {
                // If the form is valid, we want to show a Snackbar
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
                Navigator.pop(context, true);
              },
            child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}