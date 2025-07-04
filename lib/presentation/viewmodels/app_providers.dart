import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:simple_post_app/presentation/viewmodels/add_post/add_post_view_model.dart';

import '../../cors/di/injection.dart';
import 'home/home_viewmodel.dart';

class AppProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
    ChangeNotifierProvider(create: (_) => getIt<AddPostViewModel>()),
  ];
}
