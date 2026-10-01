use bank_loan;
drop database bank_loan;
create database bank_loan;
use bank_loan;

SELECT * FROM LOAN_DATA;

select count(*)
from loan_data;

select count(person_gender) as gender
from loan_data
where person_gender='Male'  or person_gender="Female" 
group by person_gender;

select person_education
from loan_data
group by person_education;

select loan_intent
from loan_data
group by loan_intent;

select person_home_ownership 
from loan_data
group by person_home_ownership;

select min(person_income), max(person_income), avg(person_income)
from loan_data;

select min(loan_amnt), max(loan_amnt), avg(loan_amnt)
from loan_data;

select avg(loan_int_rate)
from loan_data;

select loan_status,
       count(*) as toatal_loans,
       round(count(*)*100.0/(select count(*) from loan_data)) as percent
from loan_data
group by loan_status;

select count(previous_loan_defaults_on_file)
from loan_data
group by previous_loan_defaults_on_file;

# What is the average loan amount by loan intent?

select  loan_intent,
	 avg(loan_amnt) as avg_loan
from loan_data
group by loan_intent
order by avg_loan desc;

# What is the average income by education level?

select person_education,
       avg(person_income)as avg_loan_income
from loan_data
group by person_education;

# What is the average loan interest rate by loan intent?

select loan_intent,
	  avg(loan_int_rate) as avg_loan_interest
from loan_data
group by loan_intent
order by avg_loan_interest desc;

# Which home ownership category has the highest average loan amount?

select person_home_ownership,
	 avg(loan_amnt) as avg_loan_amount
from loan_data
group by person_home_ownership
order by avg_loan_amount desc limit 1;

# What is the average credit score by education level?

select person_education,
       avg(credit_score) as avg_credit_score
from loan_data
group by person_education;

# What is the overall loan approval rate?

select avg(loan_status) *100 as approval_loan
from loan_data;

# What is the approval rate by gender?

select person_gender,
       avg(loan_status)*100  as approval_rate
from loan_data
group by person_gender;

#What is the approval rate by education?

select person_education,
	   count(*) as applications,
       avg(loan_status)*100 as approval_rate_by_education
from loan_data
group by person_education;

# What is the approval rate by loan intent?

select loan_intent,
       count(*) as applications,
	   avg(loan_status) * 100 as approval_intent
from loan_data
group by loan_intent;

# What is the approval rate by home ownership?

select person_home_ownership,
	   count(*) as appplication,
       avg(loan_status) * 100 as approval_intent
from loan_data
group by person_home_ownership;

# How does credit score affect loan approval?

select
  case
      when credit_score <580 then 'Poor'
      when credit_score between 580 and 669 then 'fair'
      when credit_score between 670 and 739 then 'Good'
      when credit_score between 740 and 799 then 'very Good'
      else 'Excellent'
end as credit_category,
count(*) as applications,
avg(loan_status) *100 as approval_rate
from loan_data
group by credit_category
order by approval_rate desc;
       
# Do customers with previous loan defaults have lower approval rates?

select previous_loan_defaults_on_file,
       count(*) as applications,
       avg(loan_status)*100 as approval_rate
from loan_data
group by previous_loan_defaults_on_file
order by approval_rate desc;

# What is the average credit score of approved vs rejected customers?

select loan_status,
       avg(credit_score) as avg_credit_score
from loan_data
group by loan_status
order by avg_credit_score;

# What is the average income of approved vs rejected customers?

select loan_status,
       avg(person_income) as avg_person_income
from loan_data
group by loan_status;

# Do customers requesting a high percentage of their income have lower approval rates?

select 
    case
        when loan_percent_income <0.10 then 'Low'
        when loan_percent_income <0.30 then 'Medium'
        else 'High'
        end as loan_percentage,
	    count(*) as application,
        avg(loan_status)*100 as approval_rate
from loan_data
group by loan_percentage;

# Which income group requests the largest loans?

select max(person_income) as max_income,person_education ,
       avg(loan_status)*100 as applications
from loan_data
group by person_education
order by max_income desc limit 1;


select loan_intent,
       avg(loan_percent_income) *100 as avg_loan_income
from loan_data
group by loan_intent
order by avg_loan_income desc;

# Find the 4th maximum age of a person?

select *
from loan_data
order by person_age desc limit 3,1






      



 
