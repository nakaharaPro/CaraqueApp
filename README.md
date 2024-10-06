### dev
flutter run --flavor dev -t lib/main_dev.dart
 
### prod
flutter run --flavor prod -t lib/main_prod.dart


flutter analyze .

## 自動生成
flutter pub run build_runner build --delete-conflicting-outputs


## Cloid Funcitons
firebase deploy --only functions

## 注意
メール送信機能はappleの標準メールツールを使用してメールを送信するため、標準メールツールに何かしらのメールを登録して使用できるようにしておく必要がある。

画面遷移はrouterのget_pages.dartにも追記する

