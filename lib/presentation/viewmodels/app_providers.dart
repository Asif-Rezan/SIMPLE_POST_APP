import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../di/injection.dart';
import 'home/home_viewmodel.dart';

class AppProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
  ];
}
