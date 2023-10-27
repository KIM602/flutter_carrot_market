import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/200';
}

final user1 = User(
  id: 1,
  nickname: "홍길동",
  temperature: 36.5,
  profileUrl: picSum(1010),
);

final user2 = User(
  id: 2,
  nickname: "바다",
  temperature: 36.5,
  profileUrl: picSum(900),
);

final user3 = User(
  id: 3,
  nickname: "파도",
  temperature: 36.5,
  profileUrl: picSum(700),
);

final product1 = Product(
    user1,
    "아이폰13",
    700000,
    '깨끗하게 잘 쓰떤 물건이에요.'
        '잘 쓰면 좋겠습니다'
        '감사합니다',
    ProductStatus.normal,
    [picSum(200), picSum(201), picSum(202)]);

final product2 = Product(user1, "갤럭시", 1700000, '페이가 아주 편하고, 자동 통화 녹음이 됩니다.',
    ProductStatus.normal, [picSum(500), picSum(501), picSum(502), picSum(503)]);

final product3 = Product(user1, '스마트 티비', 2000, '화질이 아주 좋아요',
    ProductStatus.normal, [picSum(800), picSum(801), picSum(802), picSum(803)]);

final post1 = ProductPost(product1.user, product1, '글의 내용입니다.', const Address('서울시 특별한 주소', '앱동'), 3, 2,
    DateTime.now().subtract(30.minutes));

final post2 = ProductPost(product2.user, product2, '글의 내용입니다.', const Address('서울시 특별한 주소', '플러터동'),
    30, 120, DateTime.now().subtract(30.minutes));

final post3 = ProductPost(product3.user, product3, '글의 내용입니다.', const Address('서울시 특별한 주소', '다트시'),
    10, 350, DateTime.now().subtract(5.minutes));

final postList = [post1, post2, post3, post1, post2, post3];
