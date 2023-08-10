import 'package:flutter/material.dart';

Image image;

class Category {
  int categoryId;
  String categoryName;
  String categoryDesc;
  int parent;
  Image image;

Category({
this.categoryId,
this.categoryName,
this.categoryDesc,
this.image,
});

Category.fromJson(Map<String, dynamic> json) {
  categoryId = json['id'];
  categoryName = json['name'];
  categoryDesc = json['desc'];
  parent = json['parent'];
  // image = json['image'] != null? new Image.fromJson(json['image']): null;
}

}
