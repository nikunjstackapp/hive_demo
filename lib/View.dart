import 'package:flutter/cupertino.dart';
import 'package:hive_demo/database.dart';
import 'package:flutter/material.dart';
import 'database/contact/data.dart';
import 'home.dart';

class ViewScreen extends StatefulWidget {
  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  List<Data>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Database.instance.getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("view")),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              actions: [
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text("Name : ${data![index].name}")),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text("Contact : ${data![index].contact}")),
                              ],
                            );
                          },
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(data![index].name),
                          subtitle: Text(data![index].contact),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Database.instance.deleteData(index);
                                    data = Database.instance.getData();

                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return MyApp(data![index]);
                                      },
                                    ));
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.edit))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: data!.length),
            ],
          ),
        ));
  }
}
