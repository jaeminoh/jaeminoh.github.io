---
layout: post
title: 'probability?'
use_math: true
author: 오재민
tags:[mathematics, probability]
---

# 확률을 어떻게 정의하지?

 표본공간 $\Omega$ 에서 $\mathbb{R}$ 로 가는 확률변수 $X$ 의 값이 $[a,b]$ 에 포함되어있을 확률을 계산하고 싶다. 즉 $P(a \leq X \leq b)$ 를 계산하고 싶다는 얘기다. 이를 어떻게 명확히 정의할 수 있을까? 

 고등학교 확률과 통계 시간에 배운대로 계산을 진행해보자. 만약 $X$ 가 확률밀도함수 $f$ 가 주어진 연속확률분포를 따른다고 할 때, $P(a \leq X \leq b) = \int_a^bf(x)dx$ 로 계산할 수 있다. 만약 $X$ 가 확률질량함수 $p$ 가 주어진 이산확률분포를 따른다고 할 때, $P(a \leq X \leq b) = \sum_{k=1}^n p(x_i)$ 로 계산할 수 있다. 확률분포는 어디서 나오는 개념이고 $f, p$ 는 또 어디서 나왔는지 대략적으로 감을 잡을 수 있겠지만, 이렇게 정의하게 된 배경에 대해 궁금하지 않을 수 없다. 

 $X$ 에 주어진 확률분포가 다르면 $P(a \leq X \leq b)$ 가 (그 생김새는 똑같지만) 다른 값을 가질 수 있음을 경험적으로 알고 있다. 하지만, $X$ 에 주어진 확률분포가 같을 때, $P(a \leq X \leq b)$ 의 값이 다르다면 $P$ 는 잘 정의된 함수라고 할 수 없다. 따라서 $P(a \leq X \leq b)$ 의 값을 결정하는 것은 $a, b$ 를 제외하고 함수 $X$ 에 달려 있다고 볼 수 있으며, $P$ 는 고정된 어떤 함수로 여기는 것이 타당하다. 그럼 $P$ 는 어떤 함수가 되어야 할까?

 $P$ 라는 함수를 알아보려면, 정의역과 공역에 대해 알아보는 것이 가장 먼저 해야할 일이다. $P$ 의 함숫값은 확률을 나타내기 때문에 공역이 $[0, 1]$ 이란 것은 바로 알 수 있다. 정의역은 어떻게 될까? 흘긋 보면, $a, b$ 에 따라 값이 달라지니까 $\mathbb{R}^2$ 라고 하면 된다고 생각할 수 있다. 그러나 함수 $X$ 에 따라서 $P$ 의 값이 달라질 수 있으므로 $\mathbb{R}^2$ 로는 부족하다. 

 $P$ 의 정의역을 알기 위해서, $a \leq X \leq b$ 란 표현에 대해 생각해 볼 필요가 있다. 사실 저 표현은 축약된 것으로, $\omega \in \Omega$ 에 대하여 $a \leq X(\omega) \leq b$ 를 나타낸다. 즉 $P(a \leq X \leq b)$ 는 사실 $P(\{\omega : a\leq X(\omega) \leq b \})$ 를 나타낸다고 볼 수 있으며 조금 줄여서 $P(X^{pre}([a, b]))$ 라고 쓸 수 있다. 이를 풀어쓰면 표본공간의 원소 $\omega$ 가 확률변수 $X$ 에 의해 구간 $[a, b]$ 에 들어갈 확률이다. 이로부터 $P$ 의 정의역은 $\Omega$의 부분집합들의 모임, 즉 $2^{\Omega}$ 의 부분집합이라고 할 수 있다. 

 앞에서 살펴본 대로, $P$ 는 집합에 $[0, 1]$ 사이의 값을 부여하는 함수이다. 이런 경우를 주로 다루는 수학적 이론으로 'measure theory'가 떠오를 것이다. 즉 $P$ 는 measure가 되고, 정의역은 $\mathcal{F}:$ $\sigma$-algebra on $\Omega$ 가 된다. $P(X^{pre}([a, b]))$ 를 계산하기 위해서, $X^{pre}([a, b])$ 라는 집합이 $P$ 의 정의역($\mathcal{F}$)에 포함되어야 하며, 이는 곧 $X$ 가 $\mathcal{F}$-measurable 이어야 함을 의미한다. 

 $P, X$ 가 주어지면 자연스럽게 실수 위의 measure $\mu : \mathcal{R} \rightarrow [0,1]$ 를 도출해낼 수 있다. (단, $\mathcal{R}$ 은 Borel algebra of $\mathbb{R}$) $\mu = P \circ X^{-1}$ 를 distribution 이라고 하며, 각 Borel set $A$ 에 대하여 $\mu(A) = P(X \in A)$ 를 계산해 주기 때문에, 확률변수 $X$ 가 어떻게 분포되었는지를 나타낸다.

 한편 $F: \mathbb{R} \rightarrow [0, 1]$, $F(x) = \mu((-\infty, x])$ 를 distribution function 이라고 한다. 이 함수는 nondecreasing, right-continuous 해서 Stieltjes measure function 이라고 할 수 있으며, Carathéodory extension에 의해 $\mu$로 unique 하게 확장될 수 있다. $F(x) = \int_{-\infty} ^ x f(t) dt$ 로 표현되면 $f$ 를 probability density function (확률밀도함수) 라고 이야기한다. 

 끝으로 갈 수록 아는게 부족해 설명을 자세하게 적지 못했는데, 언젠가 반드시 글을 다듬으러 올 것이다.