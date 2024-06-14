## 프로젝트 설명

## 프로젝트 구조

모델은 따로 다운받아야함.

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

## 실행방법

### 1. 모델 다운로드

**LLM - [Llama-3-Open-Ko-8B-Q8_0]**

1. ollama 설치
    
    https://ollama.com/
    
2. 허깅페이스에서 Llama-3-Open-Ko-8B-Q8_0.gguf 다운로드
    
    https://huggingface.co/teddylee777/Llama-3-Open-Ko-8B-gguf/tree/main
    
3. Modelfile 작성
4. 모델 생성
`ollama create Llama-3-Open-Ko-8B-Q8_0 -f Modelfile`
    - 이때 모델 파일과 gguf 파일은 같은위치

**Eembedding - [ko-sroberta-multitask]**

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

### 2. docker 실행

1. 도커 이미지 빌드
    
    프로젝트 폴더가 있는 위치로 이동해서 다음 명령어 실
    
    `docker build -t chatbot:latest .`
    
2. 도커 컨테이너 실행
    
    `docker run chatbot`
    

### 3. 로컬 환경에서 실행

필요한 패키지 설치 후 명령어 실행 (가상 환경 권장)

`chainlit run chatbot_final.py`

## 시연 영상 및 이미지 (영상 + PPT 사진 참고)
![alt text](<시연영상 최종.gif>)