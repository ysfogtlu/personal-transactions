String devClientId = '6c9704c9838ed312a20853a027c34156';
String devClientSecret = 'api key will come here when the application is approved';
String customerNumber = '1234567890';
String devApiHost = 'https://apigw.vakifbank.com.tr:8443';
String authorization = '/oauth2/authorize';
String transaction = '/accountTransactions'; //method:post, scope:account
String accountList = '/accountList'; //method:post, scope:account
String redirectLink = 'pocketBudgetTest.app://oauth2redirect';

String get apiHost {
  bool isProd = const bool.fromEnvironment('dart.vm.product');
  if (isProd) {
    return 'prod api';
  }

  return devApiHost;
}

String get clientId {
  bool isProd = const bool.fromEnvironment('dart.vm.product');
  if (isProd) {
    return 'prod cliend id';
  }

  return devClientId;
}
