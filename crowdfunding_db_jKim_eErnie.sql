-- Creating table "campaign" and setting primary key 
CREATE TABLE "campaign" (
    "cf_id" int NOT NULL,
    "contact_id" int NOT NULL,
    "company_name" varchar(100) NOT NULL,
    "description" text NOT NULL,
    "goal" numeric(10,1) NOT NULL,
    "pledged" numeric(10,1) NOT NULL,
    "outcome" varchar(25) NOT NULL,
    "backers_count" int NOT NULL,
    "country" varchar(5) NOT NULL,
    "currency" varchar(5) NOT NULL,
    "launch_date" date NOT NULL,
    "end_date" date NOT NULL,
    "category_id" varchar(10) NOT NULL,
    "subcategory_id" varchar(10) NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY ("cf_id"));

-- Checking if campaign table was imported & created correctly
select *
from campaign
limit 5

-- Creating table contacts and setting primary key
CREATE TABLE "contacts" (
    "contact_id" int NOT NULL,
    "first_name" varchar(50) NOT NULL,
    "last_name" varchar(50) NOT NULL,
    "email" varchar(100) NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY ("contact_id"));

-- Checking if contacts table was imported & created correctly
select *
from contacts
limit 5

-- Creating table category and setting primary key
CREATE TABLE "category" (
    "category_id" varchar(10) NOT NULL,
    "category_name" varchar(50) NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY ("category_id"));

-- Checking if category table was imported & created correctly
select *
from category
limit 5

-- Creating table subcategory and setting primary key
CREATE TABLE "subcategory" (
    "subcategory_id" varchar(10) NOT NULL,
    "subcategory_name" varchar(50) NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY ("subcategory_id"));

-- Checking if category table was imported & created correctly
select *
from subcategory
limit 5

-- Altered table by calling in constraints and setting foreign keys
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");


