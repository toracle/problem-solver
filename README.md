# 문제를 보는 눈
## Problem Space / Solution Space 훈련 워크샵

> *"문제를 오래 보는 것이 해결책을 빠르게 만드는 방법이다."*

---

## 이 저장소에 대해

풀스택 엔지니어 3-4년차를 위한 **8강 워크샵 커리큘럼**과 모든 학습 자료입니다.

3-4년차 엔지니어의 가장 흔한 문제는 기술 부족이 아닙니다.
요구사항이 들어오는 순간 Solution Space로 **자동으로** 넘어가는 습관입니다.
이 워크샵은 그 습관을 인식하고, Problem Space를 깊이 탐색하는 근력을 키우는 과정입니다.

**이론 기반**

- George Pólya — *How to Solve It* (유사 추론, Problem Space 개념)
- Gerald Weinberg & Donald Gause — *Exploring Requirements: Quality Before Design* (FAC, Context-Free Questions)
- George Fairbanks — *Just Enough Software Architecture* (Risk-Driven Model, Quality Attributes)
- Ward Cunningham — Simplest Thing, Spike, Technical Debt 원래 의미
- Donald Schön — Reflection-in-Action

---

## 워크샵 구조

```
강   제목                                    핵심 개념
───────────────────────────────────────────────────────────────────
1강  솔루션 중독                              Einstellung Effect · Presumptive Architecture
2강  모호함의 해부학                          Functions / Attributes / Constraints (FAC)
3강  질문하는 자가 설계한다                   Context-Free Questions · Black Box Test
4강  지도를 그리기 전에                       증상-문제-근본원인 · Domain Model
─────────────────────────── ← 전환점 ──────────────────────────────
5강  안개 속에서 걷는 법                      Resolvable vs Essential Ambiguity · Spike
─────────────────────────── ← Solution Space ──────────────────────
6강  이 문제, 어디서 본 것 같은데             유사 추론(Analogy) · 문제 유형 환원
7강  어디에 공을 들여야 하는가                Quality Attributes · Risk-Driven Model
8강  승현의 지도                              Problem-Solution Fit · Pre-mortem
───────────────────────────────────────────────────────────────────

대상: 풀스택 엔지니어 3-4년차
형식: 강의 + 실습 혼합 | 각 강 100분 | 총 800분
권장 인원: 6-16명
```

---

## 저장소 구조

```
.
├── README.md
│
├── curriculum/                       강의별 상세 설계 (강의자 참고용)
│   ├── workshop_prologue.md          프롤로그 — 시리즈 도입
│   ├── workshop_lecture_01.md        1강 상세 설계
│   ├── workshop_lecture_02.md        2강 상세 설계
│   ├── workshop_lecture_03.md        3강 상세 설계
│   ├── workshop_lecture_04.md        4강 상세 설계
│   ├── workshop_lecture_05.md        5강 상세 설계
│   ├── workshop_lecture_06.md        6강 상세 설계
│   ├── workshop_lecture_07.md        7강 상세 설계
│   ├── workshop_lecture_08.md        8강 상세 설계
│   └── workshop_epilogue.md          에필로그 — 시리즈 마무리
│
├── resources/                        배포용 학습 자료 (3종 × 2포맷)
│   ├── resource_A_workshop_guidebook.md    리소스 A — 워크샵 가이드북 (참가자용)
│   ├── resource_A_workshop_guidebook.adoc  (AsciiDoc)
│   ├── resource_B_reading_material.md      리소스 B — 읽기 자료 (self-paced)
│   ├── resource_B_reading_material.adoc    (AsciiDoc)
│   ├── resource_C_facilitator_guide.md     리소스 C — 퍼실리테이터 가이드 ⚠️
│   └── resource_C_facilitator_guide.adoc   (AsciiDoc) ⚠️
│
└── .gitignore
```

> ⚠️ **리소스 C는 강의자 전용입니다.** 참가자에게 배포하지 마세요.
> 공개 저장소를 사용한다면 `resource_C_*` 파일을 `.gitignore`에 추가하거나
> 별도의 private 저장소로 관리하세요.

