//商品の情報はここで一元化
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';

class PageInfo{
  static LSDMap productState = [
   { 'page':"page1",'favoriteState':false,'title':"和三棒",'imagePath':'assets/images/caraque1.jpg','allergie':"",'discription':"和三盆糖使用のクッキー"},
   { 'page':"page2",'favoriteState':false,'title':"ボルボローネ",'imagePath':'assets/images/caraque2.jpg','allergie':"アーモンド",'discription':"スペイン初の幸せを運ぶお菓子"},
    { 'page':"page3",'favoriteState':false,'title':"エンガディーナ",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"クルミとアーモンドぎっしりスイスの伝統菓子"},
    { 'page':"page4",'favoriteState':false,'title':"シトロン",'imagePath':'assets/images/caraque3.jpg','allergie':"",'discription':"爽やかなレモンが効いたクッキー"},
    { 'page':"page5",'favoriteState':false,'title':"キャラメルリング",'imagePath':'assets/images/caraque3.jpg','allergie':"",'discription':"サクサクのパイに香ばしいキャラメルヌガー"},
    { 'page':"page6",'favoriteState':false,'title':"クグロフ",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"アンズとクルミのバターケーキ"},
    { 'page':"page7",'favoriteState':false,'title':"マドレーヌ",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご",'discription':"定番の焦がしバターの香りマドレーヌ"},
    { 'page':"page8",'favoriteState':false,'title':"チョコット",'imagePath':'assets/images/caraque3.jpg','allergie':"",'discription':"ヘーゼルナッツのチョコをチョコクッキーにサンド"},
    { 'page':"page9",'favoriteState':false,'title':"島レモン",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご",'discription':"瀬戸内レモンと小豆島オリーブ漬け"},
    { 'page':"page10",'favoriteState':false,'title':"アモチョコ",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"チョコレートを練り込んだアーモンドチョコクッキー"},
    { 'page':"page11",'favoriteState':false,'title':"和三盆Cake",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご",'discription':"和三盆糖を使用したパウンドケーキ"},
    { 'page':"page12",'favoriteState':false,'title':"チョコマドレーヌ",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"チョコチップ入りマドレーヌ"},
    { 'page':"page13",'favoriteState':false,'title':"胡麻フロランタン",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご",'discription':"キャラメリゼした胡麻がたっぷりクッキー"},
    { 'page':"page14",'favoriteState':false,'title':"フロランタン",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"オレンジピール入りクッキーにキャラメルアーモインドクッキー"},
    { 'page':"page15",'favoriteState':false,'title':"クランベリー&木の実",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"クランベリーとカシューナッツ、紅茶と木の実が2枚ずつ入ったクッキー"},
    { 'page':"page16",'favoriteState':false,'title':"チョコブラウニー",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご",'discription':"クルミとチョコレートを練り込んだケーキ"},
    { 'page':"page17",'favoriteState':false,'title':"紅茶アールグレイ",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご",'discription':"生クリームが効いたロイヤルミルクティーのケーキ"},
    { 'page':"page18",'favoriteState':false,'title':"マンデル",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"アーモンドスライスたっぷりのクッキー"},
    { 'page':"page19",'favoriteState':false,'title':"キャラメル",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご",'discription':"キャラメル味が人気のしっとりケーキ"},
    { 'page':"page20",'favoriteState':false,'title':"フルーツスパイス",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド、お酒",'discription':"ドライフルーツ、ナッツ、クローブジンジャー、シナモン、ラム酒を使用したケーキ"},
    { 'page':"page21",'favoriteState':false,'title':"フィナンシェ",'imagePath':'assets/images/caraque3.jpg','allergie':"たまご、アーモンド",'discription':"人気の焦がしバターたっぷりのフィナンシェ"},
  ];

}