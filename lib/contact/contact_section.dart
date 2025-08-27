import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:regina_portfolio/contact/contact_provider.dart';
import 'package:regina_portfolio/contact/contact_validators.dart';
import 'package:regina_portfolio/utils/colors.dart';
import 'package:regina_portfolio/utils/constants.dart';
import 'package:regina_portfolio/utils/extensions.dart';
import 'package:regina_portfolio/utils/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobileTablet = context.isMobileOrTablet;
    final double spacing = isMobileTablet ? 32.0 : 64.0;

    final children = isMobileTablet
        ? [_ContactInfo(), SizedBox(height: spacing), _ContactForm()]
        : [
            Flexible(child: _ContactForm()),
            SizedBox(width: spacing),
            Flexible(child: _ContactInfo()),
          ];

    return MaxWidthBox(
      maxWidth: 1200,
      padding: EdgeInsets.symmetric(horizontal: isMobileTablet ? 18 : 32),
      child: ResponsiveRowColumn(
        layout: isMobileTablet
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        columnMainAxisSize: MainAxisSize.max,
        rowMainAxisSize: MainAxisSize.max,
        children: children
            .map((child) => ResponsiveRowColumnItem(child: child))
            .toList(),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    final isMobileTablet = context.isMobileOrTablet;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.8,
              child: Lottie.asset(
                Images.lottieJson,
                height: isMobileTablet ? 400 : 500,
              ),
            ),
          ),
          Text(
            ContactText.socialContact,
            style: AppTextStyles.regular(fontSize: isMobileTablet ? 16 : 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(url: Links.linkedIn, iconUrl: Images.linkedInIcon),
              SizedBox(width: 16),
              SocialIcon(url: Links.github, iconUrl: Images.githubIcon),
            ],
          ),
          if (!isMobileTablet) const SizedBox(height: 120),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.url, required this.iconUrl});

  final Uri url;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(context),
      mouseCursor: SystemMouseCursors.click,
      child: SvgPicture.asset(
        iconUrl,
        width: 32,
        height: 32,
        colorFilter: ColorFilter.mode(AppColors.primaryA10, BlendMode.srcIn),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context) async {
    try {
      if (!await launchUrl(url)) {
        if (context.mounted) {
          context.showErrorSnackBar('${ContactText.launchUrlError} $url');
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.showErrorSnackBar('${ContactText.launchUrlError} $url');
      }
    }
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
    final contactProvider = context.watch<ContactProvider>();
    final spacing = 20.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.tonalSurfaceA30),
      ),
      padding: EdgeInsets.all(context.isMobileOrTablet ? 16.0 : 32.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _ContactTextField(
              label: ContactText.nameLabel,
              hintText: ContactText.nameHint,
              controller: _nameController,
              validator: (value) => ContactValidators.validateName(value),
            ),
            SizedBox(height: spacing),
            _ContactTextField(
              label: ContactText.emailLabel,
              hintText: ContactText.emailHint,
              controller: _emailController,
              validator: (value) => ContactValidators.validateEmail(value),
            ),
            SizedBox(height: spacing),
            _ContactTextField(
              label: ContactText.messageLabel,
              hintText: ContactText.messageHint,
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
            if (contactProvider.errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                contactProvider.errorMessage!,
                style: TextStyle(color: AppColors.error, fontSize: 14),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _handleSendEmail(ContactProvider contactProvider) async {
    if (!_formKey.currentState!.validate()) return;

    final result = await contactProvider.sendMessage(
      name: _nameController.text,
      email: _emailController.text,
      message: _messageController.text,
    );

    if (!mounted) return;

    if (result.success) {
      clearControllers();
      context.showSuccessSnackBar(ContactText.successMessage);
    } else {
      context.showErrorSnackBar(result.error ?? ContactText.errorMessage);
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
        style: buttonStyle,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: contactProvider.isLoading
                ? _ButtonItemLoading()
                : _ButtonItem(),
          ),
        ),
      ),
    );
  }
}

class _ButtonItem extends StatelessWidget {
  const _ButtonItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ContactText.sendButtonText,
          style: AppTextStyles.bold(
            fontSize: context.isMobileOrTablet ? 14 : 16,
            color: AppColors.surfaceA0,
          ),
        ),
        Transform.translate(
          offset: const Offset(12, 0),
          child: Transform.rotate(
            angle: -0.5,
            child: const Icon(Icons.send, color: AppColors.surfaceA0, size: 24),
          ),
        ),
      ],
    );
  }
}

class _ButtonItemLoading extends StatelessWidget {
  const _ButtonItemLoading();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: AppColors.surfaceA0,
            strokeWidth: 2.4,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          ContactText.sendingMessage,
          style: AppTextStyles.bold(
            fontSize: context.isMobileOrTablet ? 14 : 16,
            color: AppColors.surfaceA0,
          ),
        ),
      ],
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
        Text(label, style: TextStyle(color: AppColors.primaryA10)),
        SizedBox(height: 12),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(color: AppColors.primaryA10),
          autofocus: true,
          cursorColor: AppColors.primaryA10,
          textInputAction: textInputAction,
          decoration: textFieldDecoration.copyWith(hintText: hintText),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
