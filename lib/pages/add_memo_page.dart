import 'package:flutter/material.dart';

class AddMemoPage extends StatefulWidget {
  const AddMemoPage({super.key});

  @override
  State<AddMemoPage> createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("メモ追加"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text("Title"),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            const SizedBox(height: 40),
            const Text("Detail"),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: detailController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
