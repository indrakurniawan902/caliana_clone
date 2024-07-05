import 'package:caliana_clone/screen/components/button.dart';
import 'package:caliana_clone/screen/identity/identity_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller = _controller;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> identitas = ["E-Ktp", "SIM", "Paspor", "Lainnya"];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pilih Kartu identitas",
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
        backgroundColor: const Color(0xFFF5F5F5),
        body: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(top: 50),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 2,
              crossAxisCount: 2,
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 15.0,
            ),
            itemCount: identitas.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 3) {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: 200,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(height: 10),
                                const Center(
                                  child: Text(
                                    'Masukan Kartu Identitas Lainnya',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                const Divider(),
                                const Text(
                                  'Masukan Kartu Identitas Lainnya',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _controller,
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Button(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      textColor: Colors.blue,
                                      sideColor: Colors.blue,
                                      height: 40,
                                      width: 150,
                                      textButton: "Batal",
                                    ),
                                    Button(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/identity",
                                            arguments: IdentityArgument(
                                                identityName:
                                                    _controller.text));
                                      },
                                      isDisable: _controller.text.isEmpty
                                          ? true
                                          : false,
                                      textColor: Colors.white,
                                      sideColor: Colors.blue,
                                      backgroundColor: Colors.blue,
                                      height: 40,
                                      width: 150,
                                      textButton: "Selanjutnya",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    Navigator.pushNamed(context, "/identity",
                        arguments:
                            IdentityArgument(identityName: identitas[index]));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/id_card.svg',
                        height: 24,
                        width: 24,
                        // ignore: deprecated_member_use
                        color: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      Text(identitas[index]),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
