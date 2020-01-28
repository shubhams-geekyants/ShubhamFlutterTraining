bool getTaxi(double distace){
  // ignore: omit_local_variable_types
  double onlineTaxiBaseFair = 40.0, onlineTaxiAddonFair = 10.0;
  // ignore: omit_local_variable_types
  double classicTaxiBaseFair = 30.0, classicTaxiSpeed = 80.0, classicTaxiAddonFair = 15.0;
  // ignore: omit_local_variable_types
  double baseDistance = 20.0;
  // ignore: omit_local_variable_types
  double onlineFair = 0, offlineFair = 0;
  if(distace > baseDistance) {
    onlineFair += onlineTaxiBaseFair * baseDistance;
    offlineFair += classicTaxiBaseFair * baseDistance;
    distace -= baseDistance;
    onlineFair += distace * onlineTaxiAddonFair;
    offlineFair += (distace / classicTaxiSpeed * 60)*classicTaxiAddonFair + distace * classicTaxiAddonFair;
  } else {
    onlineFair += onlineTaxiBaseFair * distace;
    offlineFair += classicTaxiBaseFair * distace;
  }
  if(onlineFair > offlineFair){
    return false;
  }else{
    return true;
  }
}