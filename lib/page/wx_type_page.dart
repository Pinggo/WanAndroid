import 'package:flutter/material.dart';
import 'package:flutter_app/components/home_article_item.dart';
import 'package:flutter_app/http/api.dart';
import 'package:flutter_app/http/http_util.dart';
import 'package:flutter_app/model/article_bean.dart';

class WxTypePage extends StatefulWidget{
  final int id;

  WxTypePage(this.id,{Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _WxTypePageState();
  }
}
class _WxTypePageState extends State<WxTypePage> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController = new ScrollController();
  List<ArticleBean> articles = [];
  bool isOver = false;
  int _pageIndex = 0;
  bool isLoading = false;

  void loadArticles(bool isLoadMore) async {
    var response = await HttpUtil.get(
        Api.URL + Api.WXARTICLE_LIST + widget.id.toString()+"/"+_pageIndex.toString()+"/json");
    BaseArticleBean baseArticleBean = BaseArticleBean.fromJson(response);
    if (baseArticleBean.errorCode == 0) {
      ArticleListBean listBean = baseArticleBean.data;
      isOver = listBean.over;
      if(isOver){
        setState(() {
        });
      }
      if (this.mounted) {
        setState(() {
          if (isLoadMore) {
            isLoading = false;
            articles.addAll(listBean.datas);
          } else {
            articles.clear();
            articles.addAll(listBean.datas);
          }
        });
      }
    }
  }

  Future<void> _onRefresh() async{
    _pageIndex = 0;
    isOver = false;
    isLoading = false;
    loadArticles(false);
  }

  Future<void> _loadMore() async{
    if (!isLoading && !isOver) {
      setState(() {
        isLoading = true;
      });
    }
    _pageIndex++;
    loadArticles(true);
  }

  @override
  void initState() {
    super.initState();
    loadArticles(false);
    _scrollController.addListener(() {
      // 如果下拉的当前位置到scroll的最下面
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: articles.length + 1,
          itemBuilder: (context, index) {
            if (index == articles.length) {
              return _getMoreWidget();
            } else {
              return HomeArticleItem(articles[index]);
            }
          },
          controller: _scrollController,
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  Widget _getMoreWidget() {
    if (isOver) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text('已全部加载完毕'),
        ),
      );
    }
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: isLoading?1:0,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '加载更多...',
              style: TextStyle(fontSize: 16),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}