import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Addcollege extends StatefulWidget {
  const Addcollege({super.key});

  @override
  State<Addcollege> createState() => _AddcollegeState();
}

class _AddcollegeState extends State<Addcollege> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";
   String Location = ""; String Institute_Type = ""; String Established = "";
  void _submit() {
    // you can write your
    // own code according to
    // whatever you want to submit;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      // if (value!.isEmpty || !value.contains('@')) {
                      //   return 'Invalid email!';
                      // }
                    },
                  ),

                 TextFormField(
                    decoration: InputDecoration(labelText: 'Location'),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      setState(() {
                        Location = value;
                      });
                    },
                    validator: (value) {
                      // if (value!.isEmpty || !value.contains('@')) {
                      //   return 'Invalid email!';
                      // }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Institute Type'),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      setState(() {
                        Institute_Type = value;
                      });
                    },
                    validator: (value) {
                      // if (value!.isEmpty || !value.contains('@')) {
                      //   return 'Invalid email!';
                      // }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Established'),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      setState(() {
                        Established = value;
                      });
                    },
                    validator: (value) {
                      // if (value!.isEmpty || !value.contains('@')) {
                      //   return 'Invalid email!';
                      // }
                    },
                  ),


















                  
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text("submit"),
                  ),
                ],
              ),
            ),
            // this is where
            // the form field
            // are defined
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                email.isEmpty ? Text("No data") : Text(email),
                SizedBox(
                  height: 10,
                ),
                password.isEmpty ? Text("No Data") : Text(password),
              ],
            )
          ],
        ),
      ),
    );
  }
}