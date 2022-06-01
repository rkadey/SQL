Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000 (id)
ii. Hours = 1562 (business_id)
iii. Category = 2643    (business_id)
iv. Attribute = 1115 (business_id)
v. Review = 10000 (id), 8090 (business_id), 9581 (user_id)
vi. Checkin = 493 (business_id)
vii. Photo = 10000 (id), 6493 (business_id)
viii. Tip = 537 (user_id),  3979 (business_id)
ix. User = 10000 (id)
x. Friend = 11 (user_id)
xi. Elite_years = 2780 (user_id

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer:No
	
	
	SQL code used to arrive at answer:

SELECT 
	id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars, 
	compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, 
	compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos
FROM  
	user
WHERE 
	id IS null
OR 
	name IS null
OR 
	review_count IS null
OR 
	yelping_since IS nullIS
OR 
	useful IS null
OR 
	funny IS null
OR 
	cool IS null
OR 
	fans IS null
OR 
	average_stars IS null
OR 
	compliment_hot IS null
OR 
	compliment_more IS null
OR 
	compliment_profile IS null
OR 
	compliment_cute IS null
OR 
	compliment_list IS null
OR 
	compliment_note IS null
OR 
	compliment_plain IS null
OR 
	compliment_cool IS null
OR 
	compliment_funny IS null
OR 
	compliment_writer IS null
OR 
	compliment_photos IS null
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

i. Table: Review, Column: Stars
min: 1 max: 5 avg: 3.7082

ii. Table: Business, Column: Stars
min: 1.0 max: 5.0 avg: 3.6549

iii. Table: Tip, Column: Likes
min: 0 max: 2 avg: 0.0144

iv. Table: Checkin, Column: Count
min: 1 max: 53 avg: 1.9414

v. Table: User, Column: Review_count
min: 0 max: 2000 avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
SELECT 
	city, sum(review_count)
FROM 
	business
GROUP BY 
	city
ORDER BY 
	sum(review_count) DESC
	
	Copy and Paste the Result Below:
	+-----------------+-------------+
| city            | count(b.Id) |
+-----------------+-------------+
| Las Vegas       |        1561 |
| Phoenix         |        1001 |
| Toronto         |         985 |
| Scottsdale      |         497 |
| Charlotte       |         468 |
| Pittsburgh      |         353 |
| Montréal        |         337 |
| Mesa            |         304 |
| Henderson       |         274 |
| Tempe           |         261 |
| Edinburgh       |         239 |
| Chandler        |         232 |
| Cleveland       |         189 |
| Gilbert         |         188 |
| Glendale        |         188 |
| Madison         |         176 |
| Mississauga     |         150 |
| Stuttgart       |         141 |
| Peoria          |         105 |
| Markham         |          80 |
| Champaign       |          71 |
| North Las Vegas |          70 |
| North York      |          64 |
| Surprise        |          60 |
| Richmond Hill   |          54 |
+-----------------+-------------+
(Output limit exceeded, 25 of 362 total rows shown)

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon - 10 4.0 ratings

SQL code used to arrive at answer:
SELECT 
	stars AS [Star Rating], COUNT(stars) AS [COUNT]
FROM 
	business b
WHERE 
	city = 'Avon'
GROUP BY 
	stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):
| stars | count(b.stars) |
+-------+----------------+
|   4.0 |              1 |
|   5.0 |              1 |
|   3.5 |              2 |
|   3.5 |             11 |
|   3.0 |              4 |
|   5.0 |              3 |
|   3.5 |              1 |
|   3.5 |              2 |
|   3.0 |              3 |
|   4.5 |              2 |
|   3.0 |             27 |
|   4.0 |             10 |
|   4.5 |              7 |
|   5.0 |             36 |
|   3.0 |              3 |
|   5.0 |             14 |
|   4.5 |              3 |
|   4.5 |              2 |
|   4.5 |              2 |
|   3.5 |             13 |
|   3.5 |              6 |
|   4.5 |              1 |
|   4.5 |              8 |
|   4.0 |              2 |
|   3.5 |              1 |
+-------+----------------+

ii. Beachwood - 14 5.0 ratings

SQL code used to arrive at answer:

SELECT 
	stars AS [Star Rating], COUNT(stars) AS [COUNT]
FROM 
	business b
WHERE 
	city = 'Beachwood'
GROUP BY 
	stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):

