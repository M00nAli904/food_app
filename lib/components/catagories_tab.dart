import 'package:flutter/cupertino.dart';
import 'package:food_app/components/catagories_item.dart';
import 'package:food_app/data/catagory_data.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CatagoriesTab extends StatefulWidget {
  const CatagoriesTab({super.key});
  @override
  State<CatagoriesTab> createState() => _CatagoriesTabState();
}
class _CatagoriesTabState extends State<CatagoriesTab> {
  AutoScrollController? _autoScrollController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _autoScrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(CATAGORIES.length, (index) {
            return AutoScrollTag(
              key: ValueKey(index),
              index: index,
              controller: _autoScrollController!,
              child: CatagoriesItem(
                  onTap: () {
                    onSelectCatagory(index);
                  },
                  isActive: CATAGORIES[index]["isActive"],
                  image: CATAGORIES[index]["image"],
                  title: CATAGORIES[index]["title"]),
            );
          }),
        ],
      ),
    );
  }
  onSelectCatagory(index) {
    CATAGORIES.forEach((item) {
      item["isActive"] = false;
    });
    setState(() {
      CATAGORIES[index]["isActive"] = !CATAGORIES[index]["isActive"];
    });
    _autoScrollController!.scrollToIndex(index, preferPosition: AutoScrollPosition.middle);
  }
  init() {
    _autoScrollController = AutoScrollController(
        axis: Axis.horizontal
    );
  }
  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  void dispose() {
    _autoScrollController!.dispose();
    super.dispose();
  }
}
