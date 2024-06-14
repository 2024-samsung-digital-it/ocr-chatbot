#!/bin/bash

# Activate the conda environment
source ~/miniconda/bin/activate samsung2

# Start Ollama in the background
ollama serve &

# Wait for Ollama to start
sleep 10

# Run the model creation command
ollama create Llama-3-Open-Ko-8B-Q8_0 -f /samsung-digital-it-team2/Modelfile

# Start Chainlit server
chainlit run /samsung-digital-it-team2/chatbot_final.py --port 8000
