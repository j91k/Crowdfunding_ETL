# Building an ETL Pipeline with Python and PostgresSQL

## Group 1
Team Members: 
- Jimmy Kim 
- Ernawaty Ernawaty

## Project Overview
This project involves building an ETL (Extract, Transform, Load) pipeline using Python, Pandas, and either Python dictionary methods or regular expressions to process crowdfunding data. The processed data will be stored in four CSV files, used to create an ERD (Entity Relationship Diagram), and then uploaded into a PostgreSQL database.

### Implementation Steps
#### 1. Create the Category and Subcategory DataFrames
##### Extract and Transform Data
- Extract and transform the `crowdfunding.xlsx` data to create a category DataFrame with the following columns:
    - **category_id**: Sequential entries from **"cat1"** to **"cat*n*"**, where *n* is the number of unique categories.
    - **category**: Contains only the category titles.
- Export the category DataFrame as `category.csv`.
- Extract and transform the <code style ="color:blue">[crowdfunding.xlsx](https://github.com/j91k/Crowdfunding_ETL/blob/main/Resources/crowdfunding.xlsx)</code> data to create a subcategory DataFrame with the following columns:
    - **subcategory_id**: Sequential entries from **"subcat1"** to **"subcat*n*"**, where *n* is the number of unique subcategories.
    - **subcategory**: Contains only the subcategory titles.
- Export the subcategory DataFrame as `subcategory.csv`

#### 2. Create the Campaign DataFrame
##### Extract and Transform Data
- Extract and transform the `crowdfunding.xlsx` data to create a campaign DataFrame with the following columns:
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
- Export the campaign DataFrame as campaign.csv and save it to your GitHub repository.

#### 3. Create the Contacts DataFrame
##### Extract and Transform Data
###### Use Python Dictionary Methods
- Import the <code style ="color:blue">[contacts.xlsx](https://github.com/j91k/Crowdfunding_ETL/blob/main/Resources/contacts.xlsx)</code> file into a DataFrame.
- Iterate through the DataFrame, converting each row to a dictionary.
- Extract the dictionary values and add them to a new list using a list comprehension.
- Create a new DataFrame with the extracted data.
- Split each **name** column value into first_name and last_name, and place each in a new column.
- Clean and export the DataFrame as ``contacts.csv`. 

##### Use Regular Expressions
- Import the `contacts.xlsx` file into a DataFrame.
- Extract the **contact_id**, **name**, and **email** columns using regular expressions.
- Create a new DataFrame with the extracted data.
- Convert the **contact_id** column to the integer type.
- Split each **name** column value into first_name and last_name, and place each in a new column.
- Clean and export the DataFrame as `contacts.csv`. 

#### 4. Create the Crowdfunding Database
##### Create Database and Tables
- Inspect the four CSV files and sketch an ERD using QuickDBD.
- Use the ERD to create a table schema for each CSV file
- Save the database schema as a Postgres file named <code style ="color:blue">[crowdfunding_db_schema.sql](https://github.com/j91k/Crowdfunding_ETL/blob/main/crowdfunding_db_jKim_eErnie.sql)</code>.
- Create a new PostgreSQL database named `crowdfunding_db`.
- Using the database schema, create the tables in the correct order to handle foreign keys.
- Verify table creation by running `SELECT` statements for each table.
- Import Data into Database
- Import each CSV file into its corresponding SQL table.
- Verify the data in each table by running `SELECT` statements.