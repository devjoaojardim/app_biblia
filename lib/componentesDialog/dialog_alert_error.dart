import 'package:flutter/material.dart';

import '../util/colors.dart';





class DialogError extends StatefulWidget {
  String? title;
  String? content;
  TextButton? btnConfirm;

  DialogError({
    Key? key,
    this.title,
    this.content,
    this.btnConfirm,
  });

  @override
  State<DialogError> createState() => _DialogErrorState();
}

class _DialogErrorState extends State<DialogError> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 280,
            child: Card(
              color: MyColors.colorPrimaryVariant,
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      widget.content!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.btnConfirm!
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
