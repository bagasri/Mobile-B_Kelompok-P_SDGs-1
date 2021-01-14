

import 'package:flutter/material.dart';

import '../navigation/navigation.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget with NavigationStates {

  bool showPassword = false;

  // Firestore firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
          'Akun Saya',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,

      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Nama", "", false),
              buildTextField("E-mail", "", false),
              buildTextField("Password", "", true),
              buildTextField("Lokasi", "", false),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SIMPAN",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                  showPassword = !showPassword;
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }


//   return Scaffold(
//       appBar: AppBar(
//         title: Text('Nama'),
//       ),
//       body: StreamBuilder(
//         stream: Firestore.instance.collection('user').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return Text('Loading');
//           return Column(
//             children: <Widget>[
//               Text(snapshot.data.documents[0]['email']),
//               Text(snapshot.data.documents[0]['username']),
//             ],
//           );
//         },
//       ));
// }


//   return Center(
//     child: Text(
//       "My Accounts",
//       style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
//     ),
//   );
// }

//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Home'),
//     ),
//     body: StreamBuilder<QuerySnapshot>(
//       stream: firestore.collection('user').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator(),
//
//           );
//         }
//
//         return buildData(snapshot);
//       },
//     ),
//   );
// }
//
//   buildData(AsyncSnapshot<QuerySnapshot> snapshot) {
//     return ListView.builder(
//         itemCount: snapshot.data.documents.length,
//         itemBuilder: (BuildContext context, int index) {
//           DocumentSnapshot document = snapshot.data.documents[index];
//           Map<String, dynamic> task = document.data;
//           return Center(
//             child:
//             Text(
//               task['username'],
//
//             ),
//           );
//         }
//     );
//   }
// }
}
