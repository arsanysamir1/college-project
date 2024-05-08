import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final Map<int, comments> myComment = {};
final comment1 = FirebaseFirestore.instance.collection("comment");

class comments {
  String _comment = '',
      _commenterId = '',
      _commentId = '';

  void addcomment(comments comment) {
    myComment[myComment.values.length] = comment;
  }

  String get comment => _comment;

  String get commenterId => _commenterId;

  String get commentId => _commentId;

  void getIntialized(comment,
      commnterId,
      commentId, length) {
    if (myComment.length < length) {
      comments comment1 = comments();
      comment1._comment = comment;
      comment1._commenterId = commnterId;
      comment1._commentId = commentId; //done
    }
  }
}