
import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:findjobs/model/network.dart';
import '../navigation/navigation.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchjobmodels(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 32, left: 16, right: 16 ,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: (
                                  snapshot.data[index].companyLogo == null)?null:NetworkImage(snapshot.data[index].companyLogo),
                            ),
                            Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              snapshot.data[index].location,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600
                              ),
                            ),
                            Text(
                              snapshot.data[index].companyUrl,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600
                              ),
                            ),
                            Link(
                              child:
                              Text(
                                'Cara Lamar Pekerjaan',
                                style: TextStyle(
                                  decoration: TextDecoration.underline, // add add underline in text
                                ),),
                              url: snapshot.data[index].howToApply,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else if (snapshot.hasError){
              return Container(
                child: Center(child: Text('Not Found Data')),
              );
            } else{
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },

        ),

      ),

    );
  }
}
