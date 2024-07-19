# Netflix Originals Data Analysis Project

## Project Overview

This project involves analyzing Netflix Originals data to extract meaningful insights using Python and SQL. The main objective is to understand various aspects of Netflix Originals, such as their IMDb scores, distribution by genre and language, and more.

## Data Description

The dataset used for this project is a CSV file containing information about Netflix Originals. The key columns in the dataset include:

- `title`: Title of the Netflix Original
- `genre`: Genre of the Netflix Original
- `premiere`: Premiere date of the Netflix Original
- `runtime`: Runtime of the Netflix Original in minutes
- `imdb_score`: IMDb score of the Netflix Original
- `language`: Language in which the Netflix Original is available
- `year`: Year of release (added to the dataset)

## Tools and Technologies

- **Python**: For data cleaning and initial analysis.
- **SQL**: For advanced queries and data manipulation.

## Workflow

### 1. Data Preparation with Python

- **Loading Data**: The data was loaded into a Pandas DataFrame.
- **Data Cleaning**:
  - Converted column names to lowercase.
  - Removed missing values.
  - Removed duplicate entries.
- **Data Transformation**: Converted the `premiere` column to date format and added a `year` column.

### 2. SQL Analysis

- **Database Setup**:
  - Created a PostgreSQL database and imported the cleaned CSV data.
  - Used SQL queries to perform the following tasks:
    - Count distinct titles.
    - Find movies with IMDb scores above 7.
    - Count movies by language.
    - Calculate average IMDb scores for genres.
    - Identify top genres by IMDb scores.
    - Find movies surpassing average genre IMDb scores.
    - Count movies by genre before 2020.
    - Identify the highest-rated Netflix movie.
    - Find movies with similar genres released within a week of each other.
    - Determine the top-ranked genre for each year.
    - Analyze genre and language dynamics for content with longer runtimes.

## Instructions for Running the Project

1. **Setup Database**:
   - Create a database in PostgreSQL and import the cleaned CSV file using the SQL commands provided.

2. **Run SQL Queries**:
   - Execute the SQL queries in your database management tool to gather insights.

## Files

- `nNetflixOriginals.csv`: The raw dataset.
- `cleaned_netflix_originals_dataset.csv`: The cleaned dataset used for analysis.
- `sql_queries.sql`: SQL queries used for data analysis.
- `clean_data.py`: Python script for data cleaning.

## Conclusion

This project provides a comprehensive analysis of Netflix Originals data, offering insights into various aspects of content performance, distribution, and trends. The combination of Python for data preparation and SQL for querying enables a detailed examination of the data.