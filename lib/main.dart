import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_profile/src/first_screen.dart';
import 'Language_Change/datastorage_service.dart';
import 'Language_Change/language_controller.dart';
import 'Language_Change/language_translation.dart';
import 'bindings/init_bindings.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialConfig();
  runApp(MyApp());
}
Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
  // DBService, ...
}

final box=GetStorage();


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final storage = Get.find<StorageService>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: storage.languageCode != null
          ? Locale(storage.languageCode!, storage.countryCode)
          : Locale('pt', 'BR'), // Not Get.deviceLocale
      fallbackLocale: Locale('en', 'US'),
      initialRoute: '/home',
      getPages: [GetPage(name: '/home', page: () => First())],
      initialBinding: InitialBinding(),
    );
  }
}




class Home extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${'hello'.tr}"),
        //actions: [LanguageMenu()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("${'welcome'.tr}")),
          SizedBox(height: 32),
          LanguageDropDown(),
        ],
      ),
    );
  }
}



class LanguageDropDown extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => DropdownButton<String>(
        value: controller.locale.value,
        icon: Icon(Icons.arrow_downward),
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
    );
  }
}

// class LanguageMenu extends GetView<LanguageController> {
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       icon: Icon(Icons.language),
//       offset: Offset(0, 30),
//       itemBuilder: (context) => controller.optionsLocales.entries.map((item) {
//         return PopupMenuItem(
//           value: item.key,
//           child: Text(item.value['description']),
//         );
//       }).toList(),
//       // onSelected: (newValue) {
//       //   controller.updateLocale(newValue);
//       // },
//     );
//   }
// }


