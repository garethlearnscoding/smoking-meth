---
layout: default
title: 13 Permutations and Combinations
permalink: /13-permutations-and-combinations/
---

# 13 Permutations and Combinations

# Content
1. Fundamental Principles of Counting
---

>**Notation: Factorial**
><center>
>
>$n! = 1 \cdot 2 \cdot 3 \ldots (n-2)(n-1)n$, where $n \in \mathbb{Z}^{+}$ and $0! = 1$ (by definition)
>
></center>

# 1 Fundamental Principles of Counting

# 1.1 Addition Principle

> **Principle: Addition Principle**
> 
> If there are $r$ options for performing a particular task, and the number of ways to carry out the $k^{\text{th}}$ option is $n_k$, for $k = 1,2,3,4, \ldots,r$, then the total number of ways of performing  the particular task is equal to the number of ways of all the $r$ different options, i.e.,
> 
> $$n_1+n_2+n_3+\ldots+n_r.$$
> 
> **Note**: The options to perform the task cannot occur at the same time.
>
>
><details markdown=1>
><summary><strong>Example</strong></summary>
> <br>
>
> An NJC student has the option of taking 3 different direct buses or taking a taxi to college. How many ways can she go to school?
>
> *Solution:*
>
> $\text{Mode (Option) of transport} = \begin{cases} \text{Bus} &\rightarrow 3 \quad \text{ways} \\ \text{Taxi} &\rightarrow 1 \text{way} \quad \end{cases}$
>
> $\text{Total number of ways} = 3 + 1 = 4$
>
></details>

# 1.2 Multiplication Principle

> **Principle: Multiplication Principle**
> 
> If one task can be performed in $m$ ways, and following this, a second task can be performed in $n$ ways (regardless of which way the first task was performed), then the number of ways of performing the two tasks in succession is equal to product of the number of ways for both the tasks, i.e.,
> $$m \times n$$
> 
> **Note**: This can be applied to two or more tasks performed independently in succession.
>
> <details markdown=1>
> <summary><strong>Example</strong></summary>
> <br>
>
> An NJC student has 2 cross 2 legs of a distance to go from atrium to multipurpose court. The student has 3 ways to cross the first leg of the distance. Upon crossing the first leg of the distance, the student now has 4 ways to cross the second leg of the distance, the remaining distance to multipurpose court.
>
> *Solution:*
>
> $\text{Total number of ways to walk both legs} = 3 \times 4 = 12$ 

# 2 Permutations

**Definition: Permutations**
<div class=indented markdown=1>

A permutation is an ordered arrangement of objects.

</div>

# 2.1 Permutations of $n$ Distinct Objects in a Row

**Disclaimer**: I lazy type the problem, so refer to drive if you need

**Result: Permutations of $n$ Distinct Objects in a Row**

Given $n$ distinct objects, the total number of ways of arranging all these $n$ objects in a row can be deduved as:

$$\begin{array}{ccccccc}n&n-1&n-2&\dots&3&2&1\\ \uparrow& & & & & & \uparrow \\ \text{Number of ways to fill the}\end{array}$$
