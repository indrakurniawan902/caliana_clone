import 'dart:io';

import 'package:caliana_clone/screen/components/button.dart';
import 'package:caliana_clone/screen/identity/review_data_argument.dart';
import 'package:flutter/material.dart';

class ReviewData extends StatefulWidget {
  const ReviewData({super.key});

  @override
  State<ReviewData> createState() => _ReviewDataState();
}

class _ReviewDataState extends State<ReviewData> {
  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as ReviewDataArgument;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ReviewDataArgument;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Konfirmasi Data",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kartu identitas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            formData(args.name, Icons.card_giftcard),
            const SizedBox(height: 30),
            const Text("Nomor Kartu identitas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(height: 10),
            formData(args.identityCardNumber!, Icons.card_giftcard),
            const SizedBox(height: 30),
            const Text("Nomor Kartu akses",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(height: 10),
            formData(args.accessCardNumber!, Icons.card_giftcard),
            const SizedBox(height: 30),
            Image.file(File(args.filePathCard)),
            const SizedBox(height: 30),
            Image.file(File(args.selfiePath)),
            const SizedBox(height: 30),
            const Text("nama",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(height: 10),
            formData(args.name, Icons.person),
            const SizedBox(height: 30),
            const Text("email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(height: 10),
            formData(args.email, Icons.email),
            const SizedBox(height: 20),
            Button(
                onPressed: () {},
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                height: 50,
                width: double.infinity,
                textButton: "Check in",
                sideColor: Colors.blue),
            const SizedBox(height: 10),
            Button(
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                height: 50,
                width: double.infinity,
                textButton: "Batal",
                sideColor: Colors.blue),
          ],
        ),
      ),
    );
  }
}

Widget formData(String value, IconData icon) {
  return TextFormField(
    readOnly: true,
    initialValue: value,
    decoration: InputDecoration(
      prefix: Container(
          margin: const EdgeInsets.only(right: 20), child: Icon(icon)),
    ),
  );
}
