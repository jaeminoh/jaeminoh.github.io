---
layout: post
title: "Hadamard Factorization"
author: Jaemin Oh
tags: [mathematics, complex function theory]
use_math: true
---

# about the Hadamard Factorization Theorem

 9.3은, 앞에서 자주 다뤄왔던 주제의 연장이다. 어떤 entire function의 growth rate이 polynomial rate이면 polynomial이고 따라서 finite 개의 zero를 가짐을 3단원에서 공부했다. 또한 9.1단원에서 blaschke product를 통해, bounded holomorphic function on unit disc면 그 zero들과 boundary까지 거리의 합이 빠른 속도로 0에 다가감을 공부했다. (여기서 빠른 속도라 함은, $$\sum (1- |a_k | ) < \infty$$ 를 의미함.) 

In short, we have studied the relation between  growth rate of certain class of holomorphic functions and its distribution of zeros.

 First, define the order of entire function $f$ as follows: $$\lambda (f) = \inf \{a: \text{there is }r>0 \text{ such that } |f(z)| \leq \exp(|z|^a) \text{ for all }|z| \geq r\}$$

 Order of $f$ describes the growth rate of $f$ as $|z| \rightarrow \infty$.

To derive the below, we should catch some lemma: the number of zeros in disc of radius $r$ is controlled by the maximum modulus of $f$ at the circle of radius $2r$, i.e. $n(r) \log 2 \leq \log M(2r)$.

 Then, we can derive striking theorem: $$\sum |a_n|^{-\lambda - \delta} < \infty$$ for each $\delta > 0$ where $a_n$ is zero of $f$.

 Why is it striking? Because the series describes 'velocity' of zeros approaching to $\infty$.

Using the above theorem, we can derive the Hadamard factorization theorem, i.e. $f(z) = c z^m e^{g(z)} P(z)$ where $g$ is polynomial of degree at most $p$, and $P$ is Weierstrass canonical product with rate $p$.

What is $p$? It is called the rank of $f$. It is the smallest integer which makes $\sum |a_n| ^{-p -1} < \infty$.

Genus of $f$ is the maximum of rank of $f$ and degree of polynomial $g$. (actually, genus $\leq$ rank $\leq$ genus + 1)



Using the hadamard factorization theorem, we can get more striking result:

If $f$ is an entire function of finite order, then $f$ assumes every value in its range infinitely many.

The other is the following:

If $f$ is an entire function of finite order but order is not integer, then $f$ can omit at most 1 value in entire complex plane.

