import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../secret/secret.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class Home_Layout_Screen extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var done = GlobalKey<ScaffoldState>();
  var arch = GlobalKey<ScaffoldState>();
  int secret = 21;
  bool showFlotButn = true;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
       child:
       BlocConsumer<AppCubit, AppStates>(
          builder: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              backgroundColor: cubit.darkTheme? Color.fromRGBO(10, 15, 30, 1.0) : Colors.white,
              key: scaffoldkey,
              appBar: AppBar(

                actions: [
                  ElevatedButton(
                  style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
                      elevation: WidgetStateProperty.all<double>(0),
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent)
                  ),
                  onPressed: () {
                      secret--;
                      if(secret == 1){
                        final snackBar = SnackBar(content: Text('You Are 1 Tap A Way From Opening The Secret'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }
                      if(secret <= 0){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const secret_screen()));}
                  },
                  child:  Text('',style: TextStyle(color: Colors.white,fontSize: 25)),
                ),
                  SizedBox(width: 40,),
                  IconButton(onPressed: (){
                    cubit.changeTheme();
                  }, icon: Icon(Icons.nightlight_outlined,color: Colors.white,)),
                ],
                backgroundColor: cubit.darkTheme? Color.fromRGBO(10, 15, 30, 1.0) : Colors.blueAccent,
                title: Text(
                  cubit.Titles[cubit.currentIndex],
                  style: TextStyle(color: cubit.colors[cubit.currentIndex]),
                ),
              ),
              body: Center(
                child: (state is AppGetDatabaseLoadingState)
                    ? CircularProgressIndicator()
                    : cubit.Screens[cubit.currentIndex],
              ),
              bottomNavigationBar: BottomNavigationBar(

                key: done,
                selectedItemColor: cubit.darkTheme? Colors.teal : Colors.black,
                unselectedItemColor: cubit.darkTheme? Colors.teal : Colors.black,
                backgroundColor:  cubit.darkTheme? Color.fromRGBO(10, 15, 30, 1.0) : Colors.white,
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.list,color:  cubit.darkTheme? Colors.teal : Colors.black,),
                      label: 'Tasks'),
                  BottomNavigationBarItem(
                  //  key: done,
                    icon: Icon(Icons.check_circle_outline,color:  cubit.darkTheme? Colors.teal : Colors.black,),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    key: arch,
                    icon: Icon(Icons.archive_outlined,color:  cubit.darkTheme? Colors.teal : Colors.black,),
                    label: 'Archived',

                  ),
                ],
                onTap: (index) {
                  cubit.changeIndex(index);
                  if(index == 0){
                    showFlotButn = true;
                  }else
                  if(index == 1){
                    showFlotButn = false;
                    if(cubit.isBottomSheetShown){
                      Navigator.pop(context);
                    }
                  }else if(index == 2){
                    showFlotButn = false;
                    if(cubit.isBottomSheetShown){
                      Navigator.pop(context);
                    }
                  }
                },
              ),
              floatingActionButton:showFlotButn? FloatingActionButton(
                elevation: 20,
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  if (cubit.isBottomSheetShown) {
                    if (formkey.currentState!.validate()) {
                      cubit
                          .insertToDatabase(
                            title: titleController.text,
                            date: dateController.text,
                            time: timeController.text,
                          )
                          .then((value) {

                            try {
                              cubit.getDataFromDatabase(cubit.database);
                               Navigator.pop(context);
                               cubit.changeBottomSheetState(isShow: false);
                               cubit.newTasks = value;
                            } catch (e, s) {
                              /////Error Message
                            }
                          });
                    }
                  } else {
                    scaffoldkey.currentState!
                        .showBottomSheet(
                          (context) => BlocConsumer<AppCubit, AppStates>(
                             builder: (BuildContext context, state) =>
                               Container(
                               color:  cubit.darkTheme? Color.fromRGBO(10, 15, 30, 1.0) : Colors.white,
                               padding: EdgeInsets.all(20),
                               child: Form(
                                 key: formkey,
                                 child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     ////////////////////////////////////////////////////////////////////////////
                                     //                                 Title Form Field
                                     ////////////////////////////////////////////////////////////////////////////
                                     TextFormField(
                                       style: TextStyle(color:  cubit.darkTheme? Colors.teal : Colors.black,),
                                       onChanged: ((value) {
                                         formkey.currentState!.validate();
                                       }),
                                       controller: titleController,
                                       keyboardType: TextInputType.text,
                                       validator: (value) {
                                         if (value!.isEmpty) {
                                           return 'title must not be empty';
                                         }
                                         return null;
                                       },
                                       decoration: InputDecoration(

                                         hintStyle: TextStyle(color: cubit.darkTheme? Colors.white54: Colors.white,),
                                         labelText: 'Task Title',
                                         prefixIcon: Icon(Icons.title),
                                         labelStyle: TextStyle(color: cubit.darkTheme? Colors.white54: Colors.black,),
                                         border: OutlineInputBorder(),
                                       ),
                                     ),
                                     SizedBox(height: 10),
                                     ////////////////////////////////////////////////////////////////////////////
                                     //                                 Time Form Field
                                     ////////////////////////////////////////////////////////////////////////////
                                     TextFormField(
                                       onChanged: ((value) {
                                         formkey.currentState!.validate();
                                       }),
                                       style: TextStyle(color:  cubit.darkTheme? Colors.teal : Colors.black,),
                                       readOnly: true,
                                       controller: timeController,
                                       keyboardType: TextInputType.text,
                                       validator: (value) {
                                         if (value!.isEmpty) {
                                           return 'Time must not be empty';
                                         }
                                         return null;
                                       },
                                       decoration: InputDecoration(
                                         hintStyle: TextStyle(color: cubit.darkTheme? Colors.white54: Colors.white,),
                                         labelStyle: TextStyle(color: cubit.darkTheme? Colors.white54: Colors.black,),
                                         labelText: 'Task Time',
                                         prefixIcon: Icon(
                                           Icons.watch_later_outlined,
                                         ),
                                         //suffixIcon: Icon(Icons.access_time_filled),
                                         border: OutlineInputBorder(),
                                       ),
                                       onTap: () {
                                         showTimePicker(
                                           context: context,
                                           initialTime: TimeOfDay.now(),
                                         ).then((value) {
                                           formkey.currentState!.validate();
                                           timeController.text = value!
                                               .format(context)
                                               .toString();
                                         }).whenComplete(() {formkey.currentState!.validate();});
                                       },
                                     ),
                                     SizedBox(height: 10),
                                     TextFormField(
                                       style: TextStyle(color:  cubit.darkTheme? Colors.teal : Colors.black,),
                                       readOnly: true,
                                       controller: dateController,
                                       keyboardType: TextInputType.text,
                                       validator: (value) {
                                         if (value!.isEmpty) {
                                           return 'Date must not be empty';
                                         }
                                         return null;
                                       },
                                       decoration: InputDecoration(

                                         hintStyle: TextStyle(color: cubit.darkTheme? Colors.white54: Colors.white,),
                                         labelStyle: TextStyle(color: cubit.darkTheme? Colors.white54: Colors.black,),
                                         labelText: 'Task Date',
                                         prefixIcon: Icon(Icons.calendar_month),
                                         border: OutlineInputBorder(),
                                       ),
                                       onTap: () {
                                         showDatePicker(
                                           context: context,
                                           initialDate: DateTime.now(),
                                           firstDate: DateTime.now(),
                                           lastDate: DateTime(DateTime.now().year + 2), // This sets the last date to one year from now
                                         ).then((value) {
                                           dateController.text = DateFormat.yMMMd()
                                               .format(value!);
                                         }).whenComplete(() {formkey.currentState!.validate();});
                                       },
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                            listener: (BuildContext context, state) {  },
                          ),
                        )
                        .closed
                        .then((value) {
                          timeController.text = '';
                          dateController.text = '';
                          titleController.text = '';
                          cubit.changeBottomSheetState(isShow: false);
                        });
                    cubit.changeBottomSheetState(isShow: true);
                  }
                },
                child: Icon(
                  cubit.isBottomSheetShown ? Icons.edit : Icons.add,
                  color: Colors.white,
                ),
              ) : null,
            );
          },
          listener: (BuildContext context, AppStates state) {},

      ),
    );
  }

  Future<dynamic> getName() async {
    return 'Yousif Abd-Elsalam';
  }
}
