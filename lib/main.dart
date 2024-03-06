import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:infinte_list/app.dart';
import 'package:infinte_list/post_observer.dart';

void main() {
  Bloc.observer = PostObserver();
  runApp(const App());
}
