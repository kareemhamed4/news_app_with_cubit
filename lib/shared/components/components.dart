import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildNewsItem(article, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(article["url"])));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(
                image: NetworkImage("${article["urlToImage"]}"),fit: BoxFit.cover,),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider({
  required Color color,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: 1,
        width: double.infinity,
        color: color,
      ),
    );

Widget buildArticleScreen(list) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildNewsItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(color: Colors.black54),
        itemCount: list.length,
      );
    },
    fallback: (context) => const Center(child: CircularProgressIndicator()));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)? onchange,
  required String? Function(String? val)? validator,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefix,
          ),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        validator: validator,
        keyboardType: type,
        onChanged: onchange);
