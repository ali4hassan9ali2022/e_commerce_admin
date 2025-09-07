import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_admin/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePickerDialogEdit extends StatelessWidget {
  const CustomImagePickerDialogEdit({super.key, required this.addProduct});
  final EditProductCubit addProduct;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Center(
        child: Text(
          "Choose options",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
            style: ElevatedButton.styleFrom(
              iconColor: Colors.blueAccent,
              iconSize: 30,
            ),
            onPressed: () async {
              await ImagePicker()
                  .pickImage(source: ImageSource.camera)
                  .then((value) => addProduct.uploadProfilePic(value!));
              GoRouter.of(context).pop();
            },
            label: Text(
              "Camera",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            icon: Icon(Icons.camera),
          ),
          TextButton.icon(
            style: ElevatedButton.styleFrom(
              iconColor: Colors.blueAccent,
              iconSize: 30,
            ),
            onPressed: () async {
              await ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) => addProduct.uploadProfilePic(value!));
              GoRouter.of(context).pop();
            },
            label: Text(
              "Gallery",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            icon: Icon(FontAwesomeIcons.image),
          ),
          TextButton.icon(
            style: ElevatedButton.styleFrom(
              iconColor: Colors.blueAccent,
              iconSize: 30,
            ),
            onPressed: () async {
              if (addProduct.imagePicker != null) {
                await addProduct.removeProfilePic();
                GoRouter.of(context).pop();
                CustomToastWidget.showSuccessToast("Profile picture removed");
              } else {
                GoRouter.of(context).pop();
                CustomToastWidget.showErrorToast("Not found image");
              }
            },
            label: Text(
              "Remove",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
