import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_ornek/language.dart';
import 'package:getx_ornek/ayarlar.dart';
import 'package:getx_ornek/sayfa2.dart';

Future<void> main() async {
  //getstorage için bunu yazıyoruz
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//ThemeData tema1 = ThemeData();

class _MyAppState extends State<MyApp> {
  var ayarlar = Get.put(Ayarlar());
  var _txtc = TextEditingController();
  late GetStorage gs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gs = GetStorage();
    String sehirdata = gs.read('sehir') ?? 'Ankara';
    _txtc.text = sehirdata;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations:Messages(),
      locale:Get.deviceLocale,
      theme:ThemeData.light().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      darkTheme:ThemeData.dark(),     
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Getx Ornegi'),
              centerTitle: true,
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('hello'.tr),
                OutlinedButton(
                  onPressed:() {
                    //temayı degiştirdiğimizde dil de değişiyor
                    Get.updateLocale(Locale('en', 'US'));
                    Get.changeTheme(ThemeData.dark());
                    }, 
                   child: Text('Karanlık Mod')),
                TextField(
                  controller:_txtc,
                  decoration:const InputDecoration(
                    label:Text('Şehir ismi girin'),

                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () {
                    gs.write('sehir',_txtc.text);

                    
                  }, child: const Text('Kaydet')),
                ),
                Obx(() => Text("Dosyaya yazilmayan: " + ayarlar.sayac.toString())),
                Obx(() => Text("Dosyaya yazilan: " + ayarlar.sayacDinamik.value.toString())),//getstorage için  kullandıgımız 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        ayarlar.arttir();
                      },
                      child: const Text('sayac +')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Sayfa2());
                      },
                      child: const Text('Sayfa2 ye git')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed:() {
                    Get.snackbar('Test','Snackbar butonuna basildi',snackPosition:SnackPosition.TOP,duration:const Duration(seconds: 1));
                  }, child:const Text('Snackbar')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed:() {
                    Get.defaultDialog(title:'Test',middleText:'Alert butonuna basildi');
                  }, child:const Text('Alert')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed:() {
                    Get.bottomSheet(const Sayfa2());
                  }, child:const Text('Bottomsheet')),
                ),
              ],
            ))));
  }
}
