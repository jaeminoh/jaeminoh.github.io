---
date:
  created: 2022-02-18
  #updated:

#draft: true
---

# Review: Sample size issues in time series regressions of counts on environmental exposures

Author: Ben G. Armstrong, Antonio Gasparrini, Aurelio Tobias and Francesco Sera

Journal: BMC Medical Research Methodology (2020)



### 요약

1. Effect measure에 관련된 검정력을 특정 값 이상으로 보장하기 위해서 얼마나 많은 sample size가 필요한지 알고 싶다.
2. 이 논문에서 소개된 approximation for Standard error of effect measure를 사용하면, 검정력을 보장하기 위한 count의 수를 알 수 있다. (sample size 대신)



### 소개

단순 선형 회귀 모델에서 coefficient의 significance test의 검정력은 sample size가 증가할 수록 더 강해지는 경향을 보인다. **(간단한 예시 필요)** 일반적으로 생각해서, sample size가 많으면 작은 coefficient도 significant하다고 통계적으로 결론지을 수 있다는 이야기다. 역으로 생각해서, 주어진 값의 coefficient를 significant하다고 결론지으려면 얼마나 많은 sample size가 필요할지 궁금할 수도 있다. 예를 들어 exposure-risk relationship을 분석하고 싶은데, 필요한 sample size를 미리 계산해서 data collecting 과정에 반영하면 데이터 분석에 대한 수고를 좀 더 줄일 수 있을 것이다.

내 블로그에 있는 글들이 항상 그렇듯, temperature-mortality relationship에 관심이 있다고 생각하자. First stage modeling을 할 때 non-linear lag effect를 반영한 dlnm을 주로 사용하게 되는데, 이는 effect measure로 꽤 많은 개수의 coefficient를 뱉어내기 때문에 살짝 복잡하다. 가장 간단한 경우를 생각하기 위해, 지난 며칠간의 온도 평균을 predictor로 둬서 effect measure를 단 한개의 coefficient로 나타냈다고 생각하자. (여러개의 coefficient가 있는 경우로 확장하면, 새 논문이 될 것이다.)

Count data는 주로 Poisson regression 모델을 통해 설명한다. Overdispersion을 반영하려면 Quasi-Poisson 모델을 사용한다. 이 모델들은 estimator를 구할 때 closed formula가 없어서 iterative approach(보통 IRWLS)를 사용해 likelihood를 최대화시킨다. 덕분에 관심있는 coefficient의 standard error를 구할 수 있고, 그것에 기반하여 power of test를 계산할 수 있지만, power를 sample size에 대한 식으로 나타내기가 힘들다. 이 논문은 이러한 한계를 돌파하기 위해 standard error에 대한 새 approximation(in terms of the number of count)을 제시한 데 그 novelty가 있다고 본다.



### Approximating standard error

제일 간단한 경우를 다루기 위해서 데이터가 모아진 장소가 한 곳이라고 하자. Mortality count를 $Y_i$, exposure를 $x_i$, confounder를 $z_i$라고 쓰면 $y_i = \log ( Y_i ) = \alpha + \beta x_i + \gamma z_i$로 Poisson regression을 할 수 있다. 1차 테일러 근사를 사용하면 $V(\log(Y_i) \lvert x_i, z_i) = 1/E(Y_i)$로 approximation이 가능하다. ($\log Y_i$를 $E(Y_i)$을 중심으로 전개) 이는 다시 $1/\bar{Y}$로 근사할 수 있다.

