import 'dart:developer';

import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:ecommerce_admin/Core/utils/assets.dart';
import 'package:ecommerce_admin/Models/dashboard_model.dart';
import 'package:ecommerce_admin/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppHelper {
  static const String kDark = "isDark";
  static bool isDark = false;

  static List<DashboardModel> dashboard(BuildContext context) => [
    DashboardModel(
      title: "Add a new product",
      imagePath: Assets.imagesCloud,
      function: () {
        GoRouter.of(context).push(AppRouter.kAddProductView);
      },
    ),
    DashboardModel(
      title: "Inspect all products",
      imagePath: Assets.imagesShoppingCart,
      function: () {
        GoRouter.of(context).push(AppRouter.kSearchView);
      },
    ),
    DashboardModel(
      title: "View orders",
      imagePath: Assets.imagesOrder,
      function: () {
        GoRouter.of(context).push(AppRouter.kViewOrdersView);
      },
    ),
  ];
  static Future<String> uploadImageToStorage({
    required XFile? profilePic,
    required SupabaseClient? supabase,
    required String imageLinkOne,
    required String imageLinkTwo,
    required String uuid,
  }) async {
    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      throw Exception("حدث خطأ أثناء التسجيل، لم يتم المصادقة على المستخدم.");
    }
    String imageUrl = "Assets/Images/737064202.png";

    if (profilePic != null) {
      try {
        final bytes = await profilePic.readAsBytes();
        final fileName = "$uuid${DateTime.now().millisecondsSinceEpoch}.jpg";
        final filePath = "public/$fileName";

        final storageResponse = await supabase!.storage
            .from(imageLinkOne)
            .uploadBinary(filePath, bytes);

        if (storageResponse.isNotEmpty) {
          final publicUrl = supabase.storage
              .from(imageLinkTwo)
              .getPublicUrl(filePath);

          imageUrl = publicUrl;
          log("✅ Image URL: $imageUrl");
        } else {
          log("❌ Image upload failed: empty response");
        }
      } catch (e) {
        log("❌ Image upload failed: $e");
      }
    }
    return imageUrl;
  }
  static late ProductModel productModel;
}
