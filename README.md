### dev
flutter run --flavor dev -t lib/main_dev.dart
 
### prod
flutter run --flavor prod -t lib/main_prod.dart


flutter analyze .

## 自動生成
flutter pub run build_runner build --delete-conflicting-outputs


## Cloid Funcitons
firebase deploy --only functions

## セッション45