library core.blocs.user;

import 'dart:async';
import 'dart:convert';

import 'package:b13_flutter/core/blocs/auth/bloc.dart';
import 'package:b13_flutter/core/repositories/user/user_repository.dart';
import 'package:b13_flutter/data/api/model/login_user.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_bloc.dart';
part 'user_events.dart';
part 'user_state.dart';
