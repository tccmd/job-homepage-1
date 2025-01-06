import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../contact.dart';
import '../firestore.dart';

class ContactsTable extends StatefulWidget {
  ContactsTable({super.key});

  @override
  State<ContactsTable> createState() => _ContactsTableState();
}

class _ContactsTableState extends State<ContactsTable> {
  List<Contact> contacts = [];
  bool tableToPage = true;
  late Contact doc;


  // List checkedList =[];

  @override
  void initState() {
    if (mounted) {
      Firestore.getAllDocuments().then((data) {
        setState(() {
          contacts = data;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (!tableToPage)
        ? Detail(doc)
        : Table(
            border: TableBorder.all(color: Colors.blueGrey),
            children: [
              TableRow(children: [
                TableCell(child: TableText("ID")),
                TableCell(child: TableText("Name")),
                TableCell(child: TableText("Email")),
                TableCell(child: TableText("Tel")),
                TableCell(child: TableText("Checked")),
                TableCell(child: TableText("Contents")),
                TableCell(child: TableText("Timestamp")),
              ]),
              ...contacts.map((contact) {
                var timestamp = contact.timestamp;
                var formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
                    .format(timestamp!.toDate());
                return TableRow(children: [
                  TableCell(child: TableText(contact.id)),
                  TableCell(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          doc = contact;
                          tableToPage = false;
                        });
                      },
                      child: Text(contact.name!),
                    ),
                  ),
                  TableCell(child: TableText(contact.email)),
                  TableCell(child: TableText(contact.tel)),
                  TableCell(
                    child: TableText(contact.check != null ? contact.check!.join(' ') : ''),),
                  TableCell(child: TableText(contact.contents)),
                  TableCell(child: TableText(formattedDate)),
                  //TableCell(child: TableText(contact.deleted.toString())),
                ]);
              }).toList(),
            ],
          );
  }
//   List checked (bool? threeD, bool? aerial, bool? interview) {
//     String threeD2 = '3D';
//     String aerial2 = '항공촬영';
//     String interview2 = '인터뷰';
//     if(threeD != null) {
//       (threeD == true) ? threeD2 = '3D' : threeD2 = '';
//       checkedList.add(threeD2);
//     } else if (aerial != null) {
//       (aerial == true) ? aerial2 = '항공촬영' : aerial2 = '';
//       checkedList.add(aerial2);
//     } else if (interview != null) {
//       (interview == true) ? interview2 = '인터뷰' : interview2 = '';
//       checkedList.add(interview2);
//     }
//     return checkedList;
//   }
}

class TableText extends StatelessWidget {
  dynamic text;

  TableText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        text! as String,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Contact doc;
  bool? tableToPage;

  Detail(this.doc, {this.tableToPage});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
    DateFormat('yyyy-MM-dd – kk:mm').format(doc.timestamp!.toDate());

    return DataTable(
      columns: [
        DataColumn(label: Text('Field')),
        DataColumn(label: Text('Value')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('작성일')),
          DataCell(Text(formattedDate)),
        ]),
        DataRow(cells: [
          DataCell(Text('성함/회사명')),
          DataCell(Text('${doc.name}')),
        ]),
        DataRow(cells: [
          DataCell(Text('이메일')),
          DataCell(Text('${doc.email}')),
        ]),
        DataRow(cells: [
          DataCell(Text('전화번호')),
          DataCell(Text('${doc.tel}')),
        ]),
        DataRow(cells: [
          DataCell(Text('문의내용')),
          DataCell(Text('${doc.contents}')),
        ]),
        DataRow(cells: [
          DataCell(Text('Checked')),
          DataCell(
            Wrap(
              spacing: 8.0,
              children: (doc.check ?? [])
                  .map((value) => Chip(label: Text(value)))
                  .toList(),
            ),
          ),
        ]),
      ],
    );
  }
}

// class Detail extends StatelessWidget {
//   // String rowData;
//   Contact doc;
//   bool? tableToPage;
//
//   Detail(this.doc, {tableToPage});
//
//   @override
//   Widget build(BuildContext context) {
//     String formattedDate =
//     DateFormat('yyyy-MM-dd – kk:mm').format(doc.timestamp!.toDate());
//     return Column(
//       children: [
//         Text('작성일 : $formattedDate'),
//         Text('성함/회사명 : ${doc.name}'),
//         Text('이메일 : ${doc.email}'),
//         Text('전화번호 : ${doc.tel}'),
//         Text('문의내용 : ${doc.contents}'),
//       ],
//     );
//   }
// }

class ContactsList extends StatefulWidget {
  ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List<Contact> contacts = [];

  @override
  void initState() {
    if (mounted) {
      Firestore.getAllDocuments().then((data) {
        setState(() {
          contacts = data;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int contactsCount = contacts.length;
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        child: ListView.builder(
            itemCount: contactsCount,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(contacts[position].name!),
                subtitle: Row(
                  children: [
                    Text(contacts[position].email!),
                    Text(contacts[position].contents!),
                  ],
                ),
                isThreeLine: true,
                dense: true,
                trailing: IconButton(
                  color: Colors.amber,
                  tooltip: 'Add to favorites',
                  icon: const Icon(Icons.star),
                  onPressed: () {},
                ),
              );
            }));
  }
}
