import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';

class ProgrammerInfoWidget extends StatelessWidget {
  const ProgrammerInfoWidget({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: AppBar(
        title: Text(
          context.aboutTheApplicationProgrammer,
          style: context.textStyles.bodyLarge.bold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(30.h),

            /// Avatar
            CircleAvatar(
              radius: 45.r,
              backgroundColor: context.colorsCustom.TealGreenSecondary
                  .withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 45.sp,
                color: context.colorsCustom.TealGreenSecondary,
              ),
            ),

            verticalSpace(16.h),

            /// Name
            Text(
              context.mosabShabat,
              style: context.textStyles.bodyLarge.bold.copyWith(
                fontSize: 22.sp,
                color: context.colorsCustom.TextPrimary,
              ),
            ),

            verticalSpace(8.h),

            /// Role
            Text(
              context.flutterProg,
              style: context.textStyles.bodyMedium.copyWith(
                fontSize: 16.sp,
                color: context.colorsCustom.TextSecondary,
              ),
            ),

            verticalSpace(20.h),

            /// Description
            Text(
              context.thisUpdateBy,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                fontSize: 15.sp,
                color: context.colorsCustom.TextSecondary,
              ),
            ),

            verticalSpace(30.h),

            /// Contact Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.colorsCustom.CardBackgroundLightGray,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  _ContactItem(
                    icon: Icons.email_outlined,
                    text: 'mosabshabat39@gmail.com',
                    onTap: () => _launchUrl('mailto:mosabshabat39@gmail.com'),
                  ),
                  Divider(height: 24.h),
                  _ContactItem(
                    icon: Icons.phone_outlined,
                    text: '+970 595 220 231',
                    onTap: () => _launchUrl('https://wa.me/970595220231'),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Footer
            Text(
              '© ${DateTime.now().year} ${context.allSave}',
              style: context.textStyles.bodySmall.copyWith(
                color: context.colorsCustom.TextSecondary,
              ),
            ),

            verticalSpace(16.h),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              Icon(icon, color: context.colorsCustom.TealGreenSecondary),
              horizontalSpace(12.w),
              Expanded(
                child: Text(
                  text,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
              ),
              Icon(
                Icons.open_in_new,
                size: 18.sp,
                color: context.colorsCustom.TextSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
