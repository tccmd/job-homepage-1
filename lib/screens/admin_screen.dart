import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contact.dart';
import '../fragments/ui.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late List<Contact> contacts;
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 반응형
    bool isSmall = false;
    if (MediaQuery.of(context).size.width < 600) {
      isSmall = true;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Text('관리자 페이지', style: Theme.of(context).textTheme.headlineSmall),
          Padding(padding: EdgeInsets.all(20),
            child: Row(children: [
              const Text('Search contacts'),
              Container(
                padding: const EdgeInsets.all(20),
                width: 200,
                child: TextField(
                  controller: searchText,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (text) {},
                ),
              ),
              Flexible(child: Container(
                padding: const EdgeInsets.all(20),
                child: IconButton(icon: const Icon(Icons.search),
                  onPressed: (){
                    // List<Contact> searchedContacts = await Firestore.getSearchDocuments(searchText.text);
                    // setState(() {
                    //   contacts = searchedContacts;
                    // });
                  }),
              ))
            ]),),
          Padding(
              padding: EdgeInsets.all(20),
              child: (isSmall) ? ContactsList() : ContactsTable()
          ),
        ]),
      ),
    );
  }
}
