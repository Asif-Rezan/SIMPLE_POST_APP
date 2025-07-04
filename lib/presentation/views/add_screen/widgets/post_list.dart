import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cors/theme/app_colors.dart';
import '../../../viewmodels/add_post/add_post_view_model.dart';

class PostList extends StatelessWidget {
  final AddPostViewModel viewModel;

  const PostList({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.posts.isEmpty) {
      return Center(
        child: Text(
          "No posts yet.",
          style: TextStyle(fontSize: 16.sp, color: AppColors.textGraySecondary),
        ),
      );
    }

    return ListView.separated(
      itemCount: viewModel.posts.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final post = viewModel.posts[index];
        return Card(
          elevation: 3,
          color: AppColors.cardBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: ListTile(
              title: Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                  color: AppColors.textPrimary,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  post.body,
                  style: TextStyle(fontSize: 13.sp, color: AppColors.textGray),
                ),
              ),
              contentPadding: EdgeInsets.zero,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, size: 20.sp, color: AppColors.textBlue),
                    onPressed: () => viewModel.setEditingPost(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, size: 20.sp, color: Colors.red),
                    onPressed: () => viewModel.deletePost(index),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
