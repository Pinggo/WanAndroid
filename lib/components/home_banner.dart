import 'package:flutter/material.dart';
import 'package:flutter_app/model/banner_bean.dart';
import 'package:flutter_app/page/webview_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/http/http_util.dart';
import 'package:flutter_app/http/api.dart';
import 'package:flutter_app/components/custom_pagination.dart';

class HomeBanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner> with AutomaticKeepAliveClientMixin{
  List<BannerBean> banners = [];

  void loadBanners() async {
    try {
      var response = await HttpUtil.get(Api.URL + Api.BANNER);
      BaseBannerBean baseBannerBean = BaseBannerBean.fromJson(response);
      if (baseBannerBean.errorCode == 0 && baseBannerBean.data.length != 0) {
        if (this.mounted) {
          setState(() {
            banners = baseBannerBean.data;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 200,
      child: banners.length != 0
          ? Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  banners[index].imagePath,
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              duration: 1000,
              itemCount: banners.length,
              pagination: SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return CustomPagination(
                  config,
                  title: banners[config.activeIndex].title,
                );
              }),
              itemHeight: 200,
              onTap: (index) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebViewPage(
                    title: banners[index].title,
                    url: banners[index].url,
                  );
                }));
              },
            )
          : SizedBox(
              height: 200,
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
