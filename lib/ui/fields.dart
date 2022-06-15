import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';

class Fields extends StatefulWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  String placetype = "Hotel";
  bool error = false;
  TextEditingController cont = TextEditingController();
  String country = "";
  String city = "";
  String state = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: FormField<String>(
        //     builder: (FormFieldState<String> state) {
        //       return InputDecorator(
        //         decoration: InputDecoration(
        //             //labelStyle: textStyle,
        //             errorStyle: const TextStyle(
        //                 color: Colors.redAccent, fontSize: 16.0),
        //             hintText: 'Please select expense',
        //             border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(5.0))),
        //         isEmpty: placetype == '',
        //         child: DropdownButtonHideUnderline(
        //           child: DropdownButton<String>(
        //             value: placetype,
        //             isDense: true,
        //             onChanged: (newValue) {
        //               setState(() {
        //                 placetype = newValue.toString();
        //               });
        //             },
        //             items: ["Hotel", "Locals"].map((String value) {
        //               return DropdownMenuItem<String>(
        //                 value: value,
        //                 child: Text(value),
        //               );
        //             }).toList(),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(style: BorderStyle.solid)),
              width: 100,
              child: CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'pk',

                // optional. Shows only country name and flag
                showCountryOnly: true,
                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,
                // optional. aligns the flag and the Text left
                alignLeft: false,
              ),
            ),
            SizedBox(
                width: 200,
                child: TextFormField(
                  controller: cont,
                  maxLength: 10,
                  onEditingComplete: () {
                    if (cont.text.length != 10) {
                      setState(() {
                        error = true;
                      });
                    } else {
                      setState(() {
                        error = false;
                      });
                    }
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ))
          ],
        ),
        error == true ? const Text("Invalid Number") : const Text(""),
        const SizedBox(
          height: 20,
        ),
        SelectState(
          onCountryChanged: (value) {
            setState(() {
              country = value;
            });
          },
          onStateChanged: (value) {
            setState(() {
              state = value;
            });
          },
          onCityChanged: (value) {
            setState(() {
              city = value;
            });
          },
        ),
      ]),
    );
  }
}
