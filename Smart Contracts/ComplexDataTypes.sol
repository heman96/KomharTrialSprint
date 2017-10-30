pragma solidity ^0.4.0;

contract MappingEnumStruct {
 
 // Storage
 mapping(string => string)  capitals;

 // Enumeration
 enum continents {Africa,Antartica,Asia,Australia,Europe,North_America, South_America}

 // Country
 struct country {
   bytes32    name;
   continents continent;
   uint16      populationInMillion;
 }
 
 
 // Only countries in Europe added to this array
 country[]  europeanCountries;

  // Get the country data
 function getEuropeanCountry(bytes32 name) constant returns (bytes32, uint8, uint16) {
  // Let's do a linear search to find the ctry
  for(uint8 i = 0; i < europeanCountries.length; i++){
    if(name == europeanCountries[i].name){
      return (europeanCountries[i].name, 
              uint8(europeanCountries[i].continent),
              europeanCountries[i].populationInMillion);
    }
  }
 }
 
 function addEuropeanCountry(bytes32 nm, uint8 cont, uint16 pop) returns (bool) {
  if(cont != uint8(continents.Europe)) return false;

  country memory ctry;
  //Initializing this struct
  ctry.name = nm;
  ctry.continent = continents(cont);
  ctry.populationInMillion = pop;
  // Push the country in the array
  europeanCountries.push(ctry);
  return true;
 } 



 function addCapital(string country, string capital){
   // Store the capital on per country basis
   capitals[country] = capital;
 }
 // Returns the capital for the country 
 function getCapital(string country) constant returns (string){
   return capitals[country];
 }
 // Remove the key value pair from the mapping
 function removeCapital(string country){
   delete(capitals[country]);
 }

 // get the value at specified index
 function getContinent(uint8 arg) constant returns (string){
  if(arg == uint8(continents.Africa)) return "Africa";
  if(arg == uint8(continents.Antartica)) return "Antartica";
  if(arg == uint8(continents.Asia)) return "Asia";
  if(arg == uint8(continents.Australia)) return "Australia";
  if(arg == uint8(continents.Europe)) return "Europe";
  if(arg == uint8(continents.North_America)) return "North America";
  if(arg == uint8(continents.South_America)) return "South America";
 }

}
