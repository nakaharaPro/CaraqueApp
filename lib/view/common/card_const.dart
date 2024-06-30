import 'package:flutter/material.dart';

class CardConst extends StatelessWidget {
  const CardConst({
    super.key,
    required this.assetImageURL,
    required this.contentText,
    required this.descriptionText,
  });

  final String assetImageURL;//画像URL
  final String contentText;//商品名
  final String descriptionText;//商品説明

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Ink.image(
                    image: AssetImage(assetImageURL),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {}, // 画像をタップしたときの動作
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    contentText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                descriptionText,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
}
