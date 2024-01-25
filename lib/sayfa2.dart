import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ornek/ayarlar.dart';
class Sayfa2 extends StatefulWidget {
  const Sayfa2({super.key});

  @override
  State<Sayfa2> createState() => _Sayfa2State();
}

class _Sayfa2State extends State<Sayfa2> {
  var ayarlar = Get.put(Ayarlar());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Sayfa 2'),
      ),
      body:Center(
        child:Column(
          children: [
            Obx(() => Text(ayarlar.sayac.toString()),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed:() {
                ayarlar.arttir();
              }, child: const Text('Sayac +')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
                Get.back();
              }, child: const Text('Geri')),
            )
          ],
        )
      )
    );
  }
}