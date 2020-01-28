bool getTaxi(double distance){
  // ignore: omit_local_variable_types
  double onlineTaxiBaseFair = 40.0, onlineTaxiAddonFair = 10.0;
  // ignore: omit_local_variable_types
  double classicTaxiBaseFair = 30.0, classicTaxiSpeed = 80.0, classicTaxiAddonFair = 15.0;
  // ignore: omit_local_variable_types
  double baseDistance = 20.0;
  // ignore: omit_local_variable_types
  double onlineFair = 0, offlineFair = 0;
  if(distance > baseDistance) {
    onlineFair += onlineTaxiBaseFair * baseDistance;
    offlineFair += classicTaxiBaseFair * baseDistance;
    distance -= baseDistance;
    onlineFair += distance * onlineTaxiAddonFair;
    offlineFair += (distance / classicTaxiSpeed * 60)*classicTaxiAddonFair + distance * classicTaxiAddonFair;
  } else {
    onlineFair += onlineTaxiBaseFair * distance;
    offlineFair += classicTaxiBaseFair * distance;
  }
  if(onlineFair > offlineFair){
    return false;
  }else{
    return true;
  }
}