import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget articleBuilder(list,{isSearch = false}) =>
    ConditionalBuilder(
      condition: list.length>0,
      builder: (context) =>
          ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index) => buildArticleItem(list[index], context),
            separatorBuilder: (context,index) => myDivider(),
            itemCount: list.length,
          ),
      fallback: (context) => isSearch? Container() : Center(child: CircularProgressIndicator(),),
    );

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget buildArticleItem(article, context) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );

Widget myDivider() =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

// Text Form Field
Widget defaultTextFormField(
    {
      required final TextEditingController? controller,
      required TextInputType type,
      required  String? Function(String?)? validate,
      required String label,
      required IconData prefix,
      bool isPassword = false,
      IconData? suffix,
      Function()? suffixPressed,
      Function()? onTap,
      Function(String)? onChange,

    }) => TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validate,
    obscureText: isPassword,
    onTap: onTap,
    onChanged: onChange,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(
          prefix
      ),
      suffixIcon: suffix != null?IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix,)):null,
      border: OutlineInputBorder(),
    )
);