import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String selectedDate = 'Event Date';
  String selectedTime = 'Start Time';
  String selectedTimeEnd = 'End Time';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Create Public Event',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365 * 2),
                    ),
                  ).then((value) {
                    selectedDate =
                        "${value?.year ?? 0}.${value?.month ?? 0}.${value?.day ?? 0}";
                    setState(() {});
                  });
                },
                decoration: InputDecoration(
                  hintText: selectedDate,
                  border: const OutlineInputBorder(),
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    selectedTime =
                        "${value?.hour ?? TimeOfDay.now().hour} : ${value?.minute ?? TimeOfDay.now().minute}";
                    setState(() {});
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: selectedTime,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    selectedTimeEnd =
                        "${value?.hour ?? TimeOfDay.now().hour} : ${value?.minute ?? TimeOfDay.now().minute}";
                    setState(() {});
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: selectedTimeEnd,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Venue',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        width: 310,
                        height: 377,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: const Center(
                                  child: Text(
                                "😉",
                                style: TextStyle(fontSize: 40),
                              )),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            const Text(
                              "Submited",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Submit event'),
            ),
            
          ],
        ),
      ),
    );
  }
}
