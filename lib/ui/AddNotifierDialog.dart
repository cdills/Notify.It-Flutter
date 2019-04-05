import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:Notify.It_flutter/redux/app/app_state.dart';
import 'package:Notify.It_flutter/model/Notifier.dart';
import 'package:Notify.It_flutter/ui/notifierList/notifierList_viewmodel.dart';

class AddNotifierDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, NotifierListViewModel>(
        converter: (store) => NotifierListViewModel.fromStore(store),
        builder: (context, viewModel) {
          return new SimpleDialog(
            title: Text("Add A Notifier"),
            children: [
              Container(
                  margin: const EdgeInsets.all(20.0),
                  child: AddNotifierForm(viewModel)),
            ],
          );
        });
  }
}

class AddNotifierForm extends StatefulWidget {
  final NotifierListViewModel viewModel;

  AddNotifierForm(this.viewModel);

  @override
  AddNotifierFormState createState() {
    return AddNotifierFormState(viewModel);
  }
}

class AddNotifierFormState extends State<AddNotifierForm> {
  final subredditController = TextEditingController();
  final searcHTermController = TextEditingController();
  final NotifierListViewModel viewModel;

  AddNotifierFormState(this.viewModel);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("I want to be notified when a post is made to:"),
          TextFormField(
            controller: subredditController,
            decoration: InputDecoration(hintText: "reddit.com/r/"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a subreddit';
              }
            },
          ),
          SizedBox(height: 20),
          Text("That contains:"),
          TextFormField(
            controller: searcHTermController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter notifier text';
              }
            },
          ),
          SizedBox(height: 20),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  viewModel.addNotifier(new Notifier(
                      subredditController.text, searcHTermController.text));
                  Navigator.pop(context, true);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
