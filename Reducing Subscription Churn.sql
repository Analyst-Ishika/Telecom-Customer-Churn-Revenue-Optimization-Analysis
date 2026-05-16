SELECT * FROM project.subscription_churn;

-- Which contract types are responsible for the highest number of churned customers and the greatest monthly recurring revenue loss?
select 
    contract_type,
    COUNT(customer_id) as churned_customers,
    round(SUM(monthly_charges)) as lost_mrr -- Monthly Recurring Revenue
from subscription_churn
where churn = 1
group by contract_type;

-- What percentage of all customers have churned?
select 
	round(avg(churn) * 100,2) churn_rate
from subscription_churn;

-- Does churn behavior differ between male and female customers?
select
	gender,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by gender
order by churn desc;

-- Are senior citizens more likely to churn than non-senior customers?
select
	senior_citizen,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by senior_citizen
order by churn desc;

-- Do customers with a partner churn less frequently than those without one?
select
	partner,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by partner
order by churn desc;

-- Does having dependents affect customer retention?
select
	dependents,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by dependents
order by churn desc;

-- At what stage of the customer lifecycle is churn most likely to occur?
select
	tenure_group,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by tenure_group
order by churn desc;

-- Which combinations of phone and internet services are associated with the highest churn rates?
select
	phone_service, internet_service,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by phone_service, internet_service
order by churn desc;

-- Which internet service type (DSL, Fiber Optic, No Internet) has the highest churn rate?
select
	internet_service,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by internet_service
order by churn desc;

-- How does the number of subscribed services impact churn?
select
	total_services_count,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by total_services_count
order by churn desc;

--  Do customers with value-added services (such as security, backup, or support) have lower churn rates?
select
	has_additional_services,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by has_additional_services
order by churn desc;

-- Do customers who only use phone service churn more than customers with additional services?
select
	only_phone_service,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by only_phone_service
order by churn desc;

-- How does contract duration influence customer churn?
select
	contract,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by contract
order by churn desc;

-- Which payment methods are associated with the highest churn rates?
select
	payment_method,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by payment_method
order by churn desc;

-- Does paperless billing correlate with higher or lower churn?
select
	paperless_billing,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by paperless_billing
order by churn desc;

-- How do streaming service combinations affect churn behavior?
select
	streaming_movies, streaming_tv,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn) * 100,2) churn
from subscription_churn
group by 1,2
order by churn desc;

-- Which customer segment (Movies only, TV only, Both, or None) has the highest churn rate and average monthly charges?
select
	case 
		when streaming_movies = "Yes" and streaming_tv = "Yes" then "Both"
        when streaming_movies = "Yes" and streaming_tv = "No" then "Movies"
        when streaming_movies = "No" and streaming_tv = "Yes" then "Tv"
        else "None"
	end as streaming_segment,
    round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn)*100,2) churn,
    round(avg(monthly_charges)*100,2) avg_monthly_charges,
    round(avg(contract_type)*100,2) avg_contract
from subscription_churn
group by 1
order by churn desc;

-- Among month-to-month customers, which streaming segments exhibit the highest churn?
select
	case 
		when streaming_movies = "Yes" and streaming_tv = "Yes" then "Both"
        when streaming_movies = "Yes" and streaming_tv = "No" then "Movies"
        when streaming_movies = "No" and streaming_tv = "Yes" then "Tv"
        else "None"
	end as streaming_segment,
    round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn)*100,2) churn,
    round(avg(monthly_charges)*100,2) avg_monthly_charges
from subscription_churn
where contract_type = 0
group by 1
order by churn desc;

-- Within each internet service type, how does streaming behavior influence churn among month-to-month customers?
select
	internet_service,
	case 
		when streaming_movies = "Yes" and streaming_tv = "Yes" then "Both"
        when streaming_movies = "Yes" and streaming_tv = "No" then "Movies"
        when streaming_movies = "No" and streaming_tv = "Yes" then "Tv"
        else "None"
	end as streaming_segment,
    round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn)*100,2) churn,
    round(avg(monthly_charges)*100,2) avg_monthly_charges
from subscription_churn
where contract_type = 0
group by 1,2
order by churn desc;

-- Does having technical support reduce churn across different internet service types?
select
	internet_service,
    tech_support,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn)*100,2) churn
from subscription_churn
group by 1,2
order by churn desc;

-- What percentage of Fiber Optic users are on Month-to-Month contracts versus 1-Year/2-Year?
select
	internet_service,
    contract,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn)*100,2) churn
from subscription_churn
group by 1,2
order by churn desc;

-- Are Senior Citizens more or less likely to be in that high-churn Fiber Optic group?
select
	senior_citizen,
	internet_service,
	round(count(*) / (select count(*) from subscription_churn) * 100, 2) count,
    round(avg(churn)*100,2) churn
from subscription_churn
group by 1,2
order by churn desc;

-- How do average monthly charges differ across internet service types, and could pricing explain churn differences?
select 
	internet_service,
    round(avg(monthly_charges),2) avg_monthly_charges
from subscription_churn
group by 1
order by avg_monthly_charges desc;