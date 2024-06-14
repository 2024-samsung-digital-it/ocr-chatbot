## ������Ʈ ����

## ������Ʈ ����

���� ���� �ٿ�޾ƾ���.

```markdown
samsung-digital-it-team2
���� .chainlit
��  ���� config.toml
��  ���� translations
��     ���� en-US.json
��     ���� ko.json
���� chainlit.md
���� chatbot_final.py
���� Dockerfile
���� entrypoint.sh
���� ko-sroberta-multitask
��  ���� 1_Pooling
��  ��  ���� config.json
��  ���� config.json
��  ���� config_sentence_transformers.json
��  ���� model.safetensors
��  ���� modules.json
��  ���� README.md
��  ���� sentence_bert_config.json
��  ���� special_tokens_map.json
��  ���� tokenizer.json
��  ���� tokenizer_config.json
��  ���� vocab.txt
���� Llama-3-Open-Ko-8B-Q8_0.gguf
���� Modelfile
���� public
��  ���� test.css
���� requirements.txt
���� __pycache__
   ���� chatbot_final.cpython-312.pyc
```

## ������

### 1. �� �ٿ�ε�

**LLM - [Llama-3-Open-Ko-8B-Q8_0]**

1. ollama ��ġ
    
    https://ollama.com/
    
2. ������̽����� Llama-3-Open-Ko-8B-Q8_0.gguf �ٿ�ε�
    
    https://huggingface.co/teddylee777/Llama-3-Open-Ko-8B-gguf/tree/main
    
3. Modelfile �ۼ�
4. �� ����
`ollama create Llama-3-Open-Ko-8B-Q8_0 -f Modelfile`
    - �̶� �� ���ϰ� gguf ������ ������ġ

**Eembedding - [ko-sroberta-multitask]**

https://huggingface.co/jhgan/ko-sroberta-multitask

�ش� ��ũ���� `ko-sroberta-multitask` �� �ٿ�ε�

```
ko-sroberta-multitask
  ���� 1_Pooling
  ��  ���� config.json
  ���� config.json
  ���� config_sentence_transformers.json
  ���� model.safetensors
  ���� modules.json
  ���� README.md
  ���� sentence_bert_config.json
  ���� special_tokens_map.json
  ���� tokenizer.json
  ���� tokenizer_config.json
  ���� vocab.txt
```

### 2. docker ����

1. ��Ŀ �̹��� ����
    
    ������Ʈ ������ �ִ� ��ġ�� �̵��ؼ� ���� ��ɾ� ��
    
    `docker build -t chatbot:latest .`
    
2. ��Ŀ �����̳� ����
    
    `docker run chatbot`
    

### 3. ���� ȯ�濡�� ����

�ʿ��� ��Ű�� ��ġ �� ��ɾ� ���� (���� ȯ�� ����)

`chainlit run chatbot_final.py`

## �ÿ� ���� �� �̹��� (���� + PPT ���� ����)
![alt text](<�ÿ����� ����.gif>)