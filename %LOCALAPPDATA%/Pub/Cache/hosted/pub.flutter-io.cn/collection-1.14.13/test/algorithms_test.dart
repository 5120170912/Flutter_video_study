// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Tests algorithm utilities.
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  void testShuffle(List list) {
    var copy = list.toList();
    shuffle(list);
    expect(UnorderedIterableEquality().equals(list, copy), isTrue);
  }

  test('Shuffle 0', () {
    testShuffle([]);
  });
  test('Shuffle 1', () {
    testShuffle([1]);
  });
  test('Shuffle 3', () {
    testShuffle([1, 2, 3]);
  });
  test('Shuffle 10', () {
    testShuffle([1, 2, 3, 4, 5, 1, 3, 5, 7, 9]);
  });
  test('Shuffle shuffles', () {
    var l = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    var c = l.toList();
    var count = 0;
    do {
      shuffle(l);
      if (!const ListEquality().equals(c, l)) return;
      // Odds of not changing the order should be one in ~ 16! ~= 2e+13.
      // Repeat this 10 times, and the odds of accidentally shuffling to the
      // same result every time is disappearingly tiny.
      count++;
      // If this happens even once, it's ok to report it.
      print('Failed shuffle $count times');
      if (count == 10) fail("Shuffle didn't change order.");
    } while (true);
  });
  test('Shuffle sublist', () {
    var l = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    var c = l.toList();
    shuffle(l, 4, 12);
    expect(const IterableEquality().equals(l.getRange(0, 4), c.getRange(0, 4)),
        isTrue);
    expect(
        const IterableEquality().equals(l.getRange(12, 16), c.getRange(12, 16)),
        isTrue);
    expect(
        const UnorderedIterableEquality()
            .equals(l.getRange(4, 12), c.getRange(4, 12)),
        isTrue);
  });

  test('binsearch0', () {
    expect(binarySearch([], 2), equals(-1));
  });

  test('binsearch1', () {
    expect(binarySearch([5], 2), equals(-1));
    expect(binarySearch([5], 5), equals(0));
    expect(binarySearch([5], 7), equals(-1));
  });

  test('binsearch3', () {
    expect(binarySearch([0, 5, 10], -1), equals(-1));
    expect(binarySearch([0, 5, 10], 0), equals(0));
    expect(binarySearch([0, 5, 10], 2), equals(-1));
    expect(binarySearch([0, 5, 10], 5), equals(1));
    expect(binarySearch([0, 5, 10], 7), equals(-1));
    expect(binarySearch([0, 5, 10], 10), equals(2));
    expect(binarySearch([0, 5, 10], 12), equals(-1));
  });

  test('binsearchCompare0', () {
    expect(binarySearch(<C>[], C(2), compare: compareC), equals(-1));
  });

  test('binsearchCompare1', () {
    var l1 = [C(5)];
    expect(binarySearch(l1, C(2), compare: compareC), equals(-1));
    expect(binarySearch(l1, C(5), compare: compareC), equals(0));
    expect(binarySearch(l1, C(7), compare: compareC), equals(-1));
  });

  test('binsearchCompare3', () {
    var l3 = [C(0), C(5), C(10)];
    expect(binarySearch(l3, C(-1), compare: compareC), equals(-1));
    expect(binarySearch(l3, C(0), compare: compareC), equals(0));
    expect(binarySearch(l3, C(2), compare: compareC), equals(-1));
    expect(binarySearch(l3, C(5), compare: compareC), equals(1));
    expect(binarySearch(l3, C(7), compare: compareC), equals(-1));
    expect(binarySearch(l3, C(10), compare: compareC), equals(2));
    expect(binarySearch(l3, C(12), compare: compareC), equals(-1));
  });

  test('lowerbound0', () {
    expect(lowerBound([], 2), equals(0));
  });

  test('lowerbound1', () {
    expect(lowerBound([5], 2), equals(0));
    expect(lowerBound([5], 5), equals(0));
    expect(lowerBound([5], 7), equals(1));
  });

  test('lowerbound3', () {
    expect(lowerBound([0, 5, 10], -1), equals(0));
    expect(lowerBound([0, 5, 10], 0), equals(0));
    expect(lowerBound([0, 5, 10], 2), equals(1));
    expect(lowerBound([0, 5, 10], 5), equals(1));
    expect(lowerBound([0, 5, 10], 7), equals(2));
    expect(lowerBound([0, 5, 10], 10), equals(2));
    expect(lowerBound([0, 5, 10], 12), equals(3));
  });

  test('lowerboundRepeat', () {
    expect(lowerBound([5, 5, 5], 5), equals(0));
    expect(lowerBound([0, 5, 5, 5, 10], 5), equals(1));
  });

  test('lowerboundCompare0', () {
    expect(lowerBound(<C>[], C(2), compare: compareC), equals(0));
  });

  test('lowerboundCompare1', () {
    var l1 = [C(5)];
    expect(lowerBound(l1, C(2), compare: compareC), equals(0));
    expect(lowerBound(l1, C(5), compare: compareC), equals(0));
    expect(lowerBound(l1, C(7), compare: compareC), equals(1));
  });

  test('lowerboundCompare3', () {
    var l3 = [C(0), C(5), C(10)];
    expect(lowerBound(l3, C(-1), compare: compareC), equals(0));
    expect(lowerBound(l3, C(0), compare: compareC), equals(0));
    expect(lowerBound(l3, C(2), compare: compareC), equals(1));
    expect(lowerBound(l3, C(5), compare: compareC), equals(1));
    expect(lowerBound(l3, C(7), compare: compareC), equals(2));
    expect(lowerBound(l3, C(10), compare: compareC), equals(2));
    expect(lowerBound(l3, C(12), compare: compareC), equals(3));
  });

  test('lowerboundCompareRepeat', () {
    var l1 = [C(5), C(5), C(5)];
    var l2 = [C(0), C(5), C(5), C(5), C(10)];
    expect(lowerBound(l1, C(5), compare: compareC), equals(0));
    expect(lowerBound(l2, C(5), compare: compareC), equals(1));
  });

  test('insertionSortRandom', () {
    var random = Random();
    for (var i = 0; i < 25; i++) {
      var list = List(i);
      for (var j = 0; j < i; j++) {
        list[j] = random.nextInt(25); // Expect some equal elements.
      }
      insertionSort(list);
      for (var j = 1; j < i; j++) {
        expect(list[j - 1], lessThanOrEqualTo(list[j]));
      }
    }
  });

  test('insertionSortSubRanges', () {
    var l = [6, 5, 4, 3, 2, 1];
    insertionSort(l, start: 2, end: 4);
    expect(l, equals([6, 5, 3, 4, 2, 1]));
    insertionSort(l, start: 1, end: 1);
    expect(l, equals([6, 5, 3, 4, 2, 1]));
    insertionSort(l, start: 4, end: 6);
    expect(l, equals([6, 5, 3, 4, 1, 2]));
    insertionSort(l, start: 0, end: 2);
    expect(l, equals([5, 6, 3, 4, 1, 2]));
    insertionSort(l, start: 0, end: 6);
    expect(l, equals([1, 2, 3, 4, 5, 6]));
  });

  test('insertionSortSpecialCases', () {
    var l = [6, 6, 6, 6, 6, 6];
    insertionSort(l);
    expect(l, equals([6, 6, 6, 6, 6, 6]));

    l = [6, 6, 3, 3, 0, 0];
    insertionSort(l);
    expect(l, equals([0, 0, 3, 3, 6, 6]));
  });

  test('MergeSortRandom', () {
    var random = Random();
    for (var i = 0; i < 250; i += 1) {
      var list = List(i);
      for (var j = 0; j < i; j++) {
        list[j] = random.nextInt(i); // Expect some equal elements.
      }
      mergeSort(list);
      for (var j = 1; j < i; j++) {
        expect(list[j - 1], lessThanOrEqualTo(list[j]));
      }
    }
  });

  test('MergeSortPreservesOrder', () {
    var random = Random();
    // Small case where only insertion call is called,
    // larger case where the internal moving insertion sort is used
    // larger cases with multiple splittings, numbers just around a power of 2.
    for (var size in [8, 50, 511, 512, 513]) {
      var list = List<OC>(size);
      // Class OC compares using id.
      // With size elements with id's in the range 0..size/4, a number of
      // collisions are guaranteed. These should be sorted so that the 'order'
      // part of the objects are still in order.
      for (var i = 0; i < size; i++) {
        list[i] = OC(random.nextInt(size >> 2), i);
      }
      mergeSort(list);
      var prev = list[0];
      for (var i = 1; i < size; i++) {
        var next = list[i];
        expect(prev.id, lessThanOrEqualTo(next.id));
        if (next.id == prev.id) {
          expect(prev.order, lessThanOrEqualTo(next.order));
        }
        prev = next;
      }
      // Reverse compare on part of list.
      List copy = list.toList();
      var min = size >> 2;
      var max = size - min;
      mergeSort<OC>(list,
          start: min, end: max, compare: (a, b) => b.compareTo(a));
      prev = list[min];
      for (var i = min + 1; i < max; i++) {
        var next = list[i];
        expect(prev.id, greaterThanOrEqualTo(next.id));
        if (next.id == prev.id) {
          expect(prev.order, lessThanOrEqualTo(next.order));
        }
        prev = next;
      }
      // Equals on OC objects is identity, so this means the parts before min,
      // and the parts after max, didn't change at all.
      expect(list.sublist(0, min), equals(copy.sublist(0, min)));
      expect(list.sublist(max), equals(copy.sublist(max)));
    }
  });

  test('MergeSortSpecialCases', () {
    for (var size in [511, 512, 513]) {
      // All equal.
      var list = List(size);
      for (var i = 0; i < size; i++) {
        list[i] = OC(0, i);
      }
      mergeSort(list);
      for (var i = 0; i < size; i++) {
        expect(list[i].order, equals(i));
      }
      // All but one equal, first.
      list[0] = OC(1, 0);
      for (var i = 1; i < size; i++) {
        list[i] = OC(0, i);
      }
      mergeSort(list);
      for (var i = 0; i < size - 1; i++) {
        expect(list[i].order, equals(i + 1));
      }
      expect(list[size - 1].order, equals(0));

      // All but one equal, last.
      for (var i = 0; i < size - 1; i++) {
        list[i] = OC(0, i);
      }
      list[size - 1] = OC(-1, size - 1);
      mergeSort(list);
      expect(list[0].order, equals(size - 1));
      for (var i = 1; i < size; i++) {
        expect(list[i].order, equals(i - 1));
      }

      // Reversed.
      for (var i = 0; i < size; i++) {
        list[i] = OC(size - 1 - i, i);
      }
      mergeSort(list);
      for (var i = 0; i < size; i++) {
        expect(list[i].id, equals(i));
        expect(list[i].order, equals(size - 1 - i));
      }
    }
  });

  test('Reverse', () {
    var l = [6, 5, 4, 3, 2, 1];
    reverse(l, 2, 4);
    expect(l, equals([6, 5, 3, 4, 2, 1]));
    reverse(l, 1, 1);
    expect(l, equals([6, 5, 3, 4, 2, 1]));
    reverse(l, 4, 6);
    expect(l, equals([6, 5, 3, 4, 1, 2]));
    reverse(l, 0, 2);
    expect(l, equals([5, 6, 3, 4, 1, 2]));
    reverse(l, 0, 6);
    expect(l, equals([2, 1, 4, 3, 6, 5]));
  });
}

class C {
  final int id;
  C(this.id);
}

int compareC(C one, C other) => one.id - other.id;

class OC implements Comparable<OC> {
  final int id;
  final int order;
  OC(this.id, this.order);
  @override
  int compareTo(OC other) => id - other.id;
  @override
  String toString() => 'OC[$id,$order]';
}
