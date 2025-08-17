# LLM Token Counter

build a local python-based LLM token analyzer

````
# 🧠 Token Counter CLI Utility for LLM Message Analysis

## 📌 Project Summary
This project provides a lightweight, local Python-based CLI tool to:
- Count tokens in any given input message
- Estimate token usage cost for different LLMs (e.g., Mistral, Claude)
- Support quick message cost estimation during development and testing
- Use model-accurate tokenizers (e.g., HuggingFace for Mistral)

Ideal for developers interacting with Amazon Bedrock or OpenAI APIs where token-level billing matters.

---

## 🧪 Scope / Features

- [x] Accept multiline input from stdin
- [x] Use transformer tokenizer for accurate model token count
- [x] Estimate cost for:
  - Mistral 7B via Bedrock
  - Claude 3 Sonnet
- [ ] Optional: Add OpenAI GPT-4 cost estimation
- [ ] Optional: Add CLI args support for piping messages
- [ ] Optional: Add GUI/TUI frontend

---

## 🧰 Requirements

Create a `requirements.txt`:
```text
transformers
````

Install with:

```
pip install -r requirements.txt
```

---

## **🧠 Initial Python Script**

Save this as token_counter.py:

```
from transformers import AutoTokenizer

# Choose the tokenizer for the model you're simulating
MODEL_NAME = "mistralai/Mistral-7B-Instruct-v0.1"

tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)

def count_tokens(text):
    return len(tokenizer.encode(text))

def estimate_cost(tokens, rate_per_1k):
    return (tokens / 1000) * rate_per_1k

if __name__ == "__main__":
    import sys
    print("Paste your message below (Ctrl+D to finish on Mac/Linux, Ctrl+Z then Enter on Windows):\n")
    input_text = sys.stdin.read()
    tokens = count_tokens(input_text)
    print(f"\n---\nToken count: {tokens}")

    # Estimated cost (based on Bedrock pricing, July 2025)
    mistral_cost = estimate_cost(tokens, 0.00015)
    claude_input = estimate_cost(tokens / 2, 0.003)
    claude_output = estimate_cost(tokens / 2, 0.009)
    claude_total = claude_input + claude_output

    print(f"Estimated Mistral 7B Cost: ${mistral_cost:.6f}")
    print(f"Estimated Claude 3 Sonnet Cost: ${claude_total:.6f}")
```

---

## **📅 Next Steps / TODOs**

- Add logging to CSV for usage tracking
    
- Support OpenAI GPT token estimation via tiktoken
    
- Package as a CLI tool (argparse or click)
    
- Optional: Wrap in simple GUI for drag-and-drop use
    

---

_“Tokens don’t grow on trees — track ‘em like your cloud bill depends on it.”_

```
Let me know if you want a GitHub-style `README.md` variant or a GUI/TUI follow-up.
```