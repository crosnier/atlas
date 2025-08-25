# 📝 Generating Personal Recommendations Using AI

AI-supported career recommendations for those of us who can *talk forever about someone's impact*—but struggle to structure it concisely. This guide will help you build an effective prompt to generate a personalized, professional endorsement using ChatGPT or other LLMs.

---

## 🧱 Overview

The generated prompt will walk you through a short interactive process:
1. Ask you for key input variables
2. Incorporate your style preferences
3. Output **3 draft recommendations** for you to choose and refine

---

## 🔤 Input Components

Each prompt collects specific information. You can skip any item by responding `"none"`.

| Variable | Description |
|----------|-------------|
| `name` | The first name of the person you're recommending |
| `duration` | How long you've worked with them (e.g., "5 years") |
| `characteristics` | The tone/style the output should reflect |
| `skills` | Skills you want to highlight or endorse |
| `work_history` | (Optional) The person's role or job title to reference |
| `highlights` | Key traits, memories, or stories you want to emphasize |

---

## 🚀 Sample LLM Prompt

Paste this into ChatGPT or your preferred LLM to begin:

```markdown
Objective: Write a personal recommendation for {name}, as though it’s written by me.

Instructions:
1. Prompt me to input responses for each of the following items. Ask them one at a time, and allow me to reply to each before continuing:
   - `name`
   - `duration`
   - `characteristics`
   - `skills`
   - `work_history` (optional)
   - `highlights`

2. Once I’ve answered them all, generate **3 versions** of a short recommendation.

   - Tone: Reflects the characteristics provided
   - Style: Written from the voice of a peer/coworker
   - Length: 2–5 sentences per version
   - Language: Supportive, appreciative, authentic (no corporate fluff)
   - Prioritize content I marked as highlights

3. Wait for me to pick one, then we’ll iterate from there.
```

---

## 🧪 Example Use Case

Let’s say you’re recommending someone named Ginger.

```markdown
name: Ginger
duration: 5 years
characteristics: professional, appreciative, peer-to-peer, no fluff
skills: change management, stakeholder engagement, organizational transformation
work_history: Senior Manager, Operations Transition and Transformation
highlights:
  - Worked with Ginger across multiple large-scale projects over 5 years at Maxar
  - Great thought partner during times of complex organizational change
  - Known for creative ways to build stakeholder accountability and awareness
```

The model will take this and generate 3 human-like drafts you can select from or revise.

---

## ✅ Best Practices

- Keep highlights specific and actionable
- Avoid overly generic input like "hard worker" or "great communicator"
- When in doubt: keep it simple, keep it real

---

*Use AI to say what you really mean—clearly, quickly, and confidently.*