import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_memo_app/model/memo.dart';
import 'package:flutter_firebase_memo_app/pages/add_edit_memo_page.dart';
import 'package:flutter_firebase_memo_app/pages/memo_detail_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key, required this.title});

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final memoCollection = FirebaseFirestore.instance.collection('memo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter x Firebase'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: memoCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('No Data.'));
            }

            final docs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    docs[index].data() as Map<String, dynamic>;
                final Memo fetchMemo = Memo(
                  id: docs[index].id,
                  title: data['title'],
                  detail: data['detail'],
                  createdDate: data['createdDate'],
                  updatedDate: data['updatedDate'],
                );

                return ListTile(
                  title: Text(fetchMemo.title),
                  trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: ((context) {
                            return SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddEditMemoPage(
                                              currentMemo: fetchMemo),
                                        ),
                                      );
                                    },
                                    leading: const Icon(Icons.edit),
                                    title: const Text('編集'),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('削除'),
                                  ),
                                ],
                              ),
                            );
                          }));
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemoDetailPage(memo: fetchMemo),
                      ),
                    );
                  },
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddEditMemoPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
