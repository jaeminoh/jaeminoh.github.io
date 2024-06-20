---
layout: post
title: "About SageMath - 0"
tags: [mathematics, program, python]
author: Jaemin Oh
---

# SageMath

2019년 1학기, 미분기하 강의를 들으며 [SageMath](https://en.wikipedia.org/wiki/SageMath)의 존재를 알았다. 손으로 할 수 있지만 귀찮은 계산들은 전부 SymPy로 할 수 있었기 때문에 곧 SageMath에 관심을 끊게 되었는데, 최근에 군론(Group Theory)과 같은 추상적인 수학을 컴퓨터로 구현해 낼 수 있는지에 대해 관심이 생겨 찾아보다가 SageMath와 다시 만나게 되었다.



Sage는 "System for Algebra and Geometry Experimentation"의 준말이다. 첫 버전이 무려 2005년도에 배포되었는데, 난 2005년도에 무엇을 하고 있었는지 전혀 기억이 나지 않는다. Mathematica, MATLAB과 같은 프로그램들을 대체하기 위한 오픈소스로써 개발되었으며 Python의 문법을 닮았다.

---

conda를 이용하여 설치를 진행했다. 

```shell
conda install sage
```

를 터미널에 입력하면 아마도 설치를 진행하지 못할 것이다.



[링크](https://wiki.sagemath.org/Conda)를 참고하면 설치방법을 알 수 있다. 아래는 그 요약이다.



먼저 터미널에

```zsh
conda config --add channels conda-forge
```

를 입력하여 conda-forge 채널을 더해준다.

다음으로, 터미널에

```shell
conda update --all
```

을 입력하여 모든 패키지들을 업데이트 해 준다. (필수적인 과정은 아닐 것으로 보인다. 하지만 이 과정을 생략할 경우 에러를 수반할 수 있다고 경고하고 있다.)

마지막으로 터미널에

```shell
conda create -n sage 원하는 환경 이름
```

을 입력하여 가상환경을 만든다. 약 970MB정도의 저장공간이 필요하다.

가상환경을 activate하고 jupyter notebook으로 SageMath를 즐길 수 있다.



하지만 가상환경을 구성하고 activate하는데 시간이 꽤 오래 걸리는 것을 확인할 수 있을 것이다.

그래서 [다른 링크](http://doc.sagemath.org/html/en/installation/conda.html)에서는 'mamba'를 활용하여 설치하면 더 빠르다고 이야기한다.

---

SymPy를 이용해 Clifford Torus를 3D plotting 했을 때 Mathematica와는 다르게 이리저리 그림을 돌려볼 수 없어서 아쉬웠는데 SageMath 9.0버전부터는 three.js를 통해서 3차원 그림을 이리저리 돌려볼 수 있다. 사용법을 잘 익혀두면 Mathematica를 따로 익히지 않아도 복잡한 계산을 수행할 수 있을 것이다.

[이 글](https://www.sagemath.org/library-why.html)은 SageMath를 이용했을 때의 장점들을 설명해 둔 글이다.