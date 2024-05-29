import 'dart:convert';
import 'dart:developer';

import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health_menu/models/login_model.dart';
import 'package:cometchat_sdk/models/user.dart' as CometUser;
import 'package:flutter_health_menu/models/register_account_model.dart';
import 'package:flutter_health_menu/models/register_member_model.dart';
import 'package:flutter_health_menu/models/member_model.dart';
import 'package:flutter_health_menu/repositories/member_repository.dart';
import 'package:get/get.dart';

import '../config/constants.dart';

class RegisterMemberController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController goalIDController;
  late TextEditingController dietaryPreferenceIDController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController targetWeightController;
  late TextEditingController activityLevelID;

  var fullname = '';
  var email = '';
  var password = '';
  var rePassword = '';
  var errorString = ''.obs;
  var isLoading = true.obs;
  var registeredMember = MemberModel().obs;

  @override
  void onInit() {
    super.onInit();
    goalIDController = TextEditingController();
    dietaryPreferenceIDController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    targetWeightController = TextEditingController();
    activityLevelID = TextEditingController();
    // genderValue = 'Male';
  }

  @override
  void onClose() {
    goalIDController.dispose();
    dietaryPreferenceIDController.dispose();
    heightController.dispose();
    weightController.dispose();
    targetWeightController.dispose();
    activityLevelID.dispose();
    super.onClose();
  }

  String? validateHeight(String value) {
    if (value.isEmpty || value.length < 10) {
      return "Height is invalid";
    }
    return null;
  }

  String? validateWeight(String value) {
    if (value.isEmpty || value == null) {
      return "Weight is invalid";
    }
    return null;
  }

  // String? validateWeight (String value) {
  //   if (value.isEmpty || value == null) {
  //     return "TargetWeight can't be empty";
  //   } 
  //   // else if (value.length < 6) {
  //   //   return "Password have at least 6 words.";
  //   // }
  //   return null;
  // }

  String? validateActivityLevelID(String value) {
    if (value.isEmpty || value == null) {
      return "Weight is invalid";
    }
    return null;
  }


  Future<String?> registerMember(BuildContext context) async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    registerFormKey.currentState!.save();
    // Alert.showLoadingIndicatorDialog(context);

    RegisterMemberModel registerMember = RegisterMemberModel(
      goalId: int.parse(goalIDController.text),
      dietaryPreferenceId: int.parse(dietaryPreferenceIDController.text),
      height: int.parse(heightController.text),
      weight: int.parse(weightController.text),
      targetWeight: int.parse(targetWeightController.text),
      activityLevelId: int.parse(activityLevelID.text),
    );

    var response = await MemberRepository.registerMember(
        registerMemberToJson(registerMember), 'api/member/createNew');
    var data = json.decode(response);
    log('regsiter controller response: ${response.toString()}');
    // print('user: ${registerUser}');
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Account created!')));
    MemberModel currentMember = MemberModel.fromJson(data);
    // loginController.loginedUser.value = currentUser;
    // await registerComet(currentMember);
    // var data = json.decode(response.toString());

    // registeredUser.value = UserModel.fromMap(data);
    errorString.value = '';

    isLoading.value = false;
  }

  // Future<void> registerComet(MemberModel member) async {
  //   CometChat.createMember(
  //     CometUser.User(
  //       name: user.fullname!,
  //       uid: user.userId!.toString(),
  //       // avatar: user.avatarUrl,
  //     ),
  //     cometAuthKey,
  //     onSuccess: (message) {
  //       debugPrint('Register successfully: $message');
  //     },
  //     onError: (CometChatException ce) {
  //       debugPrint('Create user failed: ${ce.message}');
  //     },
  //   );
  // }
}
