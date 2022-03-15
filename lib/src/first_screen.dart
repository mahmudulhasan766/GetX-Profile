

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:getx_profile/Language_Change/language_controller.dart';
import 'package:getx_profile/main.dart';

import 'counter.dart';

class First extends StatelessWidget {
  final controller=Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.snackbar("Hi", "I'm modern snackbar${box.read("read")}");
          },
        ),
        actions: [
          Obx(() => DropdownButton<String>(
              value: controller.locale.value,
              icon: Icon(Icons.arrow_downward_outlined),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                controller.updateLocale(newValue!);
              },
              items: controller.optionsLocales.entries.map((item) {
                return DropdownMenuItem<String>(
                  value: item.key,
                  child: Text(item.value['description']),
                );
              }).toList(),
            ),
          )
        ],
        title: Text("title".trArgs(['John']).tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
                init: Controller(),
                // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
                builder: (_) => Text(
                  'clicks: ${_.counter}',
                )),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed('/second');
              },
            ),
            ElevatedButton(
              child: Text('Change locale to English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<Controller>().increment();

            //Get.find<Controller>().putCount(_count)
          }),
    );
  }
}
