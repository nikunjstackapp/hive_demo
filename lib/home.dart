import 'package:flutter/material.dart';

import 'View.dart';
import 'database.dart';
import 'database/contact/data.dart';

class MyApp extends StatefulWidget {
  Data? contactData;

  MyApp([this.contactData]);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController officeController = TextEditingController();
  TextEditingController officeContactController = TextEditingController();
  TextEditingController dataController = TextEditingController();

  String? testData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.contactData != null) {
      nameController.text = widget.contactData!.name;
      contactController.text = widget.contactData!.contact;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Your Details"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.drive_file_rename_outline,
                    color: Colors.black,
                  ),
                  hintText: "Enter Name",
                  labelText: "Enter Name",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, bottom: 0),
              child: TextField(
                controller: contactController,
                maxLength: 10,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.contact_phone,
                    color: Colors.black,
                  ),
                  hintText: "Enter Contact",
                  labelText: "Enter Contact",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        String name, contact, office, officeContact;

                        name = nameController.text;
                        contact = contactController.text;
                        office = officeController.text;
                        officeContact = officeContactController.text;
                        if (widget.contactData != null) {
                          widget.contactData!.name = name;
                          widget.contactData!.contact = contact;
                          widget.contactData!.save();
                        } else {
                          print('name--> $name');
                          print('contact--> $contact');
                          Database.instance.addData(Data(name, contact));
                          //  PersonalData personal = PersonalData(office: office, contact: officeContact);
                        }
                        setState(() {});
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ViewScreen();
                        }));
                      },
                      child: const Text("Submit")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ViewScreen();
                        }));

                        setState(() {});
                      },
                      child: const Text("View")),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('For Single Data'),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 0, bottom: 10),
              child: TextField(
                controller: dataController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  hintText: "data",
                  labelText: "data",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String data;
                data = dataController.text;
                await Database.instance.addKeyValue('name', data);
                testData = await Database.instance.getKeyValue('name');

                print('data--> $data');
                setState(() {});
              },
              child: const Text("Submit"),
            ),
            ElevatedButton(
                onPressed: () async {
                  await Database.instance.deleteKeyValue('name');
                  testData = await Database.instance.getKeyValue('name');

                  setState(() {});
                },
                child: const Text("Delete")),
            Text(testData ?? ''),

          ],
        ),
      ),
    );
  }
}
