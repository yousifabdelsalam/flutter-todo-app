
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../todo_app/archived_tasks/Archived_Tasks_Screen.dart';
import '../../todo_app/done_tasks/Done_Tasks_Screen.dart';
import '../../todo_app/new_tasks/New_Tasks_Screen.dart';
import '../network/local/cache_helper.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  bool darkTheme = false;
  bool floatingButton = false;


  int currentIndex = 0;

  void changeTheme(){
    darkTheme = !darkTheme;
    cacheHelper.setBoolean(key: 'isDark', value: darkTheme);
    emit(AppChangeThemeState());
  }



  List<Widget> Screens = [
    NewTasksScreen(),
    Done_Tasks_Screen(),
    ArchivedTasksScreen(),
  ];
  List<String> Titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];
  List<Color> colors = [Colors.white, Colors.yellow.shade500, Colors.teal.shade100];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  Database? database;
  bool isBottomSheetShown = false;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void changeBottomSheetState({required bool isShow}) {
    isBottomSheetShown = isShow;
    emit(AppChangeBottomSheetState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)',
            )
            .then((value) {
              /////// Successful creation
            })
            .catchError((error) {
              /////// Failed creation
            });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        //// database opened
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    database
        ?.transaction((txn) async {
          txn
              .rawInsert(
                'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
              )
              .then((value) {
                ////// inserted successfully
                emit(AppInsertDatabaseState());
              })
              .catchError((error) {
                ///// Error When Inserting New Record To Database
              });
        })
        .then((value) {

        });
  }

  void UpdateData({
    required String status,
    required int id,
}){
    database?.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?', ['$status', id]).then((value){
      getDataFromDatabase(database);
    });
    emit(AppUpdateDatabaseState());
}

  void DeleteData({
    required int id,
  }) {
  database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value){
      getDataFromDatabase(database);
      emit(AppDeleteTasksState());
    });

  }
  
  void getDataFromDatabase(database)  {
    emit(AppGetDatabaseLoadingState());
     database!.rawQuery('SELECT * FROM tasks').then((value) {
       newTasks = [];
       doneTasks = [];
       archivedTasks = [];

       value.forEach((element) {
         if (element['status'] == 'new')
           newTasks.add(element);
         else if (element['status'] == 'done')
           doneTasks.add(element);
         else
           archivedTasks.add(element);
       });
       emit(AppGetDatabaseState());
     });
  }




}