| stars | count(b.stars) |
+-------+----------------+
|   4.0 |              1 |
|   5.0 |              1 |
|   3.5 |              2 |
|   3.5 |             11 |
|   3.0 |              4 |
|   5.0 |              3 |
|   3.5 |              1 |
|   3.5 |              2 |
|   3.0 |              3 |
|   4.5 |              2 |
|   3.0 |             27 |
|   4.0 |             10 |
|   4.5 |              7 |
|   5.0 |             36 |
|   3.0 |              3 |
|   5.0 |             14 |
|   4.5 |              3 |
|   4.5 |              2 |
|   4.5 |              2 |
|   3.5 |             13 |
|   3.5 |              6 |
|   4.5 |              1 |
|   4.5 |              8 |
|   4.0 |              2 |
|   3.5 |              1 |
+-------+----------------+
(Output limit exceeded, 25 of 362 total rows shown)		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
SELECT 
	name, review_count
FROM 
	user
ORDER BY 
	review_count DESC
LIMIT 3
		
	Copy and Paste the Result Below:
+-----------+--------------+
| name      | review_count |
+-----------+--------------+
| Gerald    |         2000 |
| Sara      |         1629 |
| Yuri      |         1339 |		


8. Does posing more reviews correlate with more fans?
No
	Please explain your findings and interpretation of the results:

Including number of fans in data set indicates that there is no correlation between review count and number of fans	
+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Gerald    |         2000 |  253 |
| Sara      |         1629 |   50 |
| Yuri      |         1339 |   76 |
| .Hon      |         1246 |  101 |
| William   |         1215 |  126 |
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:more reviews with the word "love"

	
	SQL code used to arrive at answer:
SELECT 
	'love' Word, COUNT(text) [Total Count]
FROM 
	review
WHERE 
	text LIKE '%love%'
UNION
SELECT 
	'hate' Word, COUNT(text) [Total Count]
FROM 
	review
WHERE 
	text LIKE '%hate%
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
SELECT 
	name, fans
FROM 
	user
ORDER BY 
	fans DESC
LIMIT 10
	
	Copy and Paste the Result Below:
| name       | fans |
+------------+------+
| Amy        |  503 |
| Mimi       |  497 |
| Harald     |  311 |
| Gerald     |  253 |
| Christine  |  173 |
| Lisa       |  159 |
| Cat        |  133 |
| William    |  126 |
| Fran       |  124 |
| Lissa      |  120 |
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
No, distribution of hours is not a factor.

ii. Do the two groups you chose to analyze have a different number of reviews?
     Yes, review count has been included in analysis    
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

SQL code used for analysis:
SELECT *
FROM business 
WHERE CITY like '%Vegas%'
GROUP BY stars
ORDER BY stars DESC

+------------------------+-------------------------------+---------------+-----------------------------+-----------------+-------+-------------+----------+-----------+-------+--------------+---------+
| id                     | name                          | neighborhood  | address                     | city            | state | postal_code | latitude | longitude | stars | review_count | is_open |
+------------------------+-------------------------------+---------------+-----------------------------+-----------------+-------+-------------+----------+-----------+-------+--------------+---------+
| 385PMU1ucAtusQVaoqQjTQ | star 5 plumbing               | Spring Valley | 9780 Galahad Pt Ct          | Las Vegas       | NV    | 89147       |  36.1222 |  -115.306 |   5.0 |            4 |       1 |
| 38fDU-Bh7eD2oETpF24pAA | Made In Italy Pizzeria Romana | Spring Valley | 5447 S Rainbow Blvd, Ste E6 | Las Vegas       | NV    | 89118       |  36.0896 |  -115.243 |   4.5 |           10 |       0 |
| 38LezjERmeB48zRSqvMoFQ | Martin's Mart Thrift Store    | Downtown      | 1219 S Main St              | Las Vegas       | NV    | 89104       |  36.1568 |  -115.154 |   4.0 |            4 |       1 |
| 36qbJUFglkSb4BcblyTl3A | Shepherd Eye Center           | Summerlin     | 2100 N Rampart Blvd         | Las Vegas       | NV    | 89128       |  36.1983 |  -115.283 |   3.5 |           26 |       1 |
| 35X1ZV9tSEqB__yJEAhuhQ | AutoNation Toyota Las Vegas   | Westside      | 6300 West Sahara Ave        | Las Vegas       | NV    | 89146       |  36.1451 |  -115.231 |   3.0 |          355 |       1 |
| 387XEwERYeyodpV5DWR4hA | Denny's                       |               | 3230 Losee Rd               | North Las Vegas | NV    | 89030       |  36.2183 |  -115.126 |   2.5 |           35 |       1 |
| 30LY9Q0iYNQEdcUgQ2yAOg | Auto Air & More               |               | 4295 W Tropicana Ave        | Las Vegas       | NV    | 89103       |  36.1003 |  -115.197 |   2.0 |            8 |       1 |
| 32u4chtkG4fIa52396iOhw | Papa John's Pizza             | Sunrise       | 241 N Nellis Blvd, Ste 102  | Las Vegas       | NV    | 89110       |  36.1659 |  -115.063 |   1.5 |           27 |       1 |
| 34kCRaTxtLA6iyQVTYOBTA | Safeco Insurance              | Spring Valley | 10175 Spring Mountain Rd    | Las Vegas       | NV    | 89117       |  36.1259 |  -115.314 |   1.0 |            4 |       1 |
+------------------------+-------------------------------+---------------+-----------------------------+-----------------+-------+-------------+----------+-----------+-------+--------------+---------+	
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
 Type of business (based on name)         
         
