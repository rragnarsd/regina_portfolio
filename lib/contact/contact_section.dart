import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regina_portfolio/contact/contact_provider.dart';
import 'package:regina_portfolio/contact/contact_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileOrTablet =
        ResponsiveBreakpoints.of(context).isMobile ||
        ResponsiveBreakpoints.of(context).isTablet;

    final spacing = isMobileOrTablet ? 32.0 : 64.0;

    return MaxWidthBox(
      maxWidth: 1200,
      padding: EdgeInsets.symmetric(horizontal: isMobileOrTablet ? 18.0 : 32.0),
      child: ResponsiveRowColumn(
        layout: isMobileOrTablet
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        columnMainAxisSize: MainAxisSize.max,
        rowMainAxisSize: MainAxisSize.max,
        children: [
          ResponsiveRowColumnItem(
            child: isMobileOrTablet
                ? _ContactInfo()
                : Flexible(child: _ContactInfo()),
          ),
          ResponsiveRowColumnItem(
            child: SizedBox(
              width: isMobileOrTablet ? 0 : spacing,
              height: isMobileOrTablet ? spacing : 0,
            ),
          ),
          ResponsiveRowColumnItem(
            child: isMobileOrTablet
                ? _ContactForm()
                : Flexible(child: _ContactForm()),
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://www.linkedin.com/in/reginaragnarsd/');
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        mouseCursor: SystemMouseCursors.precise,
        text:
            'For any project inquiry or for more\ninformation about what I do, please feel free\nto get in touch here or on ',
        style: TextStyle(fontSize: 18, color: Colors.grey),
        children: <TextSpan>[
          TextSpan(
            text: 'LinkedIn',
            recognizer: TapGestureRecognizer()
              ..onTap = () async => await _launchUrl(url),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw Exception('Could not launch $url');
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobileOrTablet =
        ResponsiveBreakpoints.of(context).isMobile ||
        ResponsiveBreakpoints.of(context).isTablet;

    final contactProvider = context.watch<ContactProvider>();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade800),
      ),
      padding: EdgeInsets.all(isMobileOrTablet ? 16.0 : 32.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _ContactTextField(
              label: 'Name',
              hintText: "John Smith",
              controller: _nameController,
              validator: (value) => ContactValidators.validateName(value),
            ),
            SizedBox(height: 20),
            _ContactTextField(
              label: 'Email',
              hintText: "email@email.com",
              controller: _emailController,
              validator: (value) => ContactValidators.validateEmail(value),
            ),
            SizedBox(height: 20),
            _ContactTextField(
              label: 'Message',
              hintText: "Your message",
              maxLines: 6,
              controller: _messageController,
              validator: (value) => ContactValidators.validateMessage(value),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 30),
            _ContactButton(
              onPressed: contactProvider.isLoading
                  ? null
                  : () => _handleSendEmail(contactProvider),
            ),
            if (contactProvider.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  contactProvider.errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSendEmail(ContactProvider contactProvider) async {
    if (_formKey.currentState!.validate()) {
      final isSuccess = await contactProvider.sendEmail(
        name: _nameController.text,
        email: _emailController.text,
        message: _messageController.text,
      );

      if (isSuccess) {
        clearControllers();
        //TODO - Change snackbar color
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Email sent successfully!')));
        }
      } else {
        //TODO - Change snackbar color
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Failed to send email')));
        }
      }
    }
  }

  void clearControllers() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final contactProvider = context.watch<ContactProvider>();
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          padding: const EdgeInsets.all(16.0),
          disabledBackgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: contactProvider.isLoading
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2.4,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Sending...",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Send Message",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Transform.translate(
                      offset: const Offset(12, 0),
                      child: Transform.rotate(
                        angle: -0.5,
                        child: const Icon(
                          Icons.send,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _ContactTextField extends StatelessWidget {
  const _ContactTextField({
    required this.label,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.validator,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        SizedBox(height: 12),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(color: Colors.white),
          autofocus: true,
          cursorColor: Colors.white,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
            prefix: const Padding(padding: EdgeInsets.only(left: 16.0)),
            hintStyle: TextStyle(color: Colors.grey.shade700),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white70),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white70, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
