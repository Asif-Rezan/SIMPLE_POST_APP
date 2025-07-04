import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_post_app/presentation/views/add_screen/screen/add_screen.dart';
import 'package:simple_post_app/presentation/views/home/screen/home_screen.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    AddScreen(),
    Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        child: BottomAppBar(
          color: const Color(0xFFE4EDDA),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                final isCenter = index == 1;

                final Map<int, Map<String, String>> tabData = {
                  0: {"icon": "assets/icons/home.png", "label": "Home"},
                  1: {"icon": "assets/icons/add.png", "label": ""},
                  2: {"icon": "assets/icons/settings.png", "label": "Settings"},
                };
                final iconPath = tabData[index]!["icon"]!;
                final label = tabData[index]!["label"]!;
                final isSelected = _currentIndex == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          iconPath,
                          width: isCenter ? 40 : 24,
                          height: isCenter ? 40 : 24,
                          color: isSelected
                              ? const Color(0xff299C46)
                              : Colors.grey,
                        ),
                        if (label.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            label,
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xff299C46)
                                  : Colors.grey,
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
