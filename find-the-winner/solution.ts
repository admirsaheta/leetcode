function findTheWinner(n: number, k: number): number {
  const friends = Array.from({ length: n }, (_, i) => i + 1);
  let index = 0;

  while (friends.length > 1) {
    index = (index + k - 1) % friends.length;
    friends.splice(index, 1);
  }

  return friends[0];
}
