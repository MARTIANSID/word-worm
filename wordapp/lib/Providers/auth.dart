// import 'dart:convert';
// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import './http_exception.dart';
// import 'package:http/http.dart' as http;

// class Auth with ChangeNotifier {
//   static const uurl = 'https://stuck.daxy.in/';
//   Future<bool> checkIfRegistered(String number) async {
//     try {
//       final response = await http.get('${uurl}user/isregistered/$number');
//       final responseBody = jsonDecode(response.body);
//       if (responseBody['error'] == true)
//         throw HttpException(responseBody['details']['message']);
//       // print('PP checkIfRegistered response: $responseBody');
//       return responseBody['registered'];
//     } on PlatformException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on FormatException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } catch (err) {
//       throw err;
//     }
//   }

//   bool isLogin = false;
//   String _accesstoken;
//   String _refreshtoken;
//   DateTime _refreshexpiryDate;
//   DateTime _accessexpriyDate;
//   String _number;
//   Timer _authTimer;
//   bool autoLogin = false;
//   bool remeberMe = true;
//   String password;
//   int once = 0;
//   bool flag = false;
//   void changeFlage(value) {
//     flag = value;
//   }

//   bool get isAuth {
//     return token != null;
//   }

//   void changeLog() {
//     isLogin = !isLogin;
//   }

//   void changeAuto() {
//     autoLogin = !autoLogin;
//   }

//   String get token {
//     if (_accessexpriyDate != null &&
//         _accessexpriyDate.isAfter(DateTime.now()) &&
//         _accesstoken != null) {
//       return _accesstoken;
//     }
//     return null;
//   }

//   String get number {
//     return _number;
//   }

//   Future<bool> resetPasswordRequest(String number) async {
//     try {
//       final response = await http
//           .post('${uurl}user/resetpasswordrequest', body: {"number": number});
//       final responseBody = json.decode(response.body);
//       // print(
//       // 'PP resetPasswordRequest body details message:${responseBody['details']}');
//       if (responseBody['error'] == true)
//         throw HttpException(responseBody['details']['message']);
//       else
//         return true;
//     } on PlatformException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } on FormatException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } catch (err) {
//       throw err;
//     }
//   }

//   Future<bool> checkOtp({number, code}) async {
//     try {
//       final response = await http.post('${uurl}user/resetpassword/checkcode',
//           body: {"number": number, "code": code});
//       final responseBody = json.decode(response.body);

//       if (responseBody['error'] == true)
//         throw HttpException(responseBody['details']['message']);
//       // print(responseBody['matches']);
//       return responseBody['matches'];
//     } on FormatException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on PlatformException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } catch (err) {
//       throw err;
//     }
//   }

//   Future<bool> resetPassword(String number, String otp, String password) async {
//     try {
//       final response = await http.patch('${uurl}user/resetpassword/',
//           body: {"code": "$otp", "password": "$password", "number": number});
//       final responseBody = json.decode(response.body);
//       // print('PP resetPassword body details message:$responseBody');
//       if (responseBody['error'] == true)
//         throw HttpException(responseBody['details']['message']);
//       else
//         return true;
//     } on FormatException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on PlatformException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } catch (err) {
//       throw err;
//     }
//   }

//   Future<void> authenticate(String number, String password, String urlSegment,
//       [String name]) async {
//     try {
//       final response = await http.post(
//         '$uurl$urlSegment',
//         body: name != null
//             ? {
//                 "fullName": name,
//                 "number": number,
//                 "password": password,
//               }
//             : {
//                 "number": number,
//                 "password": password,
//               },
//       );
//       final responseData = json.decode(response.body);

//       if (responseData['error'] != false) {
//         throw HttpException(responseData['details']['message']);
//       }
//       _accesstoken = name != null
//           ? responseData['details']['token']['access']['token']
//           : responseData['details']['token']['access']['token'];
//       _refreshtoken = name != null
//           ? responseData['details']['token']['referesh']['token']
//           : responseData['details']['token']['refresh']['token'];
//       _number = number;
//       // Map<String, dynamic> decodedToken = JwtDecoder.decode(_token);

