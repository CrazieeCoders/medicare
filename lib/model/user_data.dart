import 'dart:io';
import 'dart:ui';

class UserData{

  final String requestFirstName;
  final String requestLastName;
  final String designation;
  final String institution;
  final String department;
  final String addr1;
  final String addr2;
  final String state;
  final String city;
  final String zip;
  final String phonenumber;
  final String faxNumber;
  final String email;
  final List<String> products;
  final String description;
  final String checkOne;
  final String patientName;
  final String dob;
  final String gender;
  final String dor;
  final List<String> methodOfResponse;
  final String image;
  final String representativeName;
  final String representativeType;
  final String represNumber;
  final String countryCode;
  final String telePhone;



  UserData({required this.representativeName, required this.representativeType, required this.represNumber,
  required this.countryCode, required this.telePhone,required this.products, required this.description, required this.checkOne,
    required this.patientName, required this.dob, required this.gender,
    required this.dor, required this.methodOfResponse, required this.image, required this.requestFirstName,
    required this.requestLastName, required this.designation, required this.institution,
    required this.department, required this.addr1, required this.addr2,
    required this.state, required this.city, required this.zip,
    required this.phonenumber, required this.faxNumber, required this.email});


}