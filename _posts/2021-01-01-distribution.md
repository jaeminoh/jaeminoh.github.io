---
layout: post
title: "motivation for distribution theory"
author: Jaemin Oh
tags: [mathematics, analysis]
use_math: true
---

# 초함수(distribution)

 실변수함수론 Qual을 준비하면서, 급하게 초함수에 대한 내용을 정리하고 있다. 매우 흥미로운 개념이었지만, 이걸 어떻게 활용할 수 있을지 도무지 감을 잡기가 힘들었는데, 친구의 설명을 듣고 조금 느낌이 와서 기록으로 남기고자 한다.

 $C_c^\infty (\mathbb{R}^d)$는 compactly supported smooth function on $d$-dimensional Euclidean space의 집합이다. 다루기 굉장히 용이한 집합이다. 특징으로는, 모든 $L_p$공간들에 대하여 해당 집합이 dense하다($1\leq p < \infty$). molification을 통해 해당 성질을 보일 수 있다. 저 집합을 앞으로 $D$라고 쓰겠다.

 초함수들의 집합은 $D^*$이라고 쓴다. 별표가 붙은 것에서 눈치챌 수 있듯이, $D$의 dual space라고 생각할 수 있는데, 조건이 좀 더 붙는다. $F \in D^*$는 continuous linear functional on $D$로, $F(\phi_i) \rightarrow F(\phi)$ whenever $\phi_i \rightarrow \phi$ in $D$를 만족해야 한다.

 초함수를 정의하고 나면, 반드시 다음 예시를 마주칠 것이다. $g \in L_1^{loc}$에 대해 $F_g(\phi) = \int g(x)\phi(x)dx$로 정의되는 초함수 $F_g$. 저게 초함수인 것은 간단하게 체크할 수 있다. 이 예시는 초함수의 operation에 대한 정의의 motivation이 되니 꼭 기억해둘 필요가 있다.

 가장 기초적인 operation으로, multiplication with $\psi \in D$, translation, reflection, derivative, convolution이 있는데, 그 중 derivative를 살펴보자. multi-index $\alpha$에 대하여 $\partial_x^\alpha F(\phi) = (-1)^{\mid \alpha \mid}F(\partial_x^\alpha \phi)$로 정의된다. 위에 반드시 기억해야 하는 예시 $F_g$에 대입하여, 부분적분을 사용해보면 굉장히 자연스러운 정의라는 것을 느낄 수 있다. 

 derivative operation이 중요한 이유는, $g$가 smooth하지 않더라도 항상 위 operation은 정의가 된다는 것이다. 이를 weak derivative(약한 도함수) 혹은 distributional derivative(초함수적 도함수)라고 한다. 편미분방정식의 관점에서 보면 일반적인 함수 $g$ 대신 $F_g$를 어떤 편미분방정식의 해로 생각할 수 있다는 이야기다. 편미분방정식을 풀 때 convolution이나, fourier transform을 자주 사용해서 풀기 때문에, 해당 operation들이 정의될 수 있는 초함수들의 공간에서 편미분방정식을 푸는 것은 solution 집합의 범위를 크게 넓혀주는 것으로 이해할 수 있다.

 다만 걱정스러운 부분은, 초함수가 일반적인 함수가 아니라는 것이다. linear functional이니까 함수는 맞는데, 우리가 원하는 편미분방정식의 해는 $d$-dimensional Euclidean space위에 정의된 함수다. 근데 초함수는 $D$위에 정의된 함수이다. 따라서 편미분방정식을 만족하는 초함수를 찾았다면, 그 초함수를 통상적인 함수로 해석할 필요가 있다.

 $D$에 적당한 seminorm을 주면, 그 편미분방정식의 (distributional)solution space에 대해 dense하다는 사실이 있단다.  이를 활용하면 초함수를 해석하는 적당한 방법이 존재하는 셈이다. seminorm을 활용해 아주 좋은 함수로 해당 초함수를 적당하게 approximation 할 수 있기 때문이다. 이러한 맥락에서 distribution theory를 공부하는 이유를 찾을 수 있겠다.

 $D$를 test function space라고 부르는데, 지금까지는 compactly supported smooth function on $\mathbb{R}^d$를 생각했다. 하지만 holomorphic function(of several complex variables)으로 test function을 주게 되면, 더 좋은 일이 생길 것 같은 좋은 느낌이 든다.



참고한 것들: 

1. 친구와 카톡

2. Stein - functional analysis

3. Bass - Real analysis for graduate students

4. Evans - PDE

5. 위키피디아(distribution - mathematics)

   

