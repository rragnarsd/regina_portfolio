class ContactResult {
  final bool success;
  final String? error;

  ContactResult({required this.success, this.error});
}

class ContactModel {
  final String serviceId;
  final String templateId;
  final String userId;
  final String name;
  final String email;
  final String message;

  ContactModel({
    required this.serviceId,
    required this.templateId,
    required this.userId,
    required this.name,
    required this.email,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
    'service_id': serviceId,
    'template_id': templateId,
    'user_id': userId,
    'template_params': {
      'from_name': name,
      'from_email': email,
      'message': message,
    },
  };
}
