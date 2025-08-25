import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(32.0),
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
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://www.linkedin.com/in/reginaragnarsd/');
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          mouseCursor: SystemMouseCursors.precise,
          text:
              'For any project inquiry or for more\ninformation about what I do, please feel free\nto get in touch here or on ',
          style: TextStyle(fontSize: 18, color: Colors.grey),
          children: <TextSpan>[
            TextSpan(
              text: 'LinkedIn',
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await _launchUrl(url);
                },
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade800),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          _ContactTextField(label: 'Name', hintText: "John Smith"),
          SizedBox(height: 20),
          _ContactTextField(label: 'Email', hintText: "email@email.com"),
          SizedBox(height: 20),
          _ContactTextField(
            label: 'Message',
            hintText: "Your message",
            maxLines: 6,
          ),
          const SizedBox(height: 30),
          _ContactButton(),
        ],
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: const Text(
            "Send Message",
            style: TextStyle(color: Colors.black),
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
    this.maxLines = 1,
  });

  final String label;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white70),
            ),
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
