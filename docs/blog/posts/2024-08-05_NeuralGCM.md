---
date:
  created: 2024-07-26
  updated: 2024-08-09

#draft: true
---

# Neural general circulation models
Machine Learning accelerated global weather prediction model developed by Google.
Two advantages over pure ML methods:

- Uncertainty estimates
- Long time simulation

24년 7월 22일 (내 28번째 생일), Nature에 “Neural general circulation models for weather and climate” 이라는 제목의 논문이 올라왔다. “Neural” 키워드를 보고 “data 때려 맞추는 모델 아니야?” 라고 생각할 수 있겠지만, 그렇지 않다. 

General circulation model은 (조사가 필요하다) 날씨를 예측하는 physics 기반 수치모델을 말한다. 이 모델은 기후, 날씨 dynamics를 나타내는 PDE로 이루어져 있는데, 당연하게도 작은 scale의 현상들 (구름 형성, 국소적 강우, …)은 상대적으로 무시한다.

NeuralGCM은 GCM의 일부 component를 neural network로 바꿔치기 하고, numerical solver를 통해 얻은 solution과 high fidelity numerical solution의 차이를 줄이는 방향으로 automatic differentiation을 통해서 neural network를 optimization 하는 방법이다. 나중에 prediction 할 때 high fidelity 보다 적은 computation cost가 들지만, accuracy는 비슷한 수준이라고 한다. 이 논문에서는 NeuralGCM을 소개하고, 여러 task에 대해 performance를 분석했다.

저자들은 글의 도입 부분에서 기계학습 방법들에 대해, “수치 방법에 비해 엄청나게 적은 computational cost로 훌륭한 성능을 보여준다”고 말했다. 또한 implementation이 훨씬 간단하다는 것도 장점으로 꼽았다. 예를 들어 google deepmind의 Graphcast는 5417줄의 코드로 구현이 가능했던 반면, NOAA의 수치모델을 구현하는데는 37만여 줄의 코드가 필요했다고 한다. 프로그래밍 언어가 다르기에 직접적인 비교는 불가능하겠지만, 짧고 쉬운 implementation이 가능하다는 것은 분명해 보인다.

이런 장점이 있음에도, long time simulation이나, uncertainty를 포함한 예측, diagnostic variable에 대한 accuracy같은 task에 대해서는 아직 GCM의 성능을 ML 방법들이 따라오지 못한다고 한다.

만약, GCM과 ML 방법의 장점을 모두 갖는 모델을 만들 수 있다면 좋을 것이다. NeuralGCM은 GCM과 ML을 결합했기 때문에, 장점들을 모두 가질 거라고 기대할 수 있다. 특히 유체 simulation의 경우 mass와 같은 양이 보존되는 것을 중요하게 보는 사람들이 많다. 아마도 NeuralGCM은 numeric과 data를 결합한 방법이기 때문에, 이런 diagnostic principle에 대해 좋은 성능을 보여줄 것 같다.

— 다른 소리.
첫번째 저자 Kochkov, 마지막 두 저자 Brenner, Shoyer는 2018년 PNAS에 JAX-CFD 논문을 발표했다. 내용은 numerical solver의 한 부분을 neural network로 바꾸고, autodiff를 통해 high-fidelity solution과의 deviation을 줄이는 방향으로 optimization 해서 reduced 된 computational cost로 high-fidelity 수준의 simulation을 하는 방법에 관한 것이었다. 당시에 논문을 읽고 나서 numeric과 machine learning을 잘 활용한 훌륭한 연구라고 생각을 했다. 이 논문이 지금 weather simulation으로 가기 위한 build-up 단계였는지는 저자들에게 직접 물어봐야 알겠지만, 왠지 그럴 것이라는 느낌이 든다.

---

**Neural GCM**

- [arXiv link](https://arxiv.org/abs/2311.07222)
- [Nature](https://www.nature.com/articles/s41586-024-07744-y)
- [GitHub](https://github.com/google-research/neuralgcm)

**JAX-CFD**

- [PNAS](https://www.pnas.org/content/118/21/e2101784118)
- [GitHub](https://github.com/google/jax-cfd)