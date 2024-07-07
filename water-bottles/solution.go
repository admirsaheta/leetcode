func numWaterBottles(numBottles int, numExchange int) int {
    totalDrunk := numBottles
    
    for numBottles >= numExchange {
        newBottles := numBottles / numExchange
        remainingEmptyBottles := numBottles % numExchange
        totalDrunk += newBottles
        numBottles = newBottles + remainingEmptyBottles
    }
    
    return totalDrunk
}