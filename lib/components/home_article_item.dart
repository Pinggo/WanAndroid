import 'package:flutter/material.dart';
import 'package:flutter_app/model/article_bean.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_app/page/webview_page.dart';

class HomeArticleItem extends StatefulWidget {
  HomeArticleItem(this.article, {Key key}) : super(key: key);
  final ArticleBean article;

  @override
  State<StatefulWidget> createState() {
    return _ActicleItemState();
  }
}

class _ActicleItemState extends State<HomeArticleItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WebViewPage(
                title: widget.article.title,
                url: widget.article.link,
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
                          text: '作者:',
                        ),
                        TextSpan(
                            text: widget.article.author,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ))
                      ])),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(widget.article.niceDate),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 8),
                  child: Html(
                    data: widget.article.title,
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
                    '${widget.article.chapterName}/${widget.article.superChapterName}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
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
