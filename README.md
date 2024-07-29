# Building an ETL Pipeline with Python and PostgresSQL

## Project Overview
This project involves building an ETL (Extract, Transform, Load) pipeline using Python, Pandas, and Python dictionary methods or regular expressions to process crowdfunding data. The processed data will be stored in four CSV files, used to create an ERD (Entity Relationship Diagram), and then uploaded into a PostgreSQL database.

### Implementation Steps
#### 1. Created the Category and Subcategory DataFrames
##### Data Extraction and Transformation
- Extracted and transformed the <code style ="color:blue">[crowdfunding.xlsx](https://github.com/j91k/Crowdfunding_ETL/blob/main/Resources/crowdfunding.xlsx)</code> data to create a category DataFrame with the following columns:
    - **category_id**: Sequential entries from **"cat1"** to **"cat*n*"**, where *n* is the number of unique categories.
    - **category**: Contains only the category titles.
- Exported the category DataFrame as `category.csv`.
- Extracted and transformed the `crowdfunding.xlsx` data to create a subcategory DataFrame with the following columns:
    - **subcategory_id**: Sequential entries from **"subcat1"** to **"subcat*n*"**, where *n* is the number of unique subcategories.
    - **subcategory**: Contains only the subcategory titles.
- Exported the subcategory DataFrame as `subcategory.csv`

#### 2. Create the Campaign DataFrame
##### Data Extraction and Transformation
- Extracted and transformed the `crowdfunding.xlsx` data to create a campaign DataFrame with the following columns:
    - **cf_id**
    - **contact_id**
    - **company_name**
    - **description**: Renamed from the **"blurb"** column.
    - **goal**: Converted to the float data type.
    - **pledged**: Converted to the float data type.
    - **outcome**
    - **backers_count**
    - **country**
    - **currency**
    - **launch_date**: Renamed from the "launched_at" column, with UTC times converted to the datetime format.
    - **end_date**: Renamed from the "deadline" column, with UTC times converted to the datetime format.
    - **category_id**: Matches the unique IDs in the category_id column of the category DataFrame.
    - **subcategory_id**: Matches the unique IDs in the subcategory_id column of the subcategory DataFrame.
- Exported the campaign DataFrame as campaign.csv.

#### 3. Create the Contacts DataFrame
##### Data Extraction and Transformation
###### Used Python Dictionary Methods
- Imported the <code style ="color:blue">[contacts.xlsx](https://github.com/j91k/Crowdfunding_ETL/blob/main/Resources/contacts.xlsx)</code> file into a DataFrame.
- Iterated through the DataFrame, converting each row to a dictionary.
- Extracted the dictionary values and added them to a new list using a list comprehension.
- Created a new DataFrame with the extracted data.
- Divided each **name** column value into **first_name** and **last_name**, and placed each in a new column.
- Cleaned and exported the DataFrame as `contacts.csv`. 

###### Used Regular Expressions (As an Alternative)
- Imported the `contacts.xlsx` file into a DataFrame.
- Extracted the **contact_id**, **name**, and **email** columns using regular expressions.
- Created a new DataFrame with the extracted data.
- Converted the **contact_id** column to the integer type.
- Divided each **name** column value into first_name and last_name, and place each in a new column.
- Cleaned and exported the DataFrame as `contacts.csv`. 

#### 4. Create the Crowdfunding Database
##### Database and Tables Creation
- Inspected the four CSV files and sketch an ERD using QuickDBD.
- Used the ERD to create a table schema for each CSV file
- Saved the database schema as a Postgres file named <code style ="color:blue">[crowdfunding_db_schema.sql](https://github.com/j91k/Crowdfunding_ETL/blob/main/crowdfunding_db_jKim_eErnie.sql)</code>.
- Created a new PostgreSQL database named `crowdfunding_db`.
- Used the database schema to create tables in the correct order to handle foreign keys.
- Imported each CSV file into its corresponding SQL table.
- Verified table creation by running `SELECT` statements for each table.

## Group 1
Team Members: 
- Jimmy Kim 
- Ernawaty Ernawaty