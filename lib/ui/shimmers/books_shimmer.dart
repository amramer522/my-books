import 'package:flutter/material.dart';
import 'package:my_books/core/ui/app_shimmer.dart';
import 'package:my_books/res/colors.dart';

class BooksViewShimmer extends StatelessWidget {
  const BooksViewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
        child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 195 / 300,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: AppColors.shimmerItemBgLight,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        color: AppColors.shimmerItemBgDark,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 15,
                                decoration: BoxDecoration(
                                    color: AppColors.shimmerItemBgDark,
                                    borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:  Icon(
                                Icons.favorite_border,
                                color: AppColors.shimmerItemBgLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            itemCount: 6));
  }
}
