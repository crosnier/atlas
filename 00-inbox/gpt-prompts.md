
# GPT Prompts




## **Job Compatibility Analysis**

```
Comparative analysis analyzing my CV work history against the supplied job description / job posting details.

I will provide a job listing, either via URL or pasting in the actual job description detail. You will run an analysis of the job description and do 3 things:


**Compatibility Detail**
Compare my CV to the job description and assign a compatibility score percentage based on how compatible I am for the role. The object Is to determine how easily I could perform the job based on my experience and skills.  The score value and explanation of the score will be included in this section.

  
**Job Overview**
-Remote Status-
In one word, is it either `onsite` or `hybrid` or `remote`

-Expectations-
In 5 sentences or less, tell me what the job is expected to do. 

-Department-
What department is the job within, and where do they exist in the company heirarchy.


**Tagging**
Assign a tag to each job listing and format the full job entry it as follows, and we'll refer to it as the 'Tagged Job Entry':
`company name - job title - salary range - remote status - percentage - tag

Tag Assignment Criteria
- 70% or higher AND salary range includes a number $125,000 or higher = tag as 'APPLY'
- 55-70% AND salary range includes a number $125,000 or higher = tag as 'CONSIDER'
- 40-55% AND salary range includes a number with a range where $110,000 to $124,000 falls within it = tag as 'STRETCH'
- 0-40% tag as 'NOPE'
NOTE: Once calculated, don't recalculate unless I explicitly request a tag recalculation.


**GPT Response Layout**: 
Tagged Job Entry should be the first line in the response in BOLD text.
Department Name should be the second line in the response in Italics.  

Blank rows exist between each of the sections

COMPATIBILTY DETAIL

JOB OVERVIEW

ANALYSIS SUMMARY TABLE
*each time a new job is analyzed, append the 'Tagged Job Entry' line into a table called 'ANALYSIS SUMAMRY TABLE'. Provide the amended table at the end of each analysis response provided. As the list grows, the table should become longer and longer. I want to be able to look at the most recent analysis resposne in the thread and be able to see the Analysis Summary Table of all the ones assessed thus far. Keep them sorted based on their order of submission into the thread (first on top to last on bottom). It's a visual reference point that Ill refer to frequently to perform other actions elsewhere in my process.
Be sure to always include all historical job listings from the thread in the table.*


trigger prompt information:
You will watch for a new chat message from me somehow indicating the message is a 'new job'. Perhaps using the key words 'job' or 'new job' or similar. Use common sense. 
immediately following the key word, the next line will have the 'Company - Job Title'
Then after that I'll paste in either the publicly accessible job listing URL OR just paste in the full text directly. 

Ready to start receiving job listings and execute the request analysis?
```


---

## Tailored Cover Letter


```
**Tailored Cover Letter Prompt**

Generate cover letters tailored to Leverage my CV's work history AND the specific job's 'Job Compatibility Analysis' output AND my chosen Cover Letter Template to generate new cover letters for each of the job's I intend to apply for.

For each new job, I'll begin the prompt with job title as {comapany} - {job title}. Before beginning cover letter generation, verify that you located all source material. If you are missing something, tell me and don't proceed without it. 

**Term Replacements**
Terms in this list should not be used within the cover letter text and replaced by one of the corresponding acceptable terms listed. Acceptable terms are comma delimited. Only choose one based on which fits best in the intended context. 

list format: {bad term} > {new term 1, new term 2, new term 3}
- 

Using the below Cover Letter Format and Approved Draft of my Cover Letter used in another application, generate it as a pre-formatted downloadable .docx file

The 'Job Compatibilty Analysis' Thread contains the following information 'assets' necessary to generate this cover letter
- My latest CV containing my work history, skills, and professional summary
- Job Compatibility Analysis input (job listing) and output for the corresponding {job title} for which i'm creating a cover letter to submit with my appplication. Locate the corresponding job title to leverage.


**Cover Letter Format**
- .docx
- 'narrow' margins: 0.5in top/bottom/left/right
- Georgia font
- LIne spacing 1.15
- body is font size 11 font unless otherwise specified
- {Bryan Crosnier} as first line, bolded, font size 16
- {bryan.crosnier@gmail.com | 720-438-0128 | Nashville, TN | linkedin.com/in/crosnier} as second line, bolded, font size 11
- blank lines exist between each component or paragraph, except:
	- first and second lines stay together with no blank lines
	- letter Greeting and first paragaph
- Addressing recipients:
	- "Application for {job title}"
	- "Dear {company} Hiring Team,"
	- Sincerely, {blank line} {my name}



Approved Draft of my Cover Letter used in another application

**Bryan Crosnier**
**bryan.crosnier@gmail.com** **| 720-438-0128 |** **Nashville, TN** **|** **linkedin.com/in/crosnier**

March 24, 2025

Application for **Lead, Business Process Improvement**

Dear Airbnb Hiring Team,

I’m excited to apply for the Lead, Business Process Improvement role at Airbnb. With over a decade of experience driving business process transformation, customer operations strategy, and scaling service delivery through technology implementation and human workflow optimization, I’m confident in my ability to make a meaningful impact on Airbnb’s Community Support organization.

Most recently, as a Senior Staff Operations Strategist at Maxar Technologies, I led multiple end-to-end process improvement initiatives across customer support, product, and engineering—delivering measurable improvements across global operations. I’ve built and scaled Tier 1–3 support models, established KPI frameworks, and designed workforce strategies that balanced efficiency with customer experience—all through deep collaboration with stakeholders across Sales, Product, Program Management, and Operations.

My background includes extensive experience analyzing customer journey pain points, developing scalable solutions, and launching new operating models. I’ve led initiatives to optimize tools and processes while bringing structure to ambiguity. Though I don't hold a formal Lean Six Sigma certification, I’ve applied its core principles across multiple enterprise-level transformations to achieve lasting impact.

I’m passionate about building systems that streamline workflows and improve the customer experience—characteristics critical to the success of this role.  I look forward to bringing that focus and solution-oriented approach to Airbnb’s Community Support organization.

Thank you for considering my application. I look forward to the opportunity to discuss how I can contribute to Airbnb’s continued success and innovation.

Sincerely, 

Bryan Crosnier


Once all of the above content is consumed and understood, simply start the process by saying:
**“Ready to begin generating cover letters. Please send me the next job listing prompt in the format: {company} - {job title}.”**

Each time a cover letter is created for a new unique Job, append it to a table called 'Tailored Cover Letters Created' with each row usign the format:
Company - Title - Pay Range - Date Cover Letter Created


```


## Value-Based Project Summaries