OLS coefficient의 분산을 구하는 것을 따라해서 $\hat{\beta}$의 분산을 구할 수 있다. [Frisch-Waugh-Lovell theorem](https://en.wikipedia.org/wiki/Frisch–Waugh–Lovell_theorem)은 $\beta$의 estimate은 $M_z y_i = \beta M_z x_i$를 OLS로 풀어 얻은 $\beta$의 estimate과 같다는 것을 말해준다. 여기서 $M_z$는 intercept를 포함한 $Z$의 column space에 대한 orthogonal complement matrix이다. 즉 $y$를 $z$에 회귀해서 얻어진 잔차를 $x$를 $z$에 회귀해서 얻어진 잔차로 회귀하면 $\hat{\beta}$가 계산된다. 따라서 $V(\hat{\beta}) \approx \sigma^2 / S_{rr}$로 근사할 수 있다. (여기서 $r$은 $x\sim z$의 residual.) 등식이 되려면 $\sigma^2$ 대신 좀 더 복잡한 term이 들어가야 하지만, 생략한다. $S_{rr} = x^t (I-P_z)x = x^t(I-J/n)x \cdot \frac{x^t (I-P_z)x}{x^t(I-J/n)x} = n V(x) (1-R^2_{x\lvert z}) = nV(x\lvert z)$로 표현할 수 있다. 

위 두 문단에서 근사한 값들을 대입하면, $V(y_i) \approx 1/(n \bar{Y} V(x\lvert z)) = 1/(\sum Y_i \cdot V(x\lvert z))$가 된다. 이는 이 논문에 적혀있는 식 (2)에 해당한다. Counfounder를 control하지 않은 근사값은 $z$에 대한 conditioning을 풀어줌으로써 가능하고 (식 (1)), overdispersion은 $\sigma^2$ 대신 $\sigma^2 \phi$를 대입해 식 (2)의 분모에 $\phi$를 대입해주면 된다 (식 (3)). 주목할 부분은 standard error의 근사가 sample size가 아닌 $\sum Y_i$에 의존한다는 것이다. 

다음은 multi-study 구조를 반영한 근사 과정을 소개한다. 각 study마다 위에 소개된 식 (1) ~ (3)을 사용해 $\hat{\beta_j}$의 standard error를 근사할 수 있다. 그럼 study마다 effect measure가 다를텐데, 이를 모두 아우르는 전체적인 effect measure의 standard error는 어떻게 근사할 수 있을까? 만약 effect measure $\beta_j$에 대한 heterogeneity가 없다면, 그리고 $V(x\lvert z)$가 같다면 그냥 데이터를 하나로 합쳐서 $\sum Y_i $대신 $\sum _ {i,j} Y_{i,j}$를 사용하면 된다 (식 (4), overdispersion이 있는 경우는 식 (5)). 하지만 study 사이 heterogeneity가 존재한다면 식 (4), (5) 같은 간단한 근사의 정확성이 매우 떨어질 것이다.

간단한 meta-analysis 구조로 $\hat{\beta}^j = \hat{\beta_j} + b_j$라고 하자. 여기서 $\beta$는 모든 study를 아우르는 effect measure이고, $b_j$는 study간 차이를 나타내주는 random effect이다. $E(\hat{\beta_j}) = \beta, E(b_j) = 0, V(b_j) = \tau^2$라고 하자. 그러면 $\sum c_j = 1$인 weight $c = (c_1, \cdots, c_J)$에 대해 $\hat{\beta} = \sum_j c_j \hat{\beta}^j$의 기대값은 항상 $\beta$가 된다. 분산은 $\sum_j c_j^2 (V_j + \tau^2)$이 되는데 ($V_j =$ 식 (1) ~ (3) 중 하나) 이를 최소화 하는 $c_j$를 찾으면 $\frac{1}{k(V_j + \tau^2)}$, $k = \sum_j \frac{1}{V_j + \tau^2}$가 된다. (Lagrange multiplier를 사용해서 계산했음.) 따라서 $\hat{\beta}$의 분산은 $1/k$가 된다. 이 값은 논문에 제시된 식 (6)의 값과 같다. 근데 이 값은 study마다 계산해야되고, $\tau^2$에 대한 estimation까지 필요로 하기 때문에 식 (4), (5)에 비해 계산을 좀 더 많이 해야 한다.

$\hat{\beta}$의 variability는 heterogenity와 within study variability로 분리해서 생각할 수 있는데, 식 (6)은 within study variability를 $V_j$로 생각한 것이다. 만약 $V_j$ 값이 모두 같다고 가정한다면 식 (4)를 $1-I^2$의 제곱근으로 나눈 값을 근사값으로 사용할 수 있으며, 이것은 식 (7)에 해당한다. 식 (4)가 random effect가 없다고 가정한 값이므로 이를 관측된 total variability / within study variability로 나누어 보정한 것이다.

실제 standard error는 maximum likelihood에 의해서 측정되는데, 위 근삿값들은 대체로 실제 값을 underestimate하는 경우가 많았다. (table 1, 2 from the paper)



### Calculation of power

Power는 null hypothesis를 기각할 확률을 나타낸다. 이 글에서 test statistic은 $\hat{\beta}/se(\hat{\beta}) = T$가 되고, 이 값이 $0$에서 너무 멀어지면 $H_0: \beta = 0$을 기각한다. 유의수준을 $0.05$로 생각하고 power를 계산하면 $P(T > z_{\alpha/2})+P( T < -z_{\alpha/2})$가 된다. 계산의 편의성을 위해서 power는 둘 중 큰 값으로 근사하겠다. 실제 effect measure 값을 $\beta_1$이라고 하면 power는 $P(z > z_{\alpha/2} - \beta_1/se(\hat{\beta})) = f(\lvert \beta_1 \lvert /se(\hat{\beta}) - z_{\alpha/2})$이 된다. (단, $f$는 cdf of standard normal, 여기서는 $\beta_1 >0$ 가정)

원하는 power의 값을 $p$라고 하고, $f(\lvert \beta_1 \lvert /se(\hat{\beta}) - z_{\alpha/2}) \ge p$를 풀게 되면 $\lvert \beta_1 \lvert /se(\hat{\beta}) - z_{\alpha/2} \ge z_{1-p}$가 되며, $\lvert \beta_1 \lvert \ge se(\hat{\beta})(z_{\alpha/2} + z_{1-p})$가 detectable한 effect measure의 range가 된다. 여기서 $se(\hat{\beta})$에 식 (1) ~ (7)을 알맞게 대입하면 $\sum Y_i$ 값을 얻을 수 있다. 이 과정을 통해서 얻어진 $\sum Y_i$값 만큼 데이터를 모아야, 주어진 effect measure의 검정을 원하는 수준의 power로 (근사적으로) 시행할 수 있다는 뜻이 되겠다.



### Reference

1. Armstrong, B.G., Gasparrini, A., Tobias, A. *et al.* Sample size issues in time series regressions of counts on environmental exposures. *BMC Med Res Methodol* **20,** 15 (2020). https://doi.org/10.1186/s12874-019-0894-6