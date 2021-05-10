import 'package:Boilerplate/AppTheme.dart';
import 'package:Boilerplate/AppThemeNotifier.dart';
import 'package:Boilerplate/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  //Other Variables
  bool isInProgress = false;
  // List<Shop> shops;
  // List<Category> categories;
  // List<Product> products = [];
  // List<Coupon> coupons = [];

  //Filter Variable
  // Filter filter = Filter();

  @override
  void initState() {
    super.initState();
    // _loadHomeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // _loadHomeData() async {
  //   if (mounted) {
  //     setState(() {
  //       isInProgress = true;
  //     });
  //   }

  //   MyResponse<List<Shop>> myResponse = await ShopController.getAllShop();
  //   if (myResponse.success) {
  //     shops = myResponse.data;
  //   } else {
  //     ApiUtil.checkRedirectNavigation(context, myResponse.responseCode);
  //     showMessage(message: myResponse.errorText);
  //   }

  //   MyResponse<List<Coupon>> myResponseCoupon =
  //       await CouponController.getAllCoupon();
  //   if (myResponseCoupon.success) {
  //     coupons = myResponseCoupon.data;
  //   } else {
  //     ApiUtil.checkRedirectNavigation(context, myResponse.responseCode);
  //     showMessage(message: myResponse.errorText);
  //   }

  //   MyResponse<List<Category>> myResponseCategory =
  //       await CategoryController.getAllCategory();
  //   if (myResponseCategory.success) {
  //     categories = myResponseCategory.data;
  //   } else {
  //     ApiUtil.checkRedirectNavigation(context, myResponseCategory.responseCode);
  //     showMessage(message: myResponseCategory.errorText);
  //   }

  //   MyResponse<List<Product>> myResponseProduct =
  //       await ProductController.getAllProduct();

  //   if (myResponseProduct.success) {
  //     products = myResponseProduct.data;
  //   } else {
  //     if (mounted) {
  //       ApiUtil.checkRedirectNavigation(
  //           context, myResponseProduct.responseCode);
  //       showMessage(message: myResponseProduct.errorText);
  //     }
  //   }

  //   if (mounted) {
  //     setState(() {
  //       isInProgress = false;
  //     });
  //   }
  // }

  Future<void> _refresh() async {
    // _loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: customAppTheme.bgLayer1,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(40.0),
                    child: AppBar(
                        backgroundColor: Color(0xff23A26F),
                        elevation: 0,
                        centerTitle: true,
                        title: Image.asset(
                          'assets/images/logo-white.png',
                          height: MySize.size28,
                        )),
                  ),
                  body: RefreshIndicator(
                    onRefresh: _refresh,
                    backgroundColor: customAppTheme.bgLayer1,
                    color: themeData.colorScheme.primary,
                    key: _refreshIndicatorKey,
                    child: Column(
                      children: [
                        Container(
                          height: MySize.size3,
                          child: isInProgress
                              ? LinearProgressIndicator(
                                  minHeight: MySize.size3,
                                )
                              : Container(
                                  height: MySize.size3,
                                ),
                        ),
                        Expanded(
                          child: _buildBody(),
                        )
                      ],
                    ),
                  )),
            ));
      },
    );
  }

  _buildBody() {
    // if (shops != null && categories != null) {
      return Container(
          child: ListView(
        children: [
          // _categoriesWidget(categories),
          // coupons.length != 0 ? Padding(
          //   padding: Spacing.fromLTRB(20, 15, 16, 0),
          //   child:  Text(
          //     "Promo Terbaru",
          //     style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
          //         letterSpacing: -0.2,
          //         fontWeight: 700,
          //         color: themeData.colorScheme.onBackground),
          //   )
          // ) : Container(),
          // Padding(
          //   padding: Spacing.fromLTRB(5, 0, 0, 0),
          //   child: _bannersWidget(coupons),
          // ),
          // Padding(
          //   padding: Spacing.fromLTRB(20, 25, 16, 0),
          //   child: Text(
          //     "Produk Terbaru",
          //     style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
          //         letterSpacing: -0.2,
          //         fontWeight: 700,
          //         color: themeData.colorScheme.onBackground),
          //   ),
          // ),
          // Padding(
          //   padding: Spacing.fromLTRB(5, 0, 0, 0),
          //   child: _showProducts(products),
          // ),
          // Padding(
          //   padding: Spacing.fromLTRB(20, 25, 16, 0),
          //   child: Text(
          //     "Semua Merchant",
          //     style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
          //         letterSpacing: -0.2,
          //         fontWeight: 700,
          //         color: themeData.colorScheme.onBackground),
          //   ),
          // ),
          // Padding(
          //   padding: Spacing.fromLTRB(5, 0, 0, 0),
          //   child: _shopsWidget(shops),
          // )
        ],
      ));
    // } else if (isInProgress) {
    //   return Container();
    // } else {
    //   return Container();
    // }
  }

  // showMessage({String message = "Something wrong", Duration duration}) {
  //   if (duration == null) {
  //     duration = Duration(seconds: 3);
  //   }
  //   _scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //       duration: duration,
  //       content: Text(message,
  //           style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
  //               letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
  //       backgroundColor: themeData.colorScheme.primary,
  //       behavior: SnackBarBehavior.fixed,
  //     ),
  //   );
  // }

  // _shopsWidget(List<Shop> shops) {
  //   List<Widget> listWidgets = [];
  //   for (Shop shop in shops) {
  //     listWidgets.add(InkWell(
  //       onTap: () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => ShopScreen(
  //                       shopId: shop.id,
  //                     )));
  //       },
  //       child: Container(
  //         margin: Spacing.bottom(24),
  //         child: _singleShop(shop),
  //       ),
  //     ));
  //   }
  //   return Container(
  //     margin: Spacing.fromLTRB(16, 20, 16, 0),
  //     child: Column(
  //       children: listWidgets,
  //     ),
  //   );
  // }

  // _singleShop(Shop shop) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       // color: customAppTheme.bgLayer2,
  //       borderRadius: BorderRadius.all(Radius.circular(16)),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         ClipRRect(
  //             borderRadius: BorderRadius.all(Radius.circular(MySize.size10)),
  //             child: Image.network(
  //               shop.imageUrl,
  //               width: MySize.size100,
  //               height: MySize.size90,
  //               fit: BoxFit.cover,
  //             )),
  //         Container(
  //           padding: Spacing.fromLTRB(16, 2, 16, 0),
  //           // child: Expanded(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 width: 200,
  //                 child: Text(shop.name,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: AppTheme.getTextStyle(
  //                         themeData.textTheme.subtitle1,
  //                         fontSize: 14,
  //                         fontWeight: 700)),
  //               ),
  //               Container(
  //                   padding: Spacing.fromLTRB(0, 5, 0, 0),
  //                   width: 200,
  //                   child: Text(
  //                     shop.address,
  //                     style: AppTheme.getTextStyle(themeData.textTheme.caption,
  //                         fontWeight: 500),
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                   )),
  //               Container(
  //                 padding: Spacing.fromLTRB(0, 5, 0, 0),
  //                 child: Row(
  //                   children: [
  //                     Generator.buildRatingStar(
  //                         rating: shop.rating,
  //                         activeColor: ColorUtils.getColorFromRating(
  //                             shop.rating.ceil(), customAppTheme, themeData)),
  //                     Text(
  //                       "(" + shop.totalRating.toString() + ")",
  //                       style: AppTheme.getTextStyle(
  //                           themeData.textTheme.bodyText1,
  //                           color: themeData.colorScheme.onBackground,
  //                           fontSize: 12,
  //                           fontWeight: 500),
  //                     ),

  //                     Container(
  //                       margin: Spacing.fromLTRB(10, 0, 0, 0),
  //                       padding: Spacing.symmetric(vertical: 3, horizontal: 6),
  //                       decoration: BoxDecoration(
  //                         color: shop.isOpen
  //                             ? Color(0xff26C485)
  //                             : customAppTheme.colorError,
  //                         borderRadius: BorderRadius.circular(5),
  //                       ),
  //                       child: Text(
  //                         shop.isOpen ? "Buka" : "Tutup",
  //                         style: AppTheme.getTextStyle(
  //                             themeData.textTheme.subtitle1,
  //                             fontSize: 12,
  //                             fontWeight: 600,
  //                             color: Colors.white),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //             // ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // _categoriesWidget(List<Category> categories) {
  //   List<Widget> list = [];
  //   for (Category category in categories) {
  //     list.add(InkWell(
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => CategoryProductScreen(
  //                         category: category,
  //                       )));
  //         },
  //         child: _singleCategory(category)));
  //     // list.add(SizedBox(width: MySize.size24));
  //   }
  //   // * Get only 7 category
  //   var getCategories = list.take(7);
  //   list = [];
  //   for (var category in getCategories) {
  //     list.add(category);
  //   }
  //   // * Add Show All Categories Menu
  //   list.add(InkWell(
  //       onTap: () {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => AllCategoryScreen()));
  //       },
  //       child: _showAllCategories()));
  //   return Container(
  //     padding: Spacing.fromLTRB(8, 16, 0, 0),
  //     alignment: Alignment.center,
  //     child:
  //         // SingleChildScrollView(
  //         //   scrollDirection: Axis.horizontal,
  //         //   child: Row(
  //         Wrap(
  //       runAlignment: WrapAlignment.center,
  //       runSpacing: MySize.size26,
  //       spacing: MySize.size30,
  //       children: list,
  //       // ),
  //     ),
  //   );
  // }

  // _singleCategory(Category category) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         ClipOval(
  //           child: Container(
  //             height: MySize.size68,
  //             width: MySize.size68,
  //             color: themeData.colorScheme.primary.withAlpha(20),
  //             child: Center(
  //               child: Image.network(
  //                 category.imageUrl,
  //                 // color: themeData.colorScheme.primary,
  //                 width: MySize.getScaledSizeWidth(55),
  //                 height: MySize.getScaledSizeWidth(55),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           width: MySize.size76,
  //           padding: Spacing.top(8),
  //           child: Text(
  //             category.title,
  //             maxLines: 2,
  //             overflow: TextOverflow.clip,
  //             textAlign: TextAlign.center,
  //             style: AppTheme.getTextStyle(themeData.textTheme.caption,
  //                 fontWeight: 600, letterSpacing: 0),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // _showAllCategories() {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         ClipOval(
  //           child: Container(
  //             height: MySize.size68,
  //             width: MySize.size68,
  //             child: Center(
  //               child: Image.asset(
  //                 './assets/images/all_categories.png',
  //                 // color: themeData.colorScheme.primary,
  //                 width: MySize.getScaledSizeWidth(55),
  //                 height: MySize.getScaledSizeWidth(55),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           width: MySize.size76,
  //           padding: Spacing.top(8),
  //           child: Text(
  //             "Semua Kategori",
  //             maxLines: 2,
  //             textAlign: TextAlign.center,
  //             style: AppTheme.getTextStyle(themeData.textTheme.caption,
  //                 fontWeight: 600, letterSpacing: 0),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // _bannersWidget(List<Coupon> coupons) {
  //   if (coupons.length != 0) {
  //     List<Widget> list = [];
  //     for (Coupon coupon in coupons) {
  //       list.add(InkWell(
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => CouponDetailScreen(
  //                           couponId: coupon.id, fromCheckout: false,
  //                         )));
  //           },
  //           child: _singleBanner(coupon)));
  //       list.add(SizedBox(width: MySize.size14));
  //     }

  //     return Container(
  //       margin: Spacing.fromLTRB(15, 16, 0, 0),
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           children: list,
  //         ),
  //       ),
  //     );
  //   } else {
  //     // return Center(
  //     //   child: Text("Belum Ada Promo Yang Tersedia"),
  //     // );

  //     return Container();

  //   }
  // }

  // _singleBanner(Coupon coupon) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         ClipRRect(
  //           borderRadius: BorderRadius.all(Radius.circular(MySize.size10)),
  //           child: Container(
  //             child: Center(
  //               child: Image.network(
  //                 coupon.imageUrl,
  //                 loadingBuilder: (BuildContext ctx, Widget child,
  //                     ImageChunkEvent loadingProgress) {
  //                   if (loadingProgress == null) {
  //                     return child;
  //                   } else {
  //                     return LoadingScreens.getSimpleImageScreen(
  //                         context, themeData, customAppTheme,
  //                         width: MySize.size270, height: MySize.size140);
  //                   }
  //                 },
  //                 fit: BoxFit.cover,
  //                 width: MySize.size270,
  //                 height: MySize.size140,
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // _showProducts(List<Product> products) {
  //   List<Widget> listWidgets = [];

  //   for (int i = 0; i < products.length; i++) {
  //     listWidgets.add(InkWell(
  //       onTap: () async {
  //         Product newProduct = await Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => ProductScreen(
  //                       productId: products[i].id,
  //                     )));
  //         if (newProduct != null) {
  //           setState(() {
  //             products[i] = newProduct;
  //           });
  //         }
  //       },
  //       child: Container(
  //         child: _singleProduct(products[i]),
  //       ),
  //     ));
  //   }

  //   List<Widget> reversedListWidget = listWidgets.reversed.toList();

  //   return Container(
  //     margin: Spacing.fromLTRB(15, 16, 0, 0),
  //     child: SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: Row(
  //         children: reversedListWidget,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //       ),
  //     ),
  //   );
  // }

  // _singleProduct(Product product) {
  //   return Container(
  //       width: MySize.size160,
  //       margin: Spacing.fromLTRB(0, 0, 10, 0),
  //       decoration: BoxDecoration(
  //         color: customAppTheme.bgLayer1,
  //         borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
  //         border: Border.all(color: customAppTheme.bgLayer4),
  //         boxShadow: [
  //           BoxShadow(
  //             color: customAppTheme.shadowColor,
  //             blurRadius: 4,
  //             offset: Offset(1, 1),
  //           ),
  //         ],
  //       ),
  //       // padding: EdgeInsets.all(MySize.size16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
  //             child: product.productImages.length != 0
  //                 ? Image.network(
  //                     product.productImages[0].url,
  //                     loadingBuilder: (BuildContext ctx, Widget child,
  //                         ImageChunkEvent loadingProgress) {
  //                       if (loadingProgress == null) {
  //                         return child;
  //                       } else {
  //                         return LoadingScreens.getSimpleImageScreen(
  //                             context, themeData, customAppTheme,
  //                             width: MySize.size160, height: MySize.size160);
  //                       }
  //                     },
  //                     height: MySize.size160,
  //                     width: MySize.size160,
  //                     fit: BoxFit.cover,
  //                   )
  //                 : Image.asset(
  //                     Product.getPlaceholderImage(),
  //                     height: MySize.size160,
  //                     fit: BoxFit.cover,
  //                   ),
  //           ),
  //           Container(
  //             padding: EdgeInsets.all(MySize.size10),
  //             height: MySize.size120,
  //             // margin: EdgeInsets.only(left: MySize.size16),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Row(
  //                   children: <Widget>[
  //                     Expanded(
  //                       child: Text(
  //                         product.name,
  //                         style: AppTheme.getTextStyle(
  //                             themeData.textTheme.subtitle2,
  //                             fontWeight: 700,
  //                             letterSpacing: 0),
  //                         overflow: TextOverflow.ellipsis,
  //                         maxLines: 2,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   children: <Widget>[
  //                     Generator.buildRatingStar(
  //                         rating: product.rating,
  //                         activeColor: ColorUtils.getColorFromRating(
  //                             product.rating.ceil(), customAppTheme, themeData),
  //                         size: MySize.size16,
  //                         inactiveColor: themeData.colorScheme.onBackground),
  //                     Container(
  //                       margin: EdgeInsets.only(left: MySize.size4),
  //                       child: Text("(" + product.totalRating.toString() + ")",
  //                           style: AppTheme.getTextStyle(
  //                               themeData.textTheme.bodyText1,
  //                               fontWeight: 600)),
  //                     ),
  //                   ],
  //                 ),
  //                 Text(
  //                   product.productItems.length.toString() +
  //                       " " +
  //                       Translator.translate("options_available"),
  //                   style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
  //                       fontWeight: 500),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ));
  // }
}
