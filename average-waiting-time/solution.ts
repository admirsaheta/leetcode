function averageWaitingTime(customers: number[][]): number {
  let currentTime = 0;
  let totalWaitingTime = 0;

  for (const customer of customers) {
    const arrivalTime = customer[0];
    const preparationTime = customer[1];

    if (currentTime < arrivalTime) {
      currentTime = arrivalTime;
    }

    currentTime += preparationTime;

    totalWaitingTime += currentTime - arrivalTime;
  }

  return totalWaitingTime / customers.length;
}
