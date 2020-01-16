import 'package:flutter/material.dart';
class Constants {
  static   BuildContext mContext;
  static final String BaseURL = "https://stormy-hollows-61383.herokuapp.com";
  static final String LOGIN_URL = BaseURL+"/login";
  static final String SIGNUP_URL = BaseURL+"/registration";
  static final String PROFILE = BaseURL+"/updateprofile";
  static final String BILL = BaseURL+"/addbill";
  static final String CUSTOMER = BaseURL+"/addcustomer";
  // SESSION PARAMETER

  static final String LOGIN_STATUS="LOGIN_STATUS";
  static final String USER_ID="USER_ID";
}