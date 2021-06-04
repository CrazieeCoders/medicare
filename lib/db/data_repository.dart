import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:medicare/model/user_data.dart';


class DataRepository {

  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  registerUser(UserData userData) async {
    try {
      userRef.add({
        'requester name':userData.requestFirstName,
        'requester last name':userData.requestLastName,
        'designation':userData.designation,
        'institution':userData.institution,
        'department':userData.department,
        'instituteAddr1':userData.addr1,
        'instituteAddr2':userData.addr2,
        'state':userData.state,
        'city':userData.city,
        'phoneNumber':userData.phonenumber,
        'faxNumber':userData.faxNumber,
        'email':userData.email,
         'chooseProduct':userData.products,
        'description':userData.department,
        'checkOne':userData.checkOne,
        'PatientName':userData.patientName,
        'dob':userData.dob,
        'gender':userData.gender,
        'dor':userData.dor,
        'modeOfRespose':userData.methodOfResponse,
        'image':userData.image,
        'represName':userData.representativeName,
        'represType':userData.representativeType,
        'represNum':userData.represNumber,
        'countryCode':userData.countryCode,
        'teleNum':userData.telePhone,
      });
    } on firebase_core.FirebaseException catch (e) {
      print('error :${e.message}');
    }
  }

}