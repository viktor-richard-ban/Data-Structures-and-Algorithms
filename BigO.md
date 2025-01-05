# Big O
Big O time is the language and metric we use to describe the efficency of algorithms. 
Time complexity and space complexity measure how the speed of the algorithm or the extra memory an algorithm takes up, how two things change as the size of the input of the algorithm increases.


## Why is Big O Important in Industry?

### Scalability
In production environments, systems often need to handle increasing amounts of data. An algorithm with poor scalability (e.g., O($2^{n}$) or O($n^{2}$)) may be leading to performance bottlenecks.

### Resource Optimization
Understanding the Big O complexity helps in optimizing processing time and memory usage, which is critical in resource-constrained environments like mobile devices, embedded systems, or cloud infrastructures where costs can skyrocket with inefficient algorithms.

### Comparing Algorithms
It provides a standardized way to compare different algorithms and data structures. For example, if you need a fast search operation, you know that a binary search with O(n log n) is more efficent than a linear search with O(n).


## Common Big O Complexities

### O(1): Constant time
The running time is the same regardless of the size of the input. For example, accessing an element in an array by its index takes constant time.<br>
Example: Array indexing

### O(log n): Logarihtmic time
Algorithms with this complexity efficiently cut the problem size in half at each step.<br>
Example: Binary search in a sorted array<br>

$log_{b}$ n = y if and only if $b^{y}$ = n

In coding interviews we only use base 2 so:<br>
 $log_{2}$ n = y if and only if $2^{y}$ = n

When the input n doubles, y only increases by one:<br>
$2^{0}$ = 1<br>
$2^{1}$ = 2<br>
$2^{2}$ = 4<br>
$2^{3}$ = 8<br>
$2^{4}$ = 16<br>
$2^{5}$ = 32<br>

### O(n): Linear time
The running time increases proportionally with the input size. If the input doubles, the time it takes to complete the operation also doubles.<br>
Example: Iterating through an array

### O($n^{2}$): Quadratic time
For example, algorithms that involve nested loops (like comparing all elements in a list) tend to have quadratic complexity.<br>
Example: Bubble sort

### O($2^{n}$): Exponential time
The running time doubles with each additional element in the input.<br>
Example: Recursive Fibonacci (without optimization).

### O(n!): Factorial time
Extremely slow growth, often seen in problems that involve generating all permutations or combinations.<br>
Example: Salesman Problem (brute-force)

![Big O graph](/assets/big-o-graph.png)


## Additional terms

### Amortized time
An ArrayList is implemented with an array. When the array hits capacity, the ArrayList class will create a new array with double the capacity and copy N elements over. This adding will take O(n) time.<br>
It doesn't happen very often. The vast nmajority of the time adding will be in O(1) time.<br>
Amortized time allows us to describe that, yes, this worst case happens every once in a while. But once it happens, it won't happen again for so long that the cost is "amortized".

### Multi-Part Algorithms: Add vs. Multiply
Add the Runtime: O(A + B)<br>
"do this, then, when you are done, do that"

~~~java
void foo(int[] arrA, int[] arrB) {
    for (int a: arrA) {
        print(a)
    }

    for (int b: arrB) {
        print(b)
    }
}
~~~

Multiply the Runtime: O(AB)<br>
"do this for each time you do that"
~~~java
void foo(int[] arrA, int[] arrB) {
    for (int a: arrA) {
        for (int b: arrB) {
            print(b)
        }
    }
}
~~~

### Recursive Runtimes
When we have a recursive function that makes multiple calls, the runtime will often (but not always) look like O($branches^{depth}$)<br>

**branches:** Number of times each recursive call branches<br>
**depth:** How deep of the tree that draws

## Conclusion
Big O notation provides a crucial framework for analyzing and understanding the efficiency of algorithms, especially in industrial applications where scalability and performance are paramount. By recognizing and minimizing time and space complexities, developers can ensure that their systems perform efficiently, even as input sizes grow in real-world scenarios.