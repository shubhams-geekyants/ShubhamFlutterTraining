class GraphQLMutation {
  String sendOtp({String deviceId, String mobileNumber}){
    return '''
      mutation{
        sendOtp(deviceId: "$deviceId", mobileNumber: "$mobileNumber"){
          isGenerated
          message
          token
        }
      }
    ''';
  }
  String addUser(String deviceId, String email,
      String name, String password){
    return '''
      mutation{
        addUser(
          deviceId: "$deviceId",
          email: "$email",
          name: "$name",
          password: "$password",
        ){
          isAdded
          message
          refreshToken
          accessToken
        }
      }
    ''';
  }
}