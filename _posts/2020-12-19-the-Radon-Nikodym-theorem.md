---
layout: post
title: "the Radon Nikodym theorem"
author: Jaemin Oh
tags: [mathematics, analysis]
use_math: true
---

# There are two ways.

 두 가지 방법 모두 non-constructive하다. 구성적이지 않은 solution에 무슨 의미가 있겠냐는 질문을 할 수도 있지만, 적어도 해당 명제가 참임을 보장함으로써 얻는 이득이 있다. 일단 the Radon Nikodym theorem이 뭔지 알아보자.

---

For finite positive measure $\nu \ll \mu$, there is $f \in L_1(\mu)$ such that $d\nu = f d\mu$. Moreover, this derivative is unique up to $\mu$-a.e.

---

 Abstract integration을 배우고, monotone convergence theorem을 배우고 나서 항상 마주치게 되는 예시가 있다. 어떤 $\mu$-integrable nonnegative function $f$에 대해서 $A \mapsto \int_A f d\mu$는 finite positive measure라는 내용이다. 또한 저 함수는 $\mu$에 대해서 absolutely continuous하다. 이런 상황에서 Radon-Nikodym theorem을 떠올리는 것은 아주 자연스럽다.

 첫번째로 소개할 증명은 유명한 수학자 von Neumann에 의한 것이다. 그는 Hilbert space에 대한 Riesz representation theorem을 사용해서 굉장히 깔끔하게 해당 명제를 증명했다. 

$\zeta = \mu + \nu$로 두고, linear functional $L: L_2(\zeta) \rightarrow \mathbb{R}$ 을 $L(g) = \int g d\nu$ 로 정의한다. 이러면 finiteness와 $p=q=2$ Holder's inequality에 의해 $L$은 bounded linear functional이 된다. 그럼 Riesz representation theorem에 의해 $L(g) = \int g d\nu = \int g h d\zeta$가 된다. 이제 여기서부터 여러 계산을 하면 결과가 나온다.

 두번째로 소개할 증명은 어떤 property를 maximize하는 함수를 찾는 것이다. $\mathcal{F} = \left \{ g: \int_A g d\mu \leq \nu(A)\right \}$라는 집합을 설정하고, $L = \sup\left \{ \int g d\nu: g\in \mathcal{F} \right \}$라고 두면, 어떤 함수열 $g_i$가 존재하여 $\int g_i d\nu \rightarrow L$이 된다. 이 $g_i$들의 pointwise supremum을 $f$라고 명명하면, 이 $f$가 Radon-Nikodym derivative가 된다.

 첫번째 증명은 Stein 선생님이 쓴 책을 보면 찾을 수 있고, 두번째 증명은 wikipedia에 검색하면 찾을 수 있다. 두 증명 중, 내가 흥미롭게 본 부분은 두번째 증명이다. 왜냐하면 complex function을 공부할 때 비슷한 상황이 몇번 있었기 때문이다. 

 가장 먼저 마주친 상황은 the Schwarz lemma를 배울 때였다. 원점을 고정하는 $f \in H(D, D)$는 항상 $\mid f'(0)\mid \leq 1$일 수 밖에 없는데, 만약 modulus가 1이 된다면 bijective map이 될 수 밖에 없었다. 원점에서의 modulus of derivative가 가장 커지니까, 아주 좋은 함수(rotation)가 된 상황이다.

 그 다음으로는 the Riemann mapping theorem을 증명할 때였다. $\mathcal{F} = \left \{ f: f\in H(U, D), f(P) = 0, f \text{ is one to one.} \right \}$라는 class에서, modulus of $f'(P)$를 가장 크게 만드는 함수를 찾으면 그 함수가 $U, D$를 연결해주는 conformal map이 되었다.

 그 다음으로는 Perron's method를 사용해 Dirichlet problem을 해결할 때였다. 주어진 boundary value보다 작은 subharmonic function들을 모아두고, 그 subharmonic function들의 pointwise supremum 함수가 dirichlet problem의 solution이 된다는 내용이었다.

 위 세 상황 모두 특정한 property를 maximize 했을 때 좋은 함수를 얻을 수 있다는 내용을 포함하고 있다. 해석학에서 자주 사용되는 테크닉인지는 잘 모르겠지만, 이번 학기동안 네번이나 마주쳐서 꽤 인상깊었다. 다만 아쉬운 것은 저런 테크닉이 어떤 상황에서 잘 동작하는지는 내가 모른다는 것이다. 그에 더하여, 첫번째 증명은 도대체 어떻게 생각해낸건지 모르겠다.