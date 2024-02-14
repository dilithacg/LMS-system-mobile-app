import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25.0),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.purple,
            child: Text(
              'schedules',
              style: TextStyle(color: Colors.white),
            ),
          ),
         SizedBox(
  width: 100,
  child: Image.asset(
    'assets/res/1.png',
    width: 200,
  ),
),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('schedules')
                  .snapshots(),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.schedule,
                          color: Colors.purple,
                        ),
                        title: Text(doc.id),
                        subtitle: Text(
                            'Date: ${doc['date']} | Time: ${doc['time']} | Instructor: ${doc['instructor']}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
