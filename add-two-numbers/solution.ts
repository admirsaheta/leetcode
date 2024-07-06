interface ListNode {
  val: number;
  next: ListNode | null;
}

class ListNodeClass implements ListNode {
  val: number;
  next: ListNode | null;
  constructor(val: number) {
    this.val = val;
    this.next = null;
  }
}

function addTwoNumbers(
  l1: ListNode | null,
  l2: ListNode | null
): ListNode | null {
  let dummyHead = new ListNodeClass(0);
  let curr = dummyHead;
  let carry = 0;

  while (l1 !== null || l2 !== null) {
    let sum = carry;
    if (l1 !== null) {
      sum += l1.val;
      l1 = l1.next;
    }
    if (l2 !== null) {
      sum += l2.val;
      l2 = l2.next;
    }
    carry = Math.floor(sum / 10);
    curr.next = new ListNodeClass(sum % 10);
    curr = curr.next;
  }

  if (carry > 0) {
    curr.next = new ListNodeClass(carry);
  }

  return dummyHead.next;
}

let l1 = new ListNodeClass(2);
l1.next = new ListNodeClass(4);
l1.next.next = new ListNodeClass(3);

let l2 = new ListNodeClass(5);
l2.next = new ListNodeClass(6);
l2.next.next = new ListNodeClass(4);

console.log(addTwoNumbers(l1, l2)); 

let l3 = new ListNodeClass(9);
l3.next = new ListNodeClass(9);
l3.next.next = new ListNodeClass(9);
l3.next.next.next = new ListNodeClass(9);
l3.next.next.next.next = new ListNodeClass(9);
l3.next.next.next.next.next = new ListNodeClass(9);
l3.next.next.next.next.next.next = new ListNodeClass(9);

let l4 = new ListNodeClass(9);
l4.next = new ListNodeClass(9);
l4.next.next = new ListNodeClass(9);
l4.next.next.next = new ListNodeClass(9);

console.log(addTwoNumbers(l3, l4));
