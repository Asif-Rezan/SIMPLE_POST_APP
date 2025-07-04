import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simple_post_app/presentation/views/widgets/custom_app_bar.dart';
import '../../../../cors/theme/app_colors.dart';
import '../../../viewmodels/home/home_viewmodel.dart';
import '../widgets/post_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "All Posts", showBackButton: false,),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return RefreshIndicator(
            onRefresh: viewModel.refresh,
            color: AppColors.buttonColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search posts...',
                      hintStyle: TextStyle(
                        color: AppColors.textGraySecondary,
                        fontSize: 14.sp,
                      ),
                      prefixIcon: Icon(Icons.search, size: 20.sp, color: AppColors.textGraySecondary),
                      filled: true,
                      fillColor: AppColors.cardBackground,
                      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: viewModel.updateSearch,
                  ),
                ),
                if (viewModel.isLoading)
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 28.h,
                        width: 28.h,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  )
                else ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Total: ${viewModel.filteredPosts.length} items',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textGraySecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: PostListView(posts: viewModel.filteredPosts),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
