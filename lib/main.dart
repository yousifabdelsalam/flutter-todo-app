import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/shared/bloc_observer.dart';
import 'package:my_todo_app/shared/cubit/cubit.dart';
import 'package:my_todo_app/shared/cubit/states.dart';
import 'package:my_todo_app/shared/network/local/cache_helper.dart';
import 'package:my_todo_app/shared/styles/styles.dart';
import 'package:my_todo_app/todo_Layout_Screen.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await cacheHelper.init();
  Bloc.observer = MyBlocObserver();


  bool isDark = await cacheHelper.getData(key: 'isDark') ?? false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
bool isDark;

MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {

    debugPaintSizeEnabled = false;
   return  BlocProvider(
     create: (BuildContext context) => AppCubit()..darkTheme = isDark..createDatabase(),
     child: MaterialApp(
                ////////////////////////////light Theme\\\\\\\\\\\\\\\\\\\\\\\\\
                theme: lightTheme,
                ////////////////////////////Dark Theme\\\\\\\\\\\\\\\\\\\\\\\\\
                darkTheme: darkTheme,
                themeMode:  isDark ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: Home_Layout_Screen(),
              ),
              );
     }

}
