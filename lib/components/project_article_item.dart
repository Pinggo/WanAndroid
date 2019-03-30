import 'package:flutter/material.dart';
import 'package:flutter_app/model/article_bean.dart';
import 'package:flutter_app/page/webview_page.dart';

class ProjectArticleItem extends StatelessWidget {
  ProjectArticleItem(this.article, {Key key}) : super(key: key);
  final ArticleBean article;

  @override
  Widget build(BuildContext context) {
    TextStyle bodyTextStyle = TextStyle(
      fontSize: Theme
          .of(context)
          .textTheme
          .caption
          .fontSize,
      color: Colors.grey,
    );
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 16),
                    child: FadeInImage.assetNetwork(
                        width: 64,
                        height: 120,
                        fit: BoxFit.fill,
                        placeholder:'assets/ic_welcome.jpg',
                        image: article.envelopePic,
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          article.title,
                          style: TextStyle(
                            fontSize:
                            Theme
                                .of(context)
                                .textTheme
                                .subhead
                                .fontSize,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        height: 50,
                        child: Text(
                          article.desc,
                          style: bodyTextStyle,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(article.author, style: bodyTextStyle),
                          Expanded(
                            flex: 1,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  article.niceDate,
                                  style: bodyTextStyle,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}