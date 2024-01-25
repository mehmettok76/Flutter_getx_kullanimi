import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Ayarlar extends GetxController{
  var sayac = 15.obs;
  Rx<int> sayacDinamik = Rx(GetStorage().read('sayacDosya') ?? 15);
  void arttir(){
    sayac++;
    sayacDinamik.value++;//ramda artıyor
    GetStorage().write('sayacDosya',sayacDinamik.value);//dosyada artıyor
  }
}