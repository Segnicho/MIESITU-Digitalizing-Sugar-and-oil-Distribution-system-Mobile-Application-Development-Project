import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;

class Student {
  String baseUrl = "http://127.0.0.1:7000/api/login/";
  Future<List> getAllStudent() async {
    // print(baseUrl);

    Map data = {
      "username": "iiiiuvndjsfbvdssenajkfrname",
      "email": "wwwwdamemdsfsdailch@gmail.com",
      "first_name": "firsqwtnamed",
      "last_name": "lastcdnamedd",
      "password": "uyseffe3dnjkf123123",
      "password2": "uyseffe3dnjkf123123",
      // "cust_img": ""
    };
    Map logind = {"email": "sanvfdyii@gmail.com", "password": "0987654fkfj321"};

    try {
      var response = await http.post(Uri.parse(baseUrl),
          // body: {
          //   "id": "8",
          //   "announcement_subject": "updaaaaaaaaaattefjkdsfTo call for the sibseba",
          //   "announcement_body":
          //       "upppppppdateeeeeecnsdkjfn,Sibsebaw lay as soon as possible tegegnu."
          // }

          body: data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
