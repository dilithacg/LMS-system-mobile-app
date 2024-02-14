import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MarksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('mark').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${doc['marks']}'+'%'),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  title: Text(doc.id),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lecturer Name: "+doc['instructor']),
                    
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
