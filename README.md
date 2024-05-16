# Netflix-Project
Full analysis of Netflix 4 file  database using Excel, Sql, Tableau
Files:
  1.raw_credits
  2.raw_titles
  3.Best Shows Netflix
  4.Best Movies Netflix

A. Spreadsheets cleaning data:
  
    1. Remove duplicates
    2. Remove rows with a lot missing values
    3. Standardizing Production Country Format i.e ['US'] to US
    4. Genre Data Transformation: Extraction of Main Genre. ie. ['western','action','european'] 
       to Western
     
           i. Using Find and Replace to erase the symbols
     
           ii. using excel formula: =LEFT(SUBSTITUTE(MID(A1,2,LEN(A1)-2),",",", 
            "),FIND(",",SUBSTITUTE(MID(A1,2,LEN(A1)-2),",",", "))-1) to keep only the first 
             word.
     
           iii. create new column as "main_genre" and copy-paste only Values



B. SQL Analysis:

 
    1.'Average Imdb score by Type'
  
    2.'Top 20 high rated movies(8.0+) on Netflix '
  
    3.'Top 10 Movies and Shows'
  
    4.'Analysis of Actor Participations in Highly Voted Movies '
  
    5.'Analysis of Movie Cast Sizes and IMDb Scores'
  
    6.'Analysis of Title Distribution by Genre and Type (Movies vs. Shows)'
  
    7.'Comparison of Total Votes for Movies and Shows by Production Country'
  
    8.'Comparison of Total Votes and Ratings for Movies and Shows by Production Country'

C. Visualization with Tableau:

  -- Two Dashboards containing the follow worksheets:--
  
    1. Average score by Type
    2. Total votes by Genre & Type of Show  
    3. Top 10 titles most voted titles (movies and shows combined)
    4. Number of titles (movies and shows) released each year
    5. Trend of total votes for titles released in the last 5 years
    6. Distribution of genres for movies and shows
    7. Average number of seasons for shows
    8. Top 10 production countries with the highest average score 
