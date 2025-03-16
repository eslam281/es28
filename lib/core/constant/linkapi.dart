class AppLink{

  static const String server = "http://10.0.2.2/ecommerce"; //10.0.2.2 =localhost very important

  static const String test ="$server/test.php";

  // ============================== Image =================================//

  static const String imageststatic = "$server/upload";
  static const String cateimages = "$imageststatic/categories/";
  static const String itemsimages = "$imageststatic/items/";

  // ============================== Auth =================================//
  static const String login ="$server/admin/auth/login.php";
  static const String signup ="$server/admin/auth/signup.php";
  static const String verfiycode ="$server/admin/auth/verfiycode.php";
  static const String resend ="$server/admin/auth/resend.php";

// ============================== ForgetPassword =================================//
  static const String forgetpassword ="$server/admin/forgetpassword/checkemail.php";
  static const String verfiycode_password ="$server/admin/forgetpassword/verfiycode.php";
  static const String resetpassword ="$server/admin/forgetpassword/resetpassword.php";

// ============================== Categories =================================//
  static const String categoriesadd ="$server/admin/categories/add.php";
  static const String categoriesedit ="$server/admin/categories/edit.php";
  static const String categoriesview ="$server/admin/categories/view.php";
  static const String categoriesdelete ="$server/admin/categories/delete.php";
  // ============================== Items =================================//
  static const String itemsadd ="$server/admin/items/add.php";
  static const String itemsedit ="$server/admin/items/edit.php";
  static const String itemsview ="$server/admin/items/view.php";
  static const String itemsdelete ="$server/admin/items/delete.php";

// ============================== Orders =================================//
  static const String pending ="$server/admin/orders/view.php";
  static const String archive ="$server/admin/orders/archive.php";
  static const String acceptedOrders ="$server/admin/orders/viewaccepted.php";
  static const String ordersdetails ="$server/orders/details.php";

  static const String approveOrders ="$server/admin/orders/approve.php";
  static const String doneOrders ="$server/admin/orders/prepare.php";


}