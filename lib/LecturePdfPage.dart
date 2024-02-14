import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'pdf_view_page.dart';

class LectureMaterialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('lecture').snapshots(),
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfViewPage(
                          url: doc['url'],
                          title: doc.id,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.purple,
                    ),
                    title: Text(doc.id),
                    subtitle: Text(doc['chapter'] + ' - ' + doc['topic']),
                    trailing: Icon(
                      Icons.download_rounded,
                      color: Colors.purple,
                    ),
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
