class GraphQLQuery{
  String validateOtp(String deviceId, String code){
    return '''
      query{
        validateOtp(
          deviceId: "$deviceId",
          code: "$code"
        ){
          isValid
          message
          token
        }
      }
    ''';
  }
  String login({String mobileNumber, String password}){
    return '''
      query{
        login(
          mobileNumber: "$mobileNumber",
          password: "$password"
        ){
          isLoggedIn
          message
          refreshToken
          accessToken
        }
      }
    ''';
  }
  String getUser(){
    return '''
      query{
        getUser{
          isLoggedIn
          message
          name
          email
          mobileNumber
        }
      }
    ''';
  }
}