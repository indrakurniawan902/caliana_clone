import 'dart:async';

import 'package:caliana_clone/screen/components/chip.dart';
import 'package:caliana_clone/screen/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  int _selectedStatus = 0;
  final List<String> chip = [
    "Semua Fitur",
    "Visitior Management System",
    "Access Control System",
  ];
  final DateTime time = DateTime.now();
  Timer? timer;
  updatetimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {});
      },
    );
  }

  String timeNow() {
    String am = DateFormat('a').format(time);
    return "${DateFormat('hh').format(DateTime.now())}:${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute}:${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second} $am";
  }

  @override
  void initState() {
    updatetimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(DateFormat('EEEE, dd MMMM yyyy').format(time),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(timeNow(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const SizedBox(height: 45),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: CustomTextfield(
                      controller: searchController,
                      icon: Icons.search,
                      hintText: "Cari",
                      isNumber: false)),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Fitur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 35,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ChipText.action(
                            onPressed: () {
                              setState(() {
                                _selectedStatus = index;
                              });
                            },
                            selectedIndex: _selectedStatus == index,
                            color: Colors.white,
                            height: 29,
                            title: chip[index],
                            textColor: Colors.grey[900],
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                          );
                        },
                        itemCount: chip.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset('assets/icons/monitoring.svg',
                                height: 35,
                                width: 35,
                                colorFilter: const ColorFilter.mode(
                                    Colors.grey, BlendMode.srcIn),
                                semanticsLabel: 'A red up arrow'),
                            const Text("Dasbor")
                          ],
                        ),
                        _selectedStatus == 0 || _selectedStatus == 1
                            ? Column(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/person_book.svg',
                                      height: 35,
                                      width: 35,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.grey, BlendMode.srcIn),
                                      semanticsLabel: 'A red up arrow'),
                                  const Text("Daftar"),
                                  const Text("Pengunjung")
                                ],
                              )
                            : const SizedBox.shrink(),
                        _selectedStatus == 0 || _selectedStatus == 1
                            ? const Column(
                                children: [
                                  Icon(
                                    Icons.house_outlined,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                  Text("Residen")
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text("Hari ini",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Text("Tidak Ada Pengunjung",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    const Text("Daftar pengunjung akan ditampilkan disini"),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          side:
                              const BorderSide(width: 1.5, color: Colors.blue),
                          textStyle: const TextStyle(color: Colors.blue)),
                      child: const Text("Refresh"),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
