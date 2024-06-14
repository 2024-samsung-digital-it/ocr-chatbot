<div align="center">
<h2>[2024 상반기 삼성증권 ] 금융권 OCR Chatbot 서비스</h2>
금융권의 업무프로세스 개선을 위한 온-프레미스 형태의 서비스 입니다.<br>
PDF와 이미지 파일 형태의 증권 데이터 업로드가 가능한 OCR 모델을 활용하였으며 인식한 데이터를 추출하여 사용자에게 질의응답 기능 제공합니다. 😊
</div>

<br>

## 프로젝트 구조

```markdown
samsung-digital-it-team2
├─ .chainlit
│  ├─ config.toml
│  └─ translations
│     ├─ en-US.json
│     └─ ko.json
├─ chainlit.md
├─ chatbot_final.py
├─ Dockerfile
├─ entrypoint.sh
├─ ko-sroberta-multitask
│  ├─ 1_Pooling
│  │  └─ config.json
│  ├─ config.json
│  ├─ config_sentence_transformers.json
│  ├─ model.safetensors
│  ├─ modules.json
│  ├─ README.md
│  ├─ sentence_bert_config.json
│  ├─ special_tokens_map.json
│  ├─ tokenizer.json
│  ├─ tokenizer_config.json
│  └─ vocab.txt
├─ Llama-3-Open-Ko-8B-Q8_0.gguf
├─ Modelfile
├─ public
│  └─ test.css
├─ requirements.txt
└─ __pycache__
   └─ chatbot_final.cpython-312.pyc
```

모델은 용량이 크기때문에 따로 다운받아야함.


<br>


## RAG 모델 활용 및 파이프라인
#### 1. 사용자의 PDF 파일을 vectorDB에 넣기 위해 자르는 작업 
#### 2. embedding model : ko-sroberta-multitask
- 한국어 문장 임베딩에 활용하기 위해 만들어진 한국어 사전학습 모델
- 코사인 유사도 이용
#### 3. MultiQueryRAG & ParentDocumentRAG 활용
- 멀티 쿼리로 질문을 3개로 구분 → 문서 3개 발견 (chunk_size=128)
- 사용자에게 받은 쿼리에서 가장 유사한 문서 찾고 해당 문서의 부모 문서 찾기(이때 부모 문서의 chunk_size=512)
- 결과적으로 총 9개의 문서가 존재 (3x3)
#### 4.llm mode : Llama-3-Open-Ko-8B-Q8_0

```
결론 : Llama3 모델이 (chunk_size=150, chunk_overlap=40)일 때 제일 빠른 성능을 보임
```

<br>

<img width="700" alt="스크린샷 2024-06-14 오후 4 09 27" src="https://github.com/2024-samsung-digital-it/ocr-chatbot/assets/101869611/51c6e7f6-6f6a-4266-8782-0be4eebc000b">


## 서비스 실행 방법

### 1. 모델 다운로드
> <mark>**LLM - [Llama-3-Open-Ko-8B-Q8_0]**</mark>

1. ollama 설치
    
    https://ollama.com/
    
2. 허깅페이스에서 Llama-3-Open-Ko-8B-Q8_0.gguf 다운로드
    
    https://huggingface.co/teddylee777/Llama-3-Open-Ko-8B-gguf/tree/main
    
3. Modelfile 작성
4. 모델 생성
`ollama create Llama-3-Open-Ko-8B-Q8_0 -f Modelfile`
    - 이때 모델 파일과 gguf 파일은 같은위치

<br>

> <mark>**Embedding - [ko-sroberta-multitask]**</mark>

https://huggingface.co/jhgan/ko-sroberta-multitask

해당 링크에서 `ko-sroberta-multitask` 모델 다운로드

```
ko-sroberta-multitask
  ├─ 1_Pooling
  │  └─ config.json
  ├─ config.json
  ├─ config_sentence_transformers.json
  ├─ model.safetensors
  ├─ modules.json
  ├─ README.md
  ├─ sentence_bert_config.json
  ├─ special_tokens_map.json
  ├─ tokenizer.json
  ├─ tokenizer_config.json
  └─ vocab.txt
```

<br>

### 2. docker 실행

1. 도커 이미지 빌드
    
    프로젝트 폴더가 있는 위치로 이동해서 다음 명령어 실
    
    `docker build -t chatbot:latest .`
    
2. 도커 컨테이너 실행
    
    `docker run chatbot`

<br>

### 3. 로컬 환경에서 실행

필요한 패키지 설치 후 명령어 실행 (가상 환경 권장)

`chainlit run chatbot_final.py`

<br>


## 시연 영상 및 이미지
<img width="535" alt="스크린샷 2024-06-14 오후 4 41 36" src="https://github.com/2024-samsung-digital-it/ocr-chatbot/assets/101869611/929e7659-0881-4e58-9eaf-294663278e86">

![alt text](<시연영상 최종.gif>)


