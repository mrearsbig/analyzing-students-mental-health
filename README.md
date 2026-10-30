# Analyzing Students' Mental Health

![Mental health analysis](./docs/image.png)

Exploratory PostgreSQL analysis of the relationship between international
students' length of stay in Japan and their mental health indicators.

## Context

A Japanese international university surveyed its students in 2018. The study,
published in 2019, found that international students may face a higher risk of
mental health difficulties, and that social connectedness and acculturative
stress predict depression.

This project explores whether the data support a similar conclusion for
international students and whether length of stay is a related factor. The
analysis shows descriptive associations; it does not establish causation.

## Data

The [`data/students.csv`](./data/students.csv) file contains the survey
responses. The main columns are:

| Column | Description |
| --- | --- |
| `inter_dom` | Student type: international (`Inter`) or domestic |
| `japanese_cate` | Japanese language proficiency |
| `english_cate` | English language proficiency |
| `academic` | Current academic level: undergraduate or graduate |
| `age` | Current age |
| `stay` | Current length of stay, in years |
| `todep` | Total depression score from the PHQ-9 |
| `tosc` | Total social connectedness score from the SCS |
| `toas` | Total acculturative stress score from the ASISS |

## Using PostgreSQL

1. Create a database and run [`sql/schema.sql`](./sql/schema.sql) to create the
   `students` table:

   ```bash
   psql -d database_name -f sql/schema.sql
   ```

2. Import the file using `psql`, for example:

   ```sql
   \copy students FROM 'data/students.csv' WITH (FORMAT csv, HEADER true, NULL '')
   ```

3. Run [`sql/analysis.sql`](./sql/analysis.sql) against that database:

   ```bash
   psql -d database_name -f sql/analysis.sql
   ```

The query filters for international students, groups them by length of stay, and
calculates the student count and average depression, social connectedness, and
acculturative stress scores.

## Structure

```text
data/students.csv   Original survey data
sql/schema.sql      PostgreSQL table definition
sql/analysis.sql    Main analysis query
docs/               Project visual resources
```

## Source

The data come from a 2018 survey of students at a Japanese international
university. The survey was discussed in a study published in 2019 on the
mental health of international students, social connectedness, and
acculturative stress. The CSV and study context are provided as the source
material for this project.

## Findings and limitations

The analysis groups international students by length of stay and compares their
average depression, social connectedness, and acculturative stress scores. These
results can be used to assess whether length of stay is associated with
different mental health profiles and whether they are consistent with the
study's conclusions.

The results describe associations in one university's 2018 survey. They do not
establish that length of stay causes changes in depression, social
connectedness, or acculturative stress, and they should not be generalized to
all international students.
