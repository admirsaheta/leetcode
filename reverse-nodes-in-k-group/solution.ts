/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

class ListNodeImpl implements ListNode {
  val: number;
  next: ListNode | null;

  constructor(val?: number, next?: ListNode | null) {
    this.val = val === undefined ? 0 : val;
    this.next = next === undefined ? null : next;
  }
}

function reverseLinkedList(head: ListNode | null, k: number): ListNode | null {
  let prev: ListNode | null = null;
  let curr: ListNode | null = head;

  while (k > 0 && curr !== null) {
    let next: ListNode | null = curr.next;
    curr.next = prev;
    prev = curr;
    curr = next;
    k--;
  }

  return prev;
}

function hasKNodes(curr: ListNode | null, k: number): boolean {
  while (k > 0 && curr !== null) {
    curr = curr.next;
    k--;
  }
  return k === 0;
}

function reverseKGroup(head: ListNode | null, k: number): ListNode | null {
  if (head === null || k <= 1) return head;

  let dummy: ListNode = new ListNodeImpl(0, head);
  let groupPrev: ListNode | null = dummy;

  while (groupPrev !== null && hasKNodes(groupPrev.next, k)) {
    let groupEnd: ListNode | null = groupPrev.next;
    if (groupEnd === null) {
      break;
    }

    let nextGroupStart: ListNode | null = groupEnd;
    for (let i = 0; i < k && nextGroupStart !== null; i++) {
      nextGroupStart = nextGroupStart.next;
    }

    let newGroupHead: ListNode | null = reverseLinkedList(groupEnd, k);

    groupPrev.next = newGroupHead;
    groupEnd.next = nextGroupStart;

    groupPrev = groupEnd;
  }

  return dummy.next;
}

function printList(head: ListNode | null): void {
  let curr: ListNode | null = head;
  let result: string = "";
  while (curr !== null) {
    result += curr.val + " -> ";
    curr = curr.next;
  }
  console.log(result + "null");
}
