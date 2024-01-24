import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDy7RlzRyNIxNZY8oF0lSxrnCnDtPXTmUA",
    appId: "1:529045249107:android:306657d24773aba4a7baa6",
    messagingSenderId: "",
    projectId: "fir-oper-b60ed",
    storageBucket: "fir-oper-b60ed.appspot.com",
  ));

  runApp(MaterialApp(
    home: FirebaseCrud(),
  ));
}

class FirebaseCrud extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {
  var name_cntllr = TextEditingController();
  var email_cntlr = TextEditingController();
  late CollectionReference _userCollection;

  get updateUser => null;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection("users");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fire base cloud storage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name_cntllr,
                decoration: InputDecoration(
                    labelText: "NAME", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email_cntlr,
                decoration: InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: Text("ADD USER")),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  final users = snapshot.data!.docs;
                  return Expanded(
                      child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            final userId = user.id;
                            final userName = user['name'];
                            final userEmail = user['email'];
                            return ListTile(
                              title: Text(
                                '$userName',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text('$userEmail',
                                  style: TextStyle(fontSize: 15)),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      editUser(userId);
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        deleteUser(userId);
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              ),
                            );
                          }));
                })
          ],
        ),
      ),
    );
  }

  ///create user
  Future<void> addUser() async {
    return _userCollection.add(
        {'name': name_cntllr.text, 'email': email_cntlr.text}).then((value) {
      print("User added Succesfully");
      name_cntllr.clear();
      email_cntlr.clear();
    }).catchError((error) {
      print("Failed to add user $error");
    });
  }

  ///read user
  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }

  void editUser(var id) {
    showDialog(
        context: context,
        builder: (context) {
          final newname_cntllr = TextEditingController();
          final newemai_cntllr = TextEditingController();
          return AlertDialog(
            title: Text("Update User"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newname_cntllr,
                  decoration: InputDecoration(
                      hintText: "Enter name", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: newemai_cntllr,
                  decoration: InputDecoration(
                      hintText: "Enter email", border: OutlineInputBorder()),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    updateUsers(id, newname_cntllr.text, newemai_cntllr.text)
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("update")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel"))
            ],
          );
        });
  }

  ///update user
  Future<void> updateUsers(var id, String newname, String newemail) {
    return _userCollection
        .doc(id)
        .update({'name': newname, 'email': newemail}).then((value) {
      print("User Updated Successfully");
    }).catchError((error) {
      print("User data Updating failed");
    });
  }

  Future<void> deleteUser(var id) {
    return _userCollection.doc(id).delete().then((value) {
      print("User Deleted Successfully");
    }).catchError((error) {
      print("User Dletion failed $error");
    });
  }
}
