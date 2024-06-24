import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController signinEmailController = TextEditingController();
  TextEditingController signinPasswordController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerPasswordConfirmController =
      TextEditingController();

  // HttpAuth auth = HttpAuth();

  // login(String user, String password) async {
  //   final http.Response response = await http.post(
  //     Uri.parse('https://dummyjson.com/auth/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode({'username': user.trim(), 'password': password.trim()}),
  //   );
  //   print(response.body);
  //   return response;
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
}
