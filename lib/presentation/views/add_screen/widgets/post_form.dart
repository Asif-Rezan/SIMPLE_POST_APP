import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cors/theme/app_colors.dart';
import '../../../viewmodels/add_post/add_post_view_model.dart';

class PostForm extends StatelessWidget {
  final AddPostViewModel viewModel;

  const PostForm({super.key, required this.viewModel});

  void _handleSubmit(BuildContext context) {
    final title = viewModel.titleController.text.trim();
    final body = viewModel.bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Both Title and Body are required."),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        ),
      );
      return;
    }

    if (viewModel.isEditing) {
      viewModel.updatePost(viewModel.editingIndex);
    } else {
      viewModel.addPost();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFormFilled = viewModel.titleController.text.trim().isNotEmpty &&
        viewModel.bodyController.text.trim().isNotEmpty;

    return Card(
      color: AppColors.cardBackground,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            TextField(
              controller: viewModel.titleController,
              style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
              onChanged: (_) => viewModel.notifyListeners(),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: viewModel.bodyController,
              maxLines: 3,
              style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
              decoration: InputDecoration(
                labelText: "Body",
                labelStyle: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
              onChanged: (_) => viewModel.notifyListeners(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: isFormFilled ? () => _handleSubmit(context) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      disabledBackgroundColor: Colors.grey.shade300,
                      disabledForegroundColor: Colors.grey.shade600,
                    ),
                    icon: Icon(viewModel.isEditing ? Icons.update : Icons.add, size: 18.sp),
                    label: Text(
                      viewModel.isEditing ? "Update Post" : "Add Post",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
                if (viewModel.isEditing) ...[
                  SizedBox(width: 12.w),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        viewModel.titleController.clear();
                        viewModel.bodyController.clear();
                        viewModel.setEditingPost(-1);
                      },
                      icon: Icon(Icons.cancel, color: AppColors.textSecondary, size: 18.sp),
                      label: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.borderGray),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
