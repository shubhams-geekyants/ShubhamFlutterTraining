bool getTaxi(double distace){
  double onlineTaxiBaseFair = 40.0, onlineTaxiAddonFair = 10.0;
  double classicTaxiBaseFair = 30.0, classicTaxiSpeed = 80.0, classicTaxiAddonFair = 15.0;
  double baseDistance = 20.0;
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