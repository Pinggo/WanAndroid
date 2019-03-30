import 'package:flutter/material.dart';
import 'package:flutter_app/model/article_bean.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_app/page/webview_page.dart';

class HomeArticleItem extends StatelessWidget {
  HomeArticleItem(this.article, {Key key}) : super(key: key);
  final ArticleBean article;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebViewPage(
              title: article.title,
              url: article.link,
            );
          }));
        },
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          margin: EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: article.author,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize:Theme.of(context).textTheme.caption.fontSize,
                          ))
                    ])),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(article.niceDate,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize:Theme.of(context).textTheme.caption.fontSize,
                          ),),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 8),
                child: Html(
                  data: article.title,
                  defaultTextStyle: TextStyle(
                    fontSize: Theme.of(context).textTheme.subhead.fontSize,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  '${article.chapterName}/${article.superChapterName}',
                  style: TextStyle(
                    color:Colors.grey,
                    fontSize:Theme.of(context).textTheme.caption.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
