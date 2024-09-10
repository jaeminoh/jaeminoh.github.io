---
date:
  created: 2022-02-11

categories:
  - Statistics
  - Review
---

# Review: Attributable risk from distributed lag models

Author: Antonio Gasparrini and Michela Leone

Journal: BMC Medical Research Methodology (2014)

Suggested prerequisite: understanding about the DLNM framework.



### 요약

1. multi-exposure attributable risk 개념을 응용해 attributable risk가 temporal dimension을 반영하도록 개념을 확장함.
2. 이 방법은 특정 exposure range에 대해서 attributable risk를 계산할 수 있다는 장점도 가지고 있음.

<!-- more -->s

### 소개

온도-사망 관계에 대해 탐구하고 있다. (일반적으로 exposure-risk relationship) 이런 관계를 탐구하는 이유중에 하나로 시민들을 보호할 수 있는 보건정책의 평가 및 계획을 들 수 있다. 그 과정에서 attributable risk라는 값이 중요하게 여겨진다고 하는데, 이 값은 이 논문 이전까지 temperature-mortality의 delayed-effect를 고려하지 않아 수정이 필요한 상황이었다. 이 논문에서는 attributable risk를 delayed-effect를 고려하면서 forward, backward 시점으로 나누어 확장했다. 어떻게 확장했는지 살펴보기에 앞서 기초가 되는 개념들을 먼저 살펴보자.



### Risk

앞서 요약한 논문들 (DLNM, multivariate meta analysis)은 결과적으로 relative risk (RR)를 잘 추정하기 위한 방법들이다. RR은 $x$만큼 노출되었을 때 야기되는 사망자 수를 reference 값 만큼 노출되었을 때 야기되는 사망자 수로 나눈 값이다. 주로 reference 값은 사망자 수가 가장 적게 나오는 값으로 정하므로, RR은 1과 같거나 큰 경우가 많다. 

Attributable fraction (AF)는 $1-\exp(-\log RR)$로 정의된다. 풀어 쓰면 $1-1/RR$이 되는데, RR의 정의에 따라 이 값은 결과적으로 $x$만큼의 노출로 야기된 reference에 비해 초과된 사망자 수를 $x$만큼 노출되었을 때 야기되는 사망자 수로 나눈 값이다. $log RR$의 값이 0과 같거나 큰 경우가 많으므로 AF은 보통 0과 1 사이의 값을 가지게 된다. Attributable number (AN)는 AF에 exposure에 의해 발생한 사망자 수 (RR의 분자)를 곱해준 값으로 초과된 사망자 수를 나타낸다.

RR대신 AF을 써서 얻을 수 있는 장점에 대해서는 더 찾아봐야 한다. 일단 받아들이고 정리를 계속한다.

위에서 정의한 AR은 exposure의 종류가 한가지인 경우고, multi-exposure AF은 $1-\exp(-\sum_i \beta_i)$로 정의된다. (단, $\beta_i = \log RR _i)$ 여기서 $i$는 exposure의 종류를 나타내주는 index이다. 



### extended definition

Multi-exposure AF에서 각 $\beta_i$에 lagged RR을 대입해주면 확장이 끝난다. 다만 lagged RR로 대입할 수 있는 값이 두가지가 있고 이 값의 종류에 따라 forward, backward 시점이 갈린다. 먼저 forward 시점부터 살펴보자. $t$는 현재 날짜를 나타내는 변수이고, $x(t)$는 exposure level이다.

Forward AF ($f-AF_t$)는 지금 exposure $x$가 $L$일 동안 야기할 사망자 수에 관한 attributable fraction이다. 따라서 $\beta_i$에 대입되는 값으로 $\log RR_{x(t), l}$, $l = 0, \cdots, L$가 적당하다. 참고로 overall RR curve는 $RR_{x(t), l}$을 $l$에 대해 모두 더해서 그린다. Forward attributable number (f-AN)는 f-AF에 해당 기간동안 exposure에 의해 발생한 사망자 수를 평균내서 곱해준 값이다.

Backward AF ($b-AF_t$)는 지난 $L$일 동안의 exposure가 오늘 야기할 사망자 수에 관한 attributable fraction이다. 그러므로 $\log RR_{x(t-l), l}$, $l = 0, \cdots, L$을 $\beta_i$자리에 대입하면 알맞다. 해당 RR들은 DLNM fitting 과정에서 얻을 수 있다. Backwward attributable number (b-AN)는 b-AF에 $x(t)$에 의해 발생한 사망자 수를 곱해서 얻어진다.

확장한 방법은 보았듯이 상당히 간단하다. 과거에 발생한 exposure의 delayed-effect를 다른 종류의 exposure로 여기거나 (backward), 현재 exposure level의 lagged-effect를 다른 종류의 exposure로 여겨서 (forward) 확장되었다. **$\log RR$끼리 더하지 말고 그냥 $RR$끼리 더하면 무슨 변화가 있을 지 궁금하다.** 



### separating attributable components

관심있는 exposure level의 range를 $r = [l, h]$라고 하면 해당 range에 관련된 attributable risk는 $\beta_l$자리에 $I(x_{t-l} \in r) \beta_l$ 를 대입하면 된다. 다만 f-AF의 경우 exposure level이 정해져 있기 때문에 항상 0 또는 원래의 값이 나온다. 따라서 range를 분리시킬 경우 분리된 f-AF 값들의 합은 원래 f-AF값이 된다. b-AF의 경우 제한된 범위의 과거 exposure level들이 야기하는 초과된 사망자수의 fraction으로 해석할 수 있다.



### total attributable risk

Total attributable number (t-AN)는 attributable number들을 각 날짜에 대해 모두 더해서 얻고, total attributable fraction (t-AF)는 t-AN을 각 날짜별 exposure에 의해 발생한 사망자수의 합으로 나눠서 얻는다. 이 값은 forward, backward, 그리고 separated component에 대해서 모두 계산할 수 있다. 특히 온도-사망 관계에서 (mild, extreme) cold or hot을 separated component로 나누어서 어떤 component가 가장 risky한지 관찰할 수 있다. (Table 2 of the paper)



### confidence interval

uncertainty를 보기 위해 confidence interval을 계산하고 싶지만 잘 알려진 anlytic formula가 없다. 따라서 Monte-Carlo simulation을 통해서 신뢰구간을 보게 된다. DLNM coefficient $\eta$에 다변수 정규분포 가정을 한 후 (평균과 분산으로 estimated coefficient, covariance matrix) random sampling을 통해 AR을 계산한다. 여기서 (2.5, 97.5) percentile을 신뢰구간으로 잡는다. (eCI)



### 마치며

논문에 있던 어떤 inequality 그리고 backward AF와 overall cumulative RR의 차이를 통해 harvesting effect를 설명하는 부분은 잘 이해되지 않았는데, 다시 읽어볼 필요가 있다. 굵은 글씨로 입력해둔 부분과 AR이 RR에 비해 좋은 점을 추가로 탐구해서 이해를 높이도록 해보자.

---

### Reference

1. Gasparrini, A., Leone, M. Attributable risk from distributed lag models. *BMC Med Res Methodol* **14,** 55 (2014). https://doi.org/10.1186/1471-2288-14-55