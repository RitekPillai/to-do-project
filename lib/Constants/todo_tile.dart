import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:practice/Constants/app_colors.dart';

class TodoTile extends StatelessWidget {
  final String data;
  final bool checkbox;
  Function(bool?)? onchanged;
  Function(BuildContext)? Sliadble_change;
  TodoTile(
      {super.key,
      required this.data,
      required this.checkbox,
      required this.onchanged,
      required this.Sliadble_change});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Slidable(
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: Sliadble_change,
            icon: Icons.delete_rounded,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: PrimaryColor.gray,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(
                  value: checkbox,
                  onChanged: onchanged,
                  activeColor: PrimaryColor.org,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data,
                  style: TextStyle(
                      decorationColor: PrimaryColor.org,
                      decorationThickness: 2,
                      fontSize: 20,
                      color: checkbox
                          ? PrimaryColor.lightgray
                          : PrimaryColor.offwhite,
                      decoration: checkbox
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
