import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends GetView<ControllerX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () {
                print("count1 rebuild");
                return Text('${controller.count1}');
              },
            ),
            Obx(
                  () {
                print("count2 rebuild");
                return Text('${controller.count2}');
              },
            ),
            Obx(() {
              print("sum rebuild");
              return Text('${controller.sum}');
            }),
            Obx(
                  () => Text('Name: ${controller.user.value?.name}'),
            ),
            Obx(
                  () => Text('Age: ${controller.user.value?.age}'),
            ),
            ElevatedButton(
              child: Text("Go to last page"),
              onPressed: () {
                Get.toNamed('/third', arguments: 'arguments of second');
              },
            ),
            ElevatedButton(
              child: Text("Back page and open snackbar"),
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'User 123',
                  'Successfully created',
                );
              },
            ),
            ElevatedButton(
              child: Text("Increment"),
              onPressed: () {
                controller.increment();
              },
            ),
            ElevatedButton(
              child: Text("Increment"),
              onPressed: () {
                controller.increment2();
              },
            ),
            ElevatedButton(
              child: Text("Update name"),
              onPressed: () {
                controller.updateUser();
              },
            ),
            ElevatedButton(
              child: Text("Dispose worker"),
              onPressed: () {
                controller.disposeWorker();
              },
            ),
          ],
        ),
      ),
    );
  }
}