//       _accessexpriyDate = DateTime.now().add(Duration(
//           seconds: name == null
//               ? responseData['details']['token']['access']['expiryin']
//               : responseData['details']['token']['access']['expiryin']));
//       _refreshexpiryDate = DateTime.now().add(Duration(
//           seconds: name == null
//               ? responseData['details']['token']['refresh']['expiryin']
//               : responseData['details']['token']['refresh']['expiryin']));
//       autoLogout();
//       notifyListeners();
//       final prefs = await SharedPreferences.getInstance();
//       final userData = json.encode(
//         {
//           'refreshtoken': _refreshtoken,
//           'accesstoken': _accesstoken,
//           'accessexpiryDate': _accessexpriyDate.toIso8601String(),
//           'refreshexpiryDate': _refreshexpiryDate.toIso8601String(),
//         },
//       );
//       prefs.setString('userData', userData);
//     } on FormatException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on PlatformException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } catch (error) {
//       throw error;
//     }
//   }

//   Future<void> resendOtp(number) async {
//     try {
//       final response = await http
//           .post('${uurl}user/resendmessagepassword', body: {"number": number});
//       final responseBody = json.decode(response.body);
//       // print('PP resetPassword body details message:$responseBody');
//       if (responseBody['error'] == true) {
//         throw HttpException(responseBody['details']['message']);
//       } else
//         return true;
//     } on FormatException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on PlatformException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } catch (err) {
//       throw err;
//     }
//   }

//   Future<void> userSignup(
//     String name,
//     String number,
//     String password,
//   ) async {
//     return authenticate(number, password, 'auth/signup', name);
//   }

//   Future<void> userLogin(String number, String password) async {
//     return authenticate(number, password, 'auth/login');
//   }

//   Future<bool> tryAutoLogin(context) async {
//     try {
//       print('in auto login again!!');
//       final prefs = await SharedPreferences.getInstance();
//       print(prefs.getString('userData'));

//       // print(
//       // 'PP in tryAutologinmethod result: ${prefs.containsKey('userData')}');
//       if (!prefs.containsKey('userData')) {
//         print('Returning False from autologin');
//         return false;
//       }
//       print('after return false');

//       final extractedUserData =
//           json.decode(prefs.getString('userData')) as Map<String, Object>;
//       final accessexpiryDate =
//           DateTime.parse(extractedUserData['accessexpiryDate']);
//       final refreshexpiryDate =
//           DateTime.parse(extractedUserData['refreshexpiryDate']);
//       // if (prefs.get('remberMe') != null) {
//       //   remeberMe = prefs.get('remberMe');
//       // }
//       remeberMe =
//           prefs.getBool('remberMe') == null ? true : prefs.getBool('remberMe');
//       _accesstoken = extractedUserData['accesstoken'];
//       _refreshtoken = extractedUserData['refreshtoken'];

//       if (remeberMe) {
//         await refresh(_accesstoken, _refreshtoken);
//         if (once == 0) {
//           autoLogin = true;
//           once++;
//         }
//         autoLogout();
//         return true;
//       } else {
//         if (accessexpiryDate.isBefore(DateTime.now())) {
//           return false;
//         }
//         if (remeberMe == false) {
//           _accessexpriyDate = accessexpiryDate;
//           _refreshexpiryDate = refreshexpiryDate;

//           autoLogin = true;

