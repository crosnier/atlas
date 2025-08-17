# Adhoc Job Compatibility Analysis

## Scope
Allow user to quickly copy/paste content from a job posting for GPT to perform a comparitive analysis and classify the user's compatibility with the role. 

>Note: Compatibility is determined based on user's work history and any other predefined criteria or attributes.


## Prompt Configuration



ORIGINAL
```
Jost Listing Comparative Analysis. 

  

I will provide a job listing, either via URL or pasting in the actual job description detail. You will run an analysis of the job description and do 3 things:

  

1. Compare my CV to the job discription and assign a compatibility score percentage based on how compatible I am of the role. The object Is to determine how easily I could perform the job based on my experience and skills.  

  

2. In 5 sentences or less, tell me what the job is expected to do and what department it's in. 

  

3. Assign a tag to each job listing. Next to the [company name] - [job title] - [salary range] - [percentage] - [tag]

70% or higher AND salary range includes a number $125,000 or higher = tag as 'APPLY'

55-70% AND salary range includes a number $125,000 or higher = tag as 'CONSIDER'

40-55% AND salary range includes a number with a range where $110,000 to $124,000 falls within it = tag as 'STRETCH'

0-40% tag as 'NOPE'

  

  

Ready to start receiving job descriptions?
```


MODIFICATION
```
I want you to make a few changed to your response format...

  

- tag should be the first line in your response as follows but bold text

company name - job title - salary range - percentage - tag

  

Don't number the sections. Sections should be titled as follows. 

COMPATIBILITY DETAIL

  

JOB OVERVIEW

...include the text here describing the role as previously requested.

  

Department: ...list department name here... followed by text describing the department as I previously requested.

  

  

Lastly, each time a new job is analyzed in this chat thread, I want you to also append the first line of the response `company name - job title - salary range - percentage - tag` into a table, then at the end of each analysis response you will provide the amended table. As the list grows, the table should become longer and longer.  I want to be able to look at the last analysis response and see the lasted 'Analysis Summary Table'  of all the ones assessed thus far.

  

Good?
```



## Overview of Input and Output

### Input
