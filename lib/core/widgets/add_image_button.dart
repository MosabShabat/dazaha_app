import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/helpers/app_shared_methods.dart';

class AddImageButton extends StatelessWidget {
  final Function(ImageSource) onImageSelected;

  const AddImageButton({Key? key, required this.onImageSelected})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => AppSharedMethods.showImageSourceOptions(
          context: context,
          onImageSelected: onImageSelected,
          isCamera: false,
        ),
        child: Container(
          width: 100.w,
          height: 100.w,
          decoration: DottedDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.colorsCustom.CardBorder,
            shape: Shape.box,
          ),
          child: Center(
            child: SvgPicture.asset(AppAssets.svgs.gallery_add_icon),
          ),
        ),
      ),
    );
  }
}
