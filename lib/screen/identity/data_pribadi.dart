import 'package:caliana_clone/screen/components/button.dart';
import 'package:caliana_clone/screen/components/custom_textfield.dart';
import 'package:caliana_clone/screen/identity/data_pribadi_argumet.dart';
import 'package:caliana_clone/screen/identity/selfie_argument.dart';
import 'package:flutter/material.dart';

class DataPribadi extends StatefulWidget {
  const DataPribadi({super.key});

  @override
  State<DataPribadi> createState() => _DataPribadiState();
}

class _DataPribadiState extends State<DataPribadi> {
  @override
  Widget build(BuildContext context) {
    TextEditingController noIdentitasController = TextEditingController();
    TextEditingController noKartuAccessController = TextEditingController();
    TextEditingController namaController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    final args =
        ModalRoute.of(context)!.settings.arguments as DataPribadiArgument;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulir Registrasi",
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text("1 -- 2")),
            const SizedBox(height: 10),
            const Center(child: Text("Data Pribadi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18), )),
            const SizedBox(height: 40),
            const Row(
              children: [
                Text("Nomor Kartu Identitas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                Text(" (tidak wajib diisi)",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 14,color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 7),
            CustomTextfield(
              controller: noIdentitasController,
              hintText: "Masukan Nomor Kartu Identitas",
              isNumber: true,
              icon: Icons.card_giftcard,
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                Text("Nomor Kartu Akses",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                Text(" (tidak wajib diisi)",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 14,color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 7),
            CustomTextfield(
              controller: noKartuAccessController,
              hintText: "Masukan Nomor Kartu Identitas",
              isNumber: true,
              icon: Icons.card_giftcard,
            ),
            const SizedBox(height: 30),
            const Text("Nama",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            const SizedBox(height: 7),
            CustomTextfield(
              controller: namaController,
              hintText: "Nama",
              isNumber: false,
              icon: Icons.person,
            ),
            const SizedBox(height: 30),
            const Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            const SizedBox(height: 7),
            CustomTextfield(
              controller: emailController,
              hintText: "Email",
              isNumber: false,
              icon: Icons.email,
            ),
            const SizedBox(height: 30),
            Button(
                onPressed: () {
                  Navigator.pushNamed(context, "/selfie",
                      arguments: SelfieArgument(
                          cardName: args.cardName,
                          filePathCard: args.filePath,
                          name: namaController.text,
                          email: emailController.text,
                          accessCardNumber: noKartuAccessController.text,
                          identityCardNumber: noIdentitasController.text));
                },
                height: 45,
                width: double.infinity,
                textButton: "Selanjutnya",
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                isDisable: false,
                sideColor: Colors.blue),
            const SizedBox(height: 20),
            Button(
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                height: 45,
                textColor: Colors.blue,
                width: double.infinity,
                textButton: "Batal",
                isDisable: false,
                sideColor: Colors.blue),
          ],
        ),
      ),
    );
  }
}
