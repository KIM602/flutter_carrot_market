import 'package:fast_app_base/data/network/daang_api.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productPostProvider = AutoDisposeFutureProviderFamily<ProductPost, int>((ref, id) async {
  return await DaangnApi.getPost(id);
});