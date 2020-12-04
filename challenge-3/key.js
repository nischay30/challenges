function returnValue (object, key) {
  let intermediateObject = object;  // Intermediate object for each Iterations
  const keyArray = key.split("/")  // Split the keys for iteration of value
  for(let i =0; i < keyArray.length ; i++) {
    intermediateObject = intermediateObject[keyArray[i]]
  }
  return intermediateObject;  // Final Value
}

module.exports = returnValue;