//           autoLogout();
//           notifyListeners();
//           return true;
//         }
//       }
//       return false;
//     } on FormatException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on PlatformException {
//       throw 'Something went wrong, I\'m unable to connect to our servers. Try again!';
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } catch (err) {
//       throw err;
//     }
//   }

//   Future<void> setRemeber(value) async {
//     final prefs = await SharedPreferences.getInstance();
//     remeberMe = value;
//     prefs.setBool('remberMe', value);
//   }

//   Future<void> logout({context}) async {
//     _accesstoken = null;
//     _refreshtoken = null;

//     _number = null;
//     _refreshexpiryDate = null;
//     _accessexpriyDate = null;

//     if (_authTimer != null) {
//       _authTimer.cancel();
//       _authTimer = null;
//     }

//     final prefs = await SharedPreferences.getInstance();
//     remeberMe = false;
//     prefs.remove('userData');
//     prefs.remove('remberMe');
//     prefs.remove('count');
//     prefs.remove('sort');
//     notifyListeners();
//   }

//   void autoLogout({context}) async {
//     if (_authTimer != null) {
//       _authTimer.cancel();
//     }

//     final int timeToExpiry =
//         _accessexpriyDate.difference(DateTime.now()).inSeconds;
//     print(timeToExpiry.toString() + 'TIMEFOREXPIRY');

//     _authTimer = Timer(Duration(seconds: timeToExpiry - 2), () async {
//       final prefs = await SharedPreferences.getInstance();
//       remeberMe =
//           prefs.getBool('remberMe') == null ? true : prefs.getBool('remberMe');
//       if (remeberMe) {
//         _accesstoken = null;
//         _refreshtoken = null;

//         final extractedUserData =
//             json.decode(prefs.getString('userData')) as Map<String, Object>;
//         String accesstoken = extractedUserData['acesstoken'];
//         String refreshtoken = extractedUserData['refreshtoken'];

//         await refresh(accesstoken, refreshtoken);
//       } else {
//         print('started logout!!!');
//         logout();
//       }
//     }
//         // remeberMe
//         //     ? () async {
//         //         _token = null;
//         //         final prefs = await SharedPreferences.getInstance();
//         //         final extractedUserData = json
//         //             .decode(prefs.getString('userData')) as Map<String, Object>;
//         //         String number = extractedUserData['number'];
//         //         String password = extractedUserData['password'];
//         //         print('started!!!!');
//         //         await authenticate(number, password, 'user/login');
//         //       }
//         //     : () {
//         //         logout(context: context);
//         //       });
//         );

//     notifyListeners();
//   }

//   Future<void> refresh(at, rt) async {
//     try {
//       final response = await http.post("${uurl}/auth/refresh", headers: {
//         'Authorization': 'Bearer ' + at
//       }, body: {
//         "refresh": rt,
//       });
//       final responseData = json.decode(response.body);
//       _accesstoken = responseData['details']['token']['access']['token'];

//       _refreshtoken = responseData['details']['token']['referesh']['token'];
//       // Map<String, dynamic> decodedToken = JwtDecoder.decode(_token);

//       _accessexpriyDate = DateTime.now().add(Duration(
//           seconds: responseData['details']['token']['access']['expiryin']));

//       _refreshexpiryDate = DateTime.now().add(Duration(
//           seconds: responseData['details']['token']['refresh']['expiryin']));

//       autoLogout();
//       notifyListeners();
//       final prefs = await SharedPreferences.getInstance();
//       final userData = json.encode({
//         'refreshtoken': _refreshtoken,
//         'accesstoken': _accesstoken,
//         'accessexpiryDate': _accessexpriyDate.toIso8601String(),
//         'refreshexpiryDate': _refreshexpiryDate.toIso8601String(),
//       });
//       prefs.setString('userData', userData);
//     } catch (err) {
//       throw err;
//     }
//   }

//   Future<bool> getPassword() async {
//     final prefs = await SharedPreferences.getInstance();

//     if (!prefs.containsKey('userData')) {
//       return false;
//     }
//     final extractedUserData =
//         json.decode(prefs.getString('userData')) as Map<String, Object>;
//     password = extractedUserData['password'];

//     return true;
//   }

//   Future<void> sendPlayerId({context, playerId}) async {
//     try {
//       final response = await http.post("${uurl}/user/playerid",
//           headers: {
//             'Authorization':
//                 'Bearer ' + Provider.of<Auth>(context, listen: false).token,
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: json.encode({"notifid": playerId}));

//       final responseData = json.decode(response.body);
//       print(responseData);
//       if (responseData['error']) {
//         throw HttpException(responseData['details']['message']);
//       }
//     } on FormatException {
//       throw "Oops Something Went Wrong!";
//     } on PlatformException {
//       throw "Oops Something Went Wrong!";
//     } on SocketException {
//       throw 'No Internet Connection! Please connect to Internet.';
//     } catch (err) {
//       throw err;
//     }
//   }
// }