ii. Difference 2:
  Location (based on city)       
         
         
SQL code used for analysis:
SELECT 
	name, city, stars, review_count, is_open
FROM 
	business
GROUP BY 
	is_open
ORDER BY 
	stars DESC
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
   Looking at what makes a top-rated business     
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
    I choose to join businesses data with categories to see if how a company was classified influenced ratings.  I also looked at location and number of reviews.  Whether a business was still open or not was also a factor.                       
                  
iii. Output of your finished dataset:
  +--------------------------------+-------------------+----------+-------+--------------+---------+
| name                           | city              | category | stars | review_count | is_open |
+--------------------------------+-------------------+----------+-------+--------------+---------+
| Horton Carpet Cleaning         | Ahwahtukee        |     None |   5.0 |           15 |       1 |
| ODBQ                           | Ambridge          |     None |   5.0 |           29 |       1 |
| Goodyear Chiropractic          | Avondale          |     None |   5.0 |           20 |       1 |
| Studio Mz                      | Beachwood         |     None |   5.0 |            4 |       1 |
| Deni's Door Service            | Broadlands        |     None |   5.0 |            4 |       1 |
| SYNERGY HomeCare               | Broadview Heights |     None |   5.0 |            3 |       1 |
| Brooklin Bakery                | Brooklin          |     None |   5.0 |            3 |       0 |
| Samuels Income Tax             | Brunswick         |     None |   5.0 |            3 |       1 |
| L.C's World Tae Kwon Do        | Cave Creek        |     None |   5.0 |            3 |       1 |
| 12th House Interiors           | Chagrin Falls     |     None |   5.0 |            4 |       1 |
| Tootsie's Tap                  | Dane              |     None |   5.0 |            7 |       1 |
| Parks Automotive               | De Forest         |     None |   5.0 |            6 |       1 |
| First Impressions Dental       | East Gwillimbury  |     None |   5.0 |            3 |       1 |
| Fort Mill Vision Center        | Fort Mill         |     None |   5.0 |            7 |       1 |
| Trattoria Gallo Nero Beccofino | Freyburg          |     None |   5.0 |            6 |       1 |
| The Family Pet Clinic          | Garfield Heights  |     None |   5.0 |           11 |       1 |
| Shutter Envy                   | Gilbert           |     None |   5.0 |            3 |       1 |
| Nicole Podrat, D.M.D           | Glenshaw          |     None |   5.0 |            3 |       0 |
| Inkz Tattoo Company            | Guadalupe         |     None |   5.0 |            4 |       1 |
| Colette's Body & Sole Day Spa  | Houston           |     None |   5.0 |            4 |       1 |
| Dani's Hair Loft               | Kennedy Township  |     None |   5.0 |            3 |       1 |
| Deli La Trattoria              | Kirkland          |     None |   5.0 |            8 |       1 |
| Boulangerie De L'ile Bizard    | L'ile-Bizard      |     None |   5.0 |            3 |       1 |
| Le Shack du Pêcheur            | La Prairie        |     None |   5.0 |            8 |       1 |
| Nikki's Collar Club            | Lyndhurst         |     None |   5.0 |            3 |       1 |
+--------------------------------+-------------------+----------+-------+--------------+---------+
                
         
iv. Provide the SQL code you used to create your final dataset:
SELECT
	b.name, b.city, c.category, b.stars, b.review_count, b.is_open 
FROM 
	business b 
LEFT JOIN 
	category c
ON 
	b.id = c.business_id
GROUP BY 
	b.city 
ORDER BY 
	b.stars DESC