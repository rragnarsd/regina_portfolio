import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:regina_portfolio/models/contact_model.dart';
import 'package:regina_portfolio/utils/constants.dart';
import 'package:regina_portfolio/utils/emailjs_config.dart';

class ContactProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  final String serviceId;
  final String templateId;
  final String userId;

  ContactProvider()
    : serviceId = emailJsService,
      templateId = emailJsTemplate,
      userId = emailJsUser {
    if (serviceId.isEmpty || templateId.isEmpty || userId.isEmpty) {
      throw Exception('EmailJS environment variables are missing.');
    }
  }

  Future<ContactResult> sendMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    setIsLoading(true);
    setErrorMessage(null);

    final body = ContactModel(
      serviceId: serviceId,
      templateId: templateId,
      userId: userId,
      name: name,
      email: email,
      message: message,
    );

    try {
      final url = Links.messageUrl;
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body.toJson()),
      );

      if (response.statusCode == 200) {
        return ContactResult(success: true);
      } else {
        String? errorMessage;
        try {
          final jsonBody = jsonDecode(response.body);
          errorMessage = jsonBody['error'] ?? response.body;
        } catch (_) {
          errorMessage = response.body;
        }

        setErrorMessage(errorMessage);
        return ContactResult(success: false, error: errorMessage);
      }
    } catch (error) {
      final errMsg = 'Error sending email: $error';
      setErrorMessage(errMsg);
      return ContactResult(success: false, error: errMsg);
    } finally {
      setIsLoading(false);
    }
  }
}
