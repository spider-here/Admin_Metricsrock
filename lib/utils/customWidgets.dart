import 'package:flutter/material.dart';

class customWidgets{


  TextField loginTextField({required BuildContext context, required String labelText,
    required Widget icon, required TextEditingController controller, required bool obscureText}){
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black87,
                width: 1.0
            ),
            borderRadius: BorderRadius.all(Radius.zero)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0
            ),
            borderRadius: BorderRadius.all(Radius.zero)
        ),
        labelText: labelText,
        prefixIcon: icon,
      ),
    );
  }

  ElevatedButton mainButton({required BuildContext context, required String label, required onPressed,}){
    return ElevatedButton(
          onPressed: onPressed, child: Padding(padding: const EdgeInsets.all(10.0), child: Text(label),),
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  )
              )
          ),
    );
  }

  Card userListItem(
      {required String username,
      required String email, required bool enabled,  required action}){
    return Card(
      margin: const EdgeInsets.all(5.0),
      color: Colors.white,
      elevation: 6.0,
      child: ListTile(
          title: Text(username, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, overflow: TextOverflow.ellipsis),),
          subtitle: Text(email, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey, overflow: TextOverflow.ellipsis),),
        trailing: TextButton(onPressed: action,
        child: enabled? Text("Disable Account", style: TextStyle(color: Colors.red.shade700),):Text("Enable Account",),)),
    );
  }

}