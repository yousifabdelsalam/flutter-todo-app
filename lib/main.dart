import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/shared/bloc_observer.dart';
import 'package:my_todo_app/shared/network/local/cache_helper.dart';
import 'package:my_todo_app/shared/styles/styles.dart';
import 'package:my_todo_app/todo_Layout_Screen.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await cacheHelper.init();

  Widget widget;

  bool? isDark = cacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? fromShared;

  MyApp(this.fromShared);

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

          return MaterialApp(

            ////////////////////////////light Theme\\\\\\\\\\\\\\\\\\\\\\\\\
            theme: lightTheme,
            ////////////////////////////Dark Theme\\\\\\\\\\\\\\\\\\\\\\\\\
            darkTheme: darkTheme,
            //themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            themeMode: ThemeMode.light,

            debugShowCheckedModeBanner: false,
            home: Home_Layout_Screen(),
          );


  }
}
