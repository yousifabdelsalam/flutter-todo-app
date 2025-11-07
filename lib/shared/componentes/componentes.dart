
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

Widget defaultTextButton({
  double width = double.infinity,
  Color color = Colors.blueAccent,
  bool isUpperCase = true,
  required String text,
  required Function function,
}) => Container(
  width: width,
  color: color,
  child: MaterialButton(
    onPressed: function as void Function(),
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);

Widget buildTaskItem(
  Map Model,
  context,
  bool darkTheme, {
  bool? doneActive = false,
  bool? archiveActive = false,
}) => Dismissible(
  key: Key(Model['id'].toString()),
  direction: DismissDirection.startToEnd,
  onDismissed: (direction) {
    AppCubit.get(context).DeleteData(id: Model['id']);
  },
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 40,
          child: Text(
            '${Model['time']}',
            style: TextStyle(
              color: darkTheme ? Colors.cyanAccent : Colors.white,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${Model['title']}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: darkTheme ? Colors.teal : Colors.black,
                ),
              ),
              Text(
                '${Model['date']}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: darkTheme ? Colors.white54 : Colors.teal,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            doneActive == true
                ? null
                : AppCubit.get(
                    context,
                  ).UpdateData(status: 'done', id: Model['id']);
          },
          icon: Icon(
            Icons.check_circle,
            color: doneActive == true ? Colors.grey : Colors.green,
          ),
        ),
        IconButton(
          onPressed: () {
            archiveActive == true
                ? null
                : AppCubit.get(
                    context,
                  ).UpdateData(status: 'archived', id: Model['id']);
          },
          icon: Icon(
            Icons.archive,
            color: archiveActive == true
                ? Colors.grey
                : darkTheme
                ? Colors.teal
                : Colors.black,
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider() => Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(color: Colors.grey[300], height: 1, width: double.infinity),
    );


Widget myFormField({
  controller,
  ValueChanged<String>? onChanged,
  TextInputType? type,
  required FormFieldValidator validate,
  IconData? suffix,
  IconData? suffixIcon,
  IconData? prefix,
  Icon? prefixIcon,
  Text? label,
  String? labelText,
  bool isPassword = false,
  VoidCallback? suffixPressed,
}) => TextFormField(
  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  decoration: InputDecoration(

//fillColor: Colors.black,
    label: label,
   // filled: true,
   // prefix: Icon(prefix),
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(suffix),
    ) : null,
    border: OutlineInputBorder(),
  ),
  validator: validate,
 onChanged: onChanged,


);

Future myNavigator(BuildContext context,Widget page) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page,));

Future navigateWithReplace(BuildContext context,Widget page) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page,
    ),
        (route) => false
    );

