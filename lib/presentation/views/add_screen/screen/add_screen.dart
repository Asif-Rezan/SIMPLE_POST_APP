import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simple_post_app/presentation/views/widgets/custom_app_bar.dart';
import '../../../../cors/theme/app_colors.dart';
import '../../../viewmodels/add_post/add_post_view_model.dart';
import '../widgets/post_form.dart';
import '../widgets/post_list.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "Add Post", showBackButton: false,),
      body: Consumer<AddPostViewModel>(
        builder: (context, viewModel, _) => Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              PostForm(viewModel: viewModel),
              SizedBox(height: 24.h),
              Expanded(child: PostList(viewModel: viewModel)),
            ],
          ),
        ),
      ),
    );
  }
}
