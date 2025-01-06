import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  String? id;
  String? name;
  String? email;
  String? tel;
  List<String>? check;
  String? contents;
  Timestamp? timestamp;
  bool? deleted;

  Contact({this.id, this.name, this.email, this.tel, this.check,
    this.contents, this.timestamp, this.deleted});

  factory Contact.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    late Map<String, dynamic>? data = snapshot.data();
    return Contact(
      id : snapshot.id,
      name: data?['name'],
      email: data?['email'],
      tel: data?['tel'],
      check: data?['check'] is Iterable ? List.from(data?['check']) : data?['check'],
      contents: data?['contents'],
      timestamp: data?['timestamp'],
      deleted: data?['deleted'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (tel != null) "tel": tel,
      if (check != null) "check" : check,
      if (contents != null) "contents": contents,
      if (timestamp == null) "timestamp": Timestamp.now(),
      // if (radio != null) "radio": radio,
      // if (checkbox != null) "checkbox" : checkbox,
      if (deleted == null) "deleted" : false,
    };
  }
}