---

## 리소스 설명

### 리소스 A — 워크샵 가이드북 (`resource_A_*`)

**참가자 배포용.** 워크샵 당일 들고 다니며 직접 쓰는 문서입니다.

```
구성
────
워크시트 A  (1강~8강)   팀오더 고정 케이스 실습 양식 — 빈 칸 채우기
워크시트 B  (1강~8강)   나의 현업 케이스 누적 분석 양식
                         1강에 등록한 현업 케이스를 8강에 걸쳐 심화
과제 카드   (1강~8강)   강 후 현업 실천 과제
부록                     8강 누적 발견 메모 요약 공간
```

**팀오더 케이스** — 이 가이드북 전체를 관통하는 가상의 스타트업 케이스입니다.
민준(BizDev)이 가져온 모호한 요구사항 하나를 출발점으로, 8강에 걸쳐 다른 도구로 같은 케이스를 탐색합니다.

### 리소스 B — 읽기 자료 (`resource_B_*`)

**Self-paced learning용.** 강의 전날 읽어오거나 강의 후 복습하는 문서입니다.
워크샵 없이도 독립적으로 읽을 수 있습니다.

```
구성
────
프롤로그    승현의 이야기 시작
1강~8강     에피소드 (이야기) + 개념 노트 + "이 강에서 써볼 것"
에필로그    6개월 후의 팀오더, 그리고 독자에게
```

**포맷:** 각 강마다 — 우화 형식의 이야기 → 이론 개념 노트 → 현업 적용 가이드

### 리소스 C — 퍼실리테이터 가이드 (`resource_C_*`) ⚠️

**강의자 전용.** 참가자에게 배포하지 않습니다.

```
구성
────
워크샵 전체 운영 원칙   흐름, 누적 구조, 핵심 메시지
등장인물 로스터         민준, 지연, 승현, 현태의 역할과 퍼실리테이션 팁
1강~8강 챕터            강별 시간 배분표 + 주의사항 + 진행 상세 +
                        소그룹 공유 가이드 + 디브리프 가이드
운영 팁                 심리적 안전 확보, 막히는 지점별 개입 방법,
                        워크시트 B 관리, 과제 카드 연계
```

---

## 빠른 시작

### 강의자

1. `resource_C_facilitator_guide` 를 먼저 읽습니다 — 워크샵 전체 철학과 운영 원칙
2. 각 강 전날 `curriculum/workshop_lecture_0X.md` 로 해당 강의를 준비합니다
3. `resource_A_workshop_guidebook` 을 참가자 수만큼 인쇄하거나 PDF로 배포합니다
4. `resource_B_reading_material` 을 참가자에게 공유합니다 (강의 전날 밤 읽기용)

### 참가자

1. 강의 전날: `resource_B_reading_material` 에서 해당 강의 에피소드를 읽습니다 (15-20분)
2. 강의 당일: `resource_A_workshop_guidebook` 의 워크시트를 직접 씁니다
3. 강의 후: 개념 노트를 다시 읽습니다 — 실습과 연결되어 다르게 읽힙니다
4. **워크시트 B는 1강부터 8강까지 같은 현업 케이스를 들고 다닙니다.** 잃어버리지 마세요.

### 독립 학습 (워크샵 없이)

`resource_B_reading_material` 만으로도 완결된 학습이 가능합니다.
순서대로 읽고, 각 강 끝의 "이 강에서 써볼 것"을 현업에 실천해보세요.

---

## 파일 포맷

모든 자료는 **Markdown(`.md`)** 과 **AsciiDoc(`.adoc`)** 두 가지 포맷으로 제공됩니다.

| 포맷 | 용도 | 렌더링 |
|---|---|---|
| `.md` | GitHub 웹 뷰어, Notion, Obsidian 등 | GitHub에서 바로 보기 가능 |
| `.adoc` | Asciidoctor, IntelliJ AsciiDoc 플러그인, Antora | PDF/HTML 출력 품질이 높음 |

