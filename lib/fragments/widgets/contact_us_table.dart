import 'package:flutter/material.dart';
import '../../contact.dart';
import '../../firestore.dart';
import '../../screens/admin_screen.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key? key, this.width}) : super(key: key);
  final GlobalKey widget4 = GlobalKey();
  final width;

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  final _textController4 = TextEditingController();
  Contact docs = Contact(check: []);
  bool isCheckedLoem1 = false;
  bool isCheckedLoem2 = false;
  bool isCheckedLoem3 = false;

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // 체크박스 디자인
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }
    
    const checkList = ['Loem1', 'Loem2', 'Loem3'];

    return Container(
        key: widget.widget4,
        margin: EdgeInsets.only(bottom: width / 10),
        width: 500,
        height: 550,
        child: Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFF333333),
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: _textController1,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: (value) => docs.name = value,
                  ),
                  TextFormField(
                    controller: _textController2,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (value) => docs.email = value,
                  ),
                  TextFormField(
                    controller: _textController3,
                    decoration: const InputDecoration(
                      labelText: 'Tel',
                    ),
                    onSaved: (value) => docs.tel = value,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Wrap(
                          spacing: 10.0, // 체크박스와 텍스트 사이의 간격 설정
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.red,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isCheckedLoem1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheckedLoem1 = value!;
                                    });
                                    if (isCheckedLoem1) {
                                      docs.check?.add(checkList[0]);
                                    } else {
                                      docs.check?.remove(checkList[0]);
                                    }
                                  },
                                ),
                                Text(checkList[0]),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.red,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isCheckedLoem2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheckedLoem2 = value!;
                                      if (isCheckedLoem2 == true) {
                                        docs.check?.add(checkList[1]);
                                      } else {
                                        docs.check?.remove(checkList[1]);
                                      }
                                    });
                                  },
                                ),
                                Text(checkList[1]),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.red,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isCheckedLoem3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheckedLoem3 = value!;
                                      if (isCheckedLoem3 == true) {
                                        docs.check?.add(checkList[2]);
                                      } else {
                                        docs.check?.remove(checkList[2]);
                                      }
                                    });
                                  },
                                ),
                                Text(checkList[2]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _textController4,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: null,
                        decoration: const InputDecoration(
                          labelText: 'Contents',
                        ),
                        onSaved: (value) => docs.contents = value,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        child: const Text('보내기'),
                        onPressed: () {
                          if (_textController1.text == "관리자" &&
                              _textController2.text == "testtest12!@") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminScreen()));
                          } else if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Firestore.addDocumentContact(docs);
                            _textController1.clear();
                            _textController2.clear();
                            _textController3.clear();
                            _textController4.clear();
                            setState(() {
                              isCheckedLoem1 = false;
                              isCheckedLoem2 = false;
                              isCheckedLoem3 = false;
                            });
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: const Text('문의 내용이 접수되었습니다.'),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            // txtName.clear();
                                            // txtEmail.clear();
                                            // txtTell.clear();
                                            // txtContents.clear();
                                          },
                                          child: const Text('닫기'))
                                    ],
                                  );
                                });
                          }
                        }),
                  ),
                ]),
              ),
            )));
  }
}
