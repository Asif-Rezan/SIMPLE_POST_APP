import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../cors/di/injection.dart';
import 'home/home_viewmodel.dart';

class AppProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
  ];
}
