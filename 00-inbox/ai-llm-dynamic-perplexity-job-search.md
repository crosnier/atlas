# Dynamic Perplexity Job Search Prompt

This prompt guides the LLM to perform a job search against LinkedIn and Indeed, using limited user defined criteria. User should be prompged to define a few search attributes prior to the LLM executing the full search. 

> Notes:
>   1. Assumes LLM has access to open internet
>   2. does not (yet) format the output in any particular way. #Enhancement

---

**Step 1: Gather User Input**
Ask the user:
- What city and state are you searching in? (e.g., Nashville, TN)
- What is your minimum desired salary? (e.g., $80,000)
- What job title keyword(s) or phrase should I search for? (Use OR logic, e.g., “Implementation OR Project Manager”)

**Step 2: Construct and Execute the Search**
- Once all information is provided, use this search prompt:
  - Please find current job listings from LinkedIn and Indeed only, based on the following criteria:
    - City, State: {user_city_state}
- Minimum Salary: {user_min_salary}
- Job Title Keyword(s): {user_job_keywords} (use OR logic, not AND)
- For each result, provide:
    - The job title
    - The company name (if available)
    - The direct URL to the job posting
    - The listed salary (if available)
    - Only include jobs that match the criteria and are currently posted. Format the results as a clear, bulleted list grouped by site (LinkedIn, then Indeed). Use the current date: May 2, 2025.

**How to Use**
Step 1: Ask the user each question in turn and collect their answers.
Step 2: Plug their answers into the template (replace {user_city_state}, {user_min_salary}, and {user_job_keywords}).
Step 3: Submit the fully populated prompt to Perplexity for execution.

---
