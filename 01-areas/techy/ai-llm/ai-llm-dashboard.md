# AI LLM Dashboard

This dashboard serves as a centralized reference point for all AI LLM-related workflows. It covers prompt engineering, model selection, self-hosted solutions, ongoing research, and tool integrations. Use this page to organize, compare, and evolve your approaches to leveraging large language models across development, writing, and automation tasks.  

- [AI LLM Dashboard](#ai-llm-dashboard)
  - [Types of Prompts](#types-of-prompts)
    - [Structural](#structural)
    - [Functional](#functional)
    - [Reasoning](#reasoning)
    - [Multimodal](#multimodal)
    - [Definitions](#definitions)
  - [Prompt Library](#prompt-library)
  - [My Model Selections](#my-model-selections)
    - [Code Development](#code-development)
    - [Resume Generation \& Text-Based Tasks](#resume-generation--text-based-tasks)
  - [Self-Hosted Model Notes](#self-hosted-model-notes)
  - [Research Archive](#research-archive)
  - [Tool Integrations \& Workflows](#tool-integrations--workflows)


---
## Types of Prompts

### Structural
- system (system)
- instruction (instruction)
- user (user)
- context injection (context)

### Functional
- function-calling (function)
- roleplay / simulation (roleplay)
- chat formatting / role separators (formatting)

### Reasoning
- chain-of-thought / reasoning scaffolds (reasoning)
- memory manipulation (memory)

### Multimodal
- multimodal input (image/audio) (multimodal)

---
### Definitions

- system - Controls model behavior with overarching instructions (e.g., "system: You are a helpful assistant.")  
- instruction - One-shot user tasks or instructions (e.g., "Write a summary of this article.")  
- user - Task-oriented user input (e.g., "How do I implement a binary search?")  
- context injection - Embedding files, messages, or data into context (e.g., including "terms_of_service.txt" content)  

- function-calling - Tool usage or code execution prompts (e.g., calling `getWeather(location)`)  
- roleplay - Simulations or role-based interactions (e.g., "You are a customer support agent.")  
- chat formatting - Formatting chat messages or role separators (e.g., "[User]: Hello\n[Assistant]: Hi, how can I help?")  

- chain-of-thought - Reasoning scaffolds to guide model logic (e.g., "Step 1: Identify variables. Step 2: Solve equation.")  
- memory manipulation - Managing or altering model memory state (e.g., "Remember user's preferred language.")  

- multimodal - Input involving images, audio, or other media (e.g., uploading a photo for description)  

---
## Prompt Library

This library contains all prompt assets used for instruction, generation, automation, and agent behaviors. Each prompt is stored as a separate Markdown file with YAML frontmatter and organized into folders by prompt type (e.g. system, instruction, reasoning). A dedicated `-blueprints/` folder contains complete multi-prompt workflows for specific use cases.

**Principles:**
- Use standard Markdown format with `![](./-assets/image.png)` for all attachments
- Store images in a local `-assets/` folder adjacent to each prompt
- Avoid Obsidian-style wikilinks for compatibility with external tools
- Favor self-contained folders for easy backup, version control, and reuse

**file organization**
*includes sample files for reference*
```markdown
prompt-library/
├── -blueprints/
│   └── resume-automation-stack.md
├── system/
│   └── persona-architect.md
├── instruction/
│   └── summarize-article.md
├── user/
│   └── bash-help.md
├── context/
│   └── job-description-injection.md
├── function/
│   └── call-weather-api.md
├── roleplay/
│   └── simulate-interview.md
├── formatting/
│   └── markdown-conversation-template.md
├── reasoning/
│   └── chain-of-thought-examples.md
├── memory/
│   └── remember-user-preference.md
├── multimodal/
│   └── describe-image.md
```


---

## My Model Selections
### Code Development
*best models to leverage amidst coding activity*

- **Qwen2.5-Coder-7B-Instruct** → Multi-file scaffolding and architecture
- **DeepSeek-Coder-6.7B** → Isolated functions and refactoring
- **Qwen2.5-Coder-3B** → Bash scripts and small helper tasks
- **ChatGPT-5 (GPT-4o)** → Full-stack and structured codebases
- **Grok-4** → One-off functions
- **Gemini 1.5 Pro** → File cleanup and test writing
- **Perplexity AI** → Research and example gathering

---

### Resume Generation & Text-Based Tasks


**Top Tier**
- **ChatGPT-5 (GPT-4o)**
  - Best for full resume generation, ATS optimization, and cover letters
  - Strong reasoning, formatting, and tone control
- **Gemini 1.5 Pro**
  - Great for formatting, polishing, and summarization
  - Excels at cleanup and structured editing
- **LLaMA 3.2 11B**
  - Strong local option for structured text and logic-heavy tasks

**Mid Tier**
- **Perplexity AI**
  - Ideal for research and phrasing examples, not generation
- **Qwen2.5-Coder-7B-Instruct**
  - Useful for scaffolding resumes and section templates
- **DeepSeek-Coder-6.7B**
  - Great for bullet rewriting and impact statements

**Niche / Lightweight**
- **Qwen2.5-Coder-3B**
  - Handy for CLI-style resume tasks or format snippets
- **Grok-4**
  - Too informal for resumes; better for quick text hacks
- **LLaMA 3.2 1B / LLaMA 3.1 8B**
  - Basic proofreading and fast edits; limited context depth

| **Task Scenario**                                  | **Best Model ID**                             |
| -------------------------------------------------- | --------------------------------------------- |
| Resume creation, text reasoning, editing workflows | meta-llama/Llama-3.2-11B-Vision-Instruct      |
| Need base model or multimodal support later        | meta-llama/Llama-3.2-11B-Vision               |
| Want efficiency / low VRAM footprint               | SeanScripts/Llama-3.2-11B-Vision-Instruct-nf4 |

---

## Self-Hosted Model Notes
📁 Stored in: /ai-llm/notes
- Ollama / LM Studio / LocalAI comparisons
- Supported models and VRAM benchmarks
- Custom system prompts and fine-tuning

## Research Archive
📁 Stored in: /ai-llm/research
- AI trends and model benchmarks
- Prompt engineering discoveries
- API usage examples

## Tool Integrations & Workflows
📁 Stored in: /ai-llm/notes
- How each model fits into daily workflows
- API calls and automation logic
- Terminal, browser, and editor integrations

<!--
✅ Next Steps:
- Build out prompt library frontmatter format
- Parse and merge all `ai-*.md` files into logical sections of this dashboard
- Link related tools like token counters, LLM customization, instruction guides
- Consider tagging files by task type: resume, research, coding, etc.
-->
