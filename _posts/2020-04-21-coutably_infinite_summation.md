---
layout: post
title: "countably infinite summation"
tags: [mathematics, analysis]
author: 오재민
use_math: true
---

# 왜 하필 countably infinite sum?

 주어진 $\sigma$-algebra $\mathcal{F}$에서 정의된 측도 $\mu : \mathcal{F} \rightarrow [0, \infty]$는 다음 두 가지를 만족한다.

1. $\mu(\empty) = 0$
2. $\mu$ is countably additive, i.e. for given disjoint set sequence $A_i \in \mathcal{F}$, $\mu(\bigcup_{i=1}^\infty A_i) = \sum_{i=1}^\infty \mu(A_i)$



처음 이 정의를 접했을 때, 2번 조건이 필요한 이유는 단지 $\sigma$-algebra가 $\sigma - \cup$ closed이기 때문이라고 생각했다. countably additive로부터 단조성이나, (finitely)additive, continuity from below 등 여러 성질들을 도출해 낼 수 있다는 것은 측도론을 다루는 책에 대부분 소개되어 있다. 그렇다면, 자연스럽게 uncountably additive를 만족하는 측도는 훨씬 더 좋은 성질들이 많지 않을까란 생각을 해 볼 수 있다.

그러나 다음과 같은 사실이 알려져 있다.

​	Let $S$ be a set of uncountably many positive real numbers and $m$ be a positive real number. Then there exists finite subset $T$ of $S$ such that $\sum_{t\in T} t > m$. 

증명 : $S_i = S \cap (i-1, i]$ 라고 하자.  그러면 $\bigcup_{i=1}^\infty S_i = S$ 를 만족함을 손쉽게 알 수 있다. 만약 각 $S_i$ 가 countable set 이라면 $S$ 는 countable 집합의 countable 합집합이기 때문에 countable 집합이 되어야 한다. 이는 S가 uncountable 이란 사실에 모순이 되기 때문에 적어도 한 $i \in \mathbb{N}$ 에 대하여 $S_i$ 는 uncountable이어야 한다. 이 때, 일반성을 잃지 않고 $S_1$ 가 uncountable set이라고 하자. 마찬가지 논리로, $S_1 = \bigcup_{n=1}^\infty S_1 \cap ({1\over n+1}, {1 \over n}]$ 임을 알 수 있고, 저 중 적어도 하나의 $n\in \mathbb{N}$ 에 대하여 $S_{1, n} = S_1 \cap ({1\over n+1}, {1 \over n}]$ 는 uncountable set이다. 이제 $S_{1, n}$ 에서 $(n+1) \times M$ (단, $m \leq M \in \mathbb{N}$) 개의 원소를 선택하여 T라고 하면 그 합은 $m$ 보다 크다.



즉, 어떤 uncountably infinite summation of positive real numbers는 항상 발산한다는 말이다. 이로 말미암아 0보다 작지 않은 실수들의 '무한합'이 의미를 가지는 경우는 오직 countably infinite summation일 경우라는 것을 알아챌 수 있다.

따라서 uncountably additive를 만족하는 측도는 우리의 고려대상이 아니란 것을 확인할 수 있다.



이에 더하여, uncountable set $X$ 의 power set $2^X$ 에 적당한 measure를 줄 수 없기 때문에 $\sigma$-algebra를 고려해야 한다는 글도 어디선가 읽었었는데, 그건 나중에 알아보자.



