---
date:
  created: 2022-01-17

categories:
  - Statistics
---

# Review: Reducing and meta-analysing estimates from distributed lag non-linear models 논문 정리

Author: Antonio Gasparrini, Ben Armstrong

Journal: BMC Medical Research Methodology (2013)



### 두 줄 요약

1. DLNM을 사용해 얻어진 coefficient를 모두 사용한 메타 분석은 computationally ineffecient.
2. 주로 보는 효과(overall effect)에 관련된 coefficient만 따로 뽑아서 활용하는게 좋다.

<!-- more -->

### 본문

 [지난 글](https://jaeminoh.github.io/dlnm/)에서 delay-effect가 존재할 때 exposure-response relationship을 모델링하는 방법으로 DLNM을 살펴봤었다. 먼저 DLM을 정의하고, 그것을 살짝 변형시켜서 DLNM을 만들었던 것을 기억하고 있기를 바란다. 이 모델은 지금도 계속 쓰이고 있을 만큼 그 성능이 좋아보인다. 하지만 meta-analysis(메타 분석)을 할 때는 estimated coefficient $\hat{\eta}$를 그대로 쓰면, 비효율적인 계산이 진행됨과 동시에 성능도 만족스럽지 못한 듯 싶다. Predictor space의 basis(e.g., spline) 개수를 $\nu_x$, lag space의 basis 개수를 $\nu_l$이라고 하면 $\hat{\eta}$는 $\nu_x \cdot \nu_l$ 길이의 꽤나 긴 벡터가 되기 때문이다. 그래서 관심있는 coefficient로 대상을 축소해서 효율적인 계산과 성능 향상을 도모하는 게 이 논문의 주된 내용이다.

 Meta라는 접두어는 내게 익숙하지 않다. 위키피디아에 적혀있는 내용을 기준으로, 앞에 meta가 붙으면 "무엇의 무엇"이 된다고 한다. 혹은 무엇을 넘어선 무언가. 예를 들어, 메타 인지는 인지의 인지가 되는 것이다. 그럼 meta-analysis는 analysis of analysis가 되겠다. 통계학에서 analysis하면 회귀 분석을 대표적으로 뽑을 수가 있는데, 회귀 분석은 주로 coefficient에 대해서 이야기한다. 따라서 본문에서 이야기하는 메타 분석은 DLNM을 통해 얻어진 coefficient를 다시 회귀 분석하고, 새로 얻어진 coefficient에 대해서 이야기하는 작업이 되겠다.

 좀 더 구체적으로, 우리가 temperature-mortality relationship에 관심이 있다고 하자. 미국에서 각 주마다 해당 정보가 모아졌다고 생각하고, 각 주 마다 DLNM을 적용해서 coefficient들을 얻었다고 상상하자. 이 계수들을 outcome으로 여기고, state 레벨에서 측정한 변수(e.g., 위도, 학업 수준, 인구, 실업률 등, meta-predictor라고 부름)를 predictor로 여겨서 regression을 진행하는 게 메타 분석이다. (meta-regression이라고도 한다. 약간 차이가 있으나 크지 않음) 왜 데이터를 통째로 합쳐서 한번에 분석하지 않고, state 별로 분석하냐고 질문할 수 있다. 내 생각에는, 해당 지역의 기후에 사람들이 적응할 수 있기 때문에 지역마다 조금씩 다른 온도-사망 관계가 측정될 수 있다. 통째로 합쳐서 state 레벨의 변수를 추가하여 자료를 분석할 수도 있었겠지만 신통치 않았으니 이렇게 두 단계의 분석을 진행했을 것이다.

 이런 메타 분석을 2-stage design이라고도 한다. First stage에서는 DLNM coefficient의 계산, second stage에서는 meta-regression. 구체적인 meta-regression 방법은 이 논문[2]을 참고하면 된다. 해당 논문에서는 first-stage에 대한 자세한 설명 없이 second-stage만을 설명하고 있으니 참고하길 바란다. Meta-regression에서는 반응 변수가 벡터인 회귀를 진행하고 있다. 따라서 second stage의 design matrix는 DLNM 계수의 길이($k$)만큼 행을 가지고 있다. 한 편, 메타 분석에서 between-stage variability를 나타내는 공분산행렬 $\Psi$는 $k(k+1)/2$개의 parameter들로 결정된다. 만약 $k$가 커지면 추정해야 할 parameter가 빠른 속도로 많아지게 되고, 비효율적 계산이 수행되는 것이다.

 온도-사망 관계에서 중요하게 다뤄지는 것은 온도의 overall effect이다. 오늘의 이 온도가 앞으로의 $L$일동안 사망 risk에 주는 전체적인 영향을 말한다. 이 논문[1]의 그림 1, 제 4사분면에 위치한 그래프가 overall effect를 나타낸다. 이 그래프를 그리는 데 필요한 DLNM 계수만 뽑아서 meta-regression을 진행한다면 추정해야 할 모수들이 많이 줄어들 것이다. 따라서 해당 그래프를 어떻게 그렸는지를 알아보자. 

 여러 notation이 등장하는데, 먼저 $\otimes$부터 알아보자. $p\times q$ 행렬 $M$과 $m\times n$ 행렬 $N$이 주어졌을 때 $M\otimes N$는  $[MN_{11} , \cdots, MN_{1n}]$를 세로로 쭉 쌓은 모양이다. 위키피디아의 Kronecker product와 계산하는 방법이 살짝 다르다. $Z$는 열벡터 $x$의 각 성분에 basis function $r_1, \cdots, r_{\nu_x}$를 적용해 만든 $n \times \nu_x$ 모양의 행렬이고, $C$는 lag vector $\textbf{l}$에 basis function $b_1, \cdots, b_{\nu_l}$을 적용해 만든 $(L+1)\times \nu_l$ 모양의 행렬이다. $\nu_l$길이의 열벡터 $\eta_j$를 일렬로 이어서 붙이면 열벡터 $\eta$가 된다. $j = 1, \cdots, \nu_x$ 그리고 $l = 0, \cdots, L$이다. 마지막으로 $z_x$는 scalar $x$에 basis function $r_1, \cdots, r_{\nu_x}$를 적용해 만든 행벡터다.

 잠시 overall effect 대신, 고정된 lag $l$에 대하여 temperature-mortality relationship을 계산한다.

1. 먼저 그래프를 그려야 하니, 그리고 싶은 범위의 temperature grid를 설정하고, 그것을 열벡터 $x$로 만든다.
2. $[r_j(x_1), \cdots, r_j(x_n)]^t = Q_j$라고 놓는다.
3. $x \mapsto \sum_j Q_j C_{l\cdot} \eta_j$를 그래프로 그리면 원하는 그림이 나온다.
4. 위 식은 $Z (C_{l\cdot} \otimes I_{\nu_x}) \eta$로 다시 쓸 수 있고, $Z$뒤의 식은 $\nu_x$길이의 열벡터가 되며, 이를 meta-regression의 outcome으로 여기면 된다.
5. Overall effect를 그리고 싶다면, 위 식을 $l$에 대해서 다 더해주면 된다. 그리고 그 식은 $Z (\textbf{1}^tC \otimes I_{\nu_x}) \eta$로 쓸 수 있다.

 이번엔 고정된 $x$에 대해 lag을 변화시키면서 delayed effect를 계산해보자.

1. 먼저 $l$을 고정시킨다. 
2. $r_j(x) C_{l\cdot} \eta_j$는 **$j$번째 basis의 $l$만큼 delayed effect**라고 볼 수 있다. 따라서 이를 $j$에 대해 더해주면,
3. $C_{l\cdot} \sum_j r_j \eta_j = C_{l\cdot} (I_{\nu_l} \otimes z_x) \eta$이 되고, 이를 $l$에 대해서 세로로 쌓아주면
4. $C  (I_{\nu_l} \otimes z_x) \eta$가 된다. $C$ 이후의 식은 $\nu_l$ 길이의 열벡터가 되며, 이를 meta-regression의 outcome으로 쓸 수 있다.

 요약하면, 분석하고 싶은 효과(고정된 $l$에 대한 온도의 효과, 전체적인 효과, 고정된 온도의 lag 효과)에 따라서 $Z$ 또는 $C$뒤의 식을 meta-regression의 outcome으로 사용하면 된다. DLNM이 어떻게 생겼는지 잘 이해했고, 행렬 연산에 대해서 익숙하다면 어렵지 않게 도출할 수 있는 결론이었다. 다만 논문에서는 위 설명 없이 최종 형태만 보여줘서, 왜 그렇게 최종 형태가 나오는지 이해하는게 논문의 가장 어려운 점이었다. 

 읽고 느낀점은, 사용하고 있는 model이 어떻게 작용되는지를 잘 알고 있으면 변형이 가능하다는 것. DLNM이 소개된게 2011년이고 이 논문이 출판된게 2013년이니까, 어림잡아 2년동안 DLNM이 two-stage design에서 first stage에 잘 쓰이지 못했다는 것인데, 많은 사람들이 R의 crosspred 함수가 어떻게 작동되는지 관심을 가졌다면 더 빨리 이 내용이 나오지 않았을까 생각한다.

---

### References

1. Gasparrini, A., Armstrong, B. Reducing and meta-analysing estimates from distributed lag non-linear models.*BMC Med Res Methodol* **13,** 1 (2013). https://doi.org/10.1186/1471-2288-13-1
2. Gasparrini A, Armstrong B, Kenward MG. Multivariate meta-analysis for non-linear and other multi-parameter associations. *Stat Med*. 2012 Dec 20;31(29):3821-39. doi: 10.1002/sim.5471. Epub 2012 Jul 16. PMID: 22807043; PMCID: PMC3546395.

