
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/cubit/cubit.dart';
import '../../shared/componentes/componentes.dart';
import '../../shared/cubit/states.dart';



class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, AppStates state) {
        var tasks = AppCubit.get(context).newTasks;
        return (tasks.length > 0)
            ? ListView.separated(
                itemBuilder: (context, index) =>
                    buildTaskItem(tasks[index], context,AppCubit.get(context).darkTheme,),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                itemCount: tasks.length,
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.menu, color: Colors.grey, size: 100),
                    Text(
                      "No Tasks Yet, Please Add Some Tasks",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
              );
      },
      listener: (BuildContext context, AppStates state) {},
    );
  }
}