**AsciiDoc → PDF/HTML 변환:**

```bash
# Asciidoctor 설치 (Ruby)
gem install asciidoctor

# HTML 변환
asciidoctor resource_B_reading_material.adoc

# PDF 변환 (asciidoctor-pdf 필요)
gem install asciidoctor-pdf
asciidoctor-pdf resource_A_workshop_guidebook.adoc
```

AsciiDoc 설정: `doctype: book`, `toc: left`, `sectnums`, `lang: ko`, `encoding: UTF-8`

---

## 커스터마이징

### 팀오더 케이스를 내 케이스로 교체할 때

워크시트 A의 "팀오더 케이스" 섹션은 교체 가능하도록 설계되어 있습니다.
팀/조직의 실제 케이스로 교체하면 학습 몰입도가 높아집니다.

케이스 선정 기준:
- 모호하거나 덩어리가 큰 요구사항
- BizDev 또는 기획자가 가져온 것
- 1개월 내외의 개발 범위
- 참가자들이 공감할 수 있는 도메인

### 강 수를 줄일 때

**최소 구성 (5강):**
- 1강 (자각) + 2강 (FAC) + 3강 (질문) + 5강 (모호함) + 8강 (통합)

**Problem Space 심화 (6강):**
- 1-4강 + 5강 + 8강

**Solution Space 포함 전체 (8강):**
- 기본 구성 그대로

---

## 이론 배경

이 워크샵의 핵심 긴장(tension):

```
Weinberg: "모호함은 해소하라"
           설계 전에 요구사항을 명확히 하는 것이 품질의 전제

Cunningham: "어떤 모호함은 안고 가라"
             해봐야만 아는 것은 Spike로 탐색하라

→ 이 둘이 모순이 아닌 이유:
   Weinberg는 해소 가능한 모호함을,
   Cunningham은 본질적 모호함(Essential Ambiguity)을 이야기한다.
   5강이 이 두 가지를 진단하는 능력을 다룬다.
```

```
Fairbanks: "리스크에 비례해서 설계하라"
            모든 것을 같은 깊이로 설계하는 것은 낭비다.
            리스크가 낮은 것은 지금 안 해도 된다.

→ 문제를 깊이 이해하면 리스크가 어디 있는지 보인다.
   그래서 Problem Space 탐색이 Solution Space를 단순하게 만든다.
```

---

## 기여 가이드

이 워크샵을 실제로 운영하신다면:

- **케이스 기여:** 팀오더 케이스를 대체할 수 있는 다른 도메인 케이스 PR을 환영합니다
- **오류 수정:** 개념 설명의 오류나 참고문헌 오류는 Issue로 알려주세요
- **번역:** 영어 버전 번역에 관심 있으시면 Issue에서 논의해요
- **운영 후기:** Discussions에서 실제 운영 경험을 나눠주세요 — 커리큘럼 개선에 반영합니다

---

## 라이선스

[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

- 상업적 이용 포함 자유롭게 사용 가능합니다
- 수정 및 재배포 가능합니다
- 원저작자 표시가 필요합니다
- 이 커리큘럼을 기반으로 워크샵을 운영하실 때 출처를 명시해 주세요

---

## 관련 자료

- Weinberg, G. M. & Gause, D. C. (1989). *Exploring Requirements: Quality Before Design*. Dorset House.
- Fairbanks, G. (2010). *Just Enough Software Architecture: A Risk-Driven Approach*. Marshall & Brainerd.
- Pólya, G. (1945). *How to Solve It*. Princeton University Press.
- Cunningham, W. (1992). The WyCash Portfolio Management System. *OOPSLA '92*.
- Schön, D. A. (1983). *The Reflective Practitioner*. Basic Books.
- Christensen, C. M., Hall, T., Dillon, K., & Duncan, D. S. (2016). Know Your Customers' "Jobs to Be Done". *Harvard Business Review*.
