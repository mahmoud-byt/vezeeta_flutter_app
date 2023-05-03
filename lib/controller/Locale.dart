import 'package:get/get.dart';

class MyLocale implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'ar':{
      "1":"كشف عيادة",
      "2":"صيدلية",
      "3":"مكالمة دكتور",
      "4":"زيارة منزلية",
      "5":"احجز كشف عيادة",
      "6":"ابحث بالتخصص , اسم الدكتور ,او المستشفى",
      "7":"اطلب ادوية",
      "8":"ما الذى تبحث عنه",
    },
    'en':{
      "1":'Clinic Visit',
      "2":'Pharmacy',
      "3":'Doctor Call',
      "4":'Home Visit',
      "5":"Book Clinic Appointment",
      "6":"Search for Speciality,Doctor or Hospital",
      "7":"Order Medicines",
      "8":"What are you looking for ?",
    }
  };

}