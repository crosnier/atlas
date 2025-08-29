# Index of Job Search Activity and Resources
*listing of all job search related content*

[watchlists](watchlists.md) -- *critical index of search queries, company targets, and job titles*
[titles](titles.md) -- *index of job titles to leverage in search activities*

---
## job listings by status
*all jobs, sorted by status*
```dataviewjs
const sortOrder = ["draft", "queued", "applied", "discarded", "rejected"];

let pages = dv.pages('"01-areas/job/job-search-01/jobs"');

// Files missing job_status
let missingStatus = pages
  .where(p => !p.job_status)
  .sort(p => p.file.ctime, 'desc');

// Files with defined job_status
let definedStatus = pages
  .where(p => sortOrder.includes(p.job_status))
  .sort(p => sortOrder.indexOf(p.job_status));

// Combine both sets
let allPages = missingStatus.concat(definedStatus);

dv.table(
  ["link", "company", "title", "salary", "status"],
  allPages.map(p => [
    `[link](${p.file.path})`,
    p.company ?? "",
    p.title ?? "",
    p.salary_range ?? "",
    p.job_status ?? "**⚠️ missing**"
  ])
);
```
> *status values: draft, queued, applied, discarded, rejected*

---
## old pool rejections

*queued, never applied*
```dataview
list
from "01-areas/job/job-search-01/old-pool/01-queued"
```
*rejected*
```dataview
list
from "01-areas/job/job-search-01/old-pool/05-rejected"
```
