import 'package:cloud_firestore/cloud_firestore.dart';
import 'contact.dart';

class Firestore {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static void addDocumentContact(Contact docs) async {
    final data = Contact(
      name: docs.name,
      email: docs.email,
      tel: docs.tel,
      check: docs.check,
      contents: docs.contents,
    );
    await FirebaseFirestore.instance
        .collection("contact")
        .withConverter(
      fromFirestore: Contact.fromFirestore,
      toFirestore: (Contact docs, options) => data.toFirestore(),
    )
        .add(data);
    print("Document added successfully");
  }

  static Future<List<Contact>> getAllDocuments() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance.collection('contact').orderBy("timestamp", descending: true).get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot
        .docs;

    List<Contact> testCollectionList = [];
    for (var doc in documents) {
      Contact testCollection = Contact.fromFirestore(doc, null);
      testCollectionList.add(testCollection);
      //print(testCollection);
    }
    print(testCollectionList);
    return testCollectionList;
  }

  static Future<List<Contact>> getSearchDocuments(String searchText) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance.collection('contact')
        .where('name', isEqualTo: searchText)
        .get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;

    List<Contact> testCollectionList = [];
    for (var doc in documents) {
      Contact testCollection = Contact.fromFirestore(doc, null);
      testCollectionList.add(testCollection);
    }
    return testCollectionList;
  }
}