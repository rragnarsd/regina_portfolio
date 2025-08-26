import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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

  final serviceId = dotenv.env['SERVICE_ID'];
  final templateId = dotenv.env['TEMPLATE_ID'];
  final userId = dotenv.env['USER_ID'];

  Future<bool> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    setIsLoading(true);
    setErrorMessage(null);

    try {
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': name,
            'from_email': email,
            'message': message,
          },
        }),
      );

      if (response.statusCode == 200) {
        setIsLoading(false);
        return true;
      } else {
        setErrorMessage('Failed to send email. ${response.body}');
        setIsLoading(false);
        return false;
      }
    } catch (error) {
      setErrorMessage('Error sending email: $error');
      setIsLoading(false);
      return false;
    }
  }
}
