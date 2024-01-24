import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: DateFiel(),));
}

class DateFiel extends StatefulWidget {
  const DateFiel({super.key});

  @override
  State<DateFiel> createState() => _DateFielState();
}

class _DateFielState extends State<DateFiel> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text("DATE PICKER")),
      ),
      body:Padding(padding:  EdgeInsets.all(15),
      child: TextField(
        controller: TextEditingController(text: "${selectedDate.toLocal()}".split(" ")[0]),
        onTap:()=> selectDate(context),
        readOnly: true,
        decoration:  InputDecoration(
          labelText: "SELECT DATE",
          hintText: "YYYY-MM-DD",
          suffixIcon: Icon(Icons.calendar_month),
          border: OutlineInputBorder(),
        ),

      ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async{
    final DateTime? pickedDate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2030)
    );
    if(pickedDate != null && pickedDate != selectedDate){
      setState(() {
        selectedDate = pickedDate;
      });
    }


  }
}
