import 'package:flutter/material.dart';

import 'contact.dart';

abstract class ListViewer {}

class XMLLongListWithSeparator extends StatelessWidget implements ListViewer {
  List<Contact> listOfItems = XmlContactsAdapter().getContacts();
  XMLLongListWithSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: listOfItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              print('Clicked on item #$index'); // Print to console
            },
            title: Text(listOfItems[index].fullName),
            subtitle: Text(listOfItems[index].email +
                ' ' +
                listOfItems[index].phoneNumber),
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.amber,
            ),
            trailing: Icon(Icons.edit),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

class CSVLongListWithSeparator extends StatelessWidget implements ListViewer {
  CSVLongListWithSeparator({super.key});
  List<Contact> listOfItems = CSVContactsAdapter().getContacts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: listOfItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              print('Clicked on item #$index'); // Print to console
            },
            title: Text(listOfItems[index].fullName),
            subtitle: Text(listOfItems[index].email +
                ' ' +
                listOfItems[index].phoneNumber),
            leading: Container(
              height: 50,
              width: 50,
              color: (listOfItems[index].friend == true)
                  ? Colors.amber
                  : Colors.blue,
            ),
            trailing: const Icon(Icons.edit),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
