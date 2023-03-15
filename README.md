# **Airbnb Seattle Cleaning and Data Analysis**

## Project Description

In this project, we used Python code to clean and prepare data and separate it into 15 tables that are 3NF. These tables include:

* listings
* review scores
* reviewer
* reviews
* cancellation policy
* room type
* property type
* bed types
* country
* neighbourhood
* host
* availability
* accommodations
* cost
* calendar

Then an Entity Relationship Diagram (ERD) was created in MySQL with appropriate connections to store this cleaned data. This information was used to answer business questions by translating each question into a language that was best interpreted for technical and business people before performing the query.

## Business Questions and Answers

**1. Does the daily price increase with the number of bathrooms?**

Answer: Yes, the price increased with the number of bedrooms, except for two outliers that were found to be part of a hostel/hotel property.

**2. Are weekly prices lower in properties with lesser bedrooms?**

Answer: For 0 to 1 bedrooms, the price is very similar, but in general, it continues to be true that the lower the number of bedrooms, the lower the price for weekly pricing.

**3. Will lower security deposits and cleaning fees lead to better reviews?**

Answer: The sum of the cost of security and cleaning was used to determine value, and the results from this query showed no correlation between the total fees and review score.

**4. Does the higher daily price result in higher deposit and cleaning fees?**

Answer: The property price was divided into four groups, and the average cleaning fee and security deposit were calculated within each group. It showed that the cleaning and security fees increase as the daily price of the property increases.

**5. Do properties that allow a higher number of extra guests have higher occupancy rates?**

Answer: No relation or pattern exists between the occupancy rate and the number of extra people a listing can accommodate.

## Conclusion

This project involved cleaning and preparing data in Python and storing it in a MySQL database. The cleaned data was then used to answer business questions. Each question was translated into language that was best interpreted for technical and business persons before the query was performed. The analysis provided insights into the relationship between variables and can be used to inform business decisions.
