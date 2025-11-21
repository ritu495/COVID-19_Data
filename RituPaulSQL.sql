create database Integrated_study

use Integrated_study

select * from [dbo].[Data_SQL ]

---1. Write a query to count the number of patients grouped by `SEX` and `PATIENT_TYPE`.
select Sex,Patient_type,count(id) as Count_Patients 
from [dbo].[Data_SQL ]
group by sex, patient_type


--2. Calculate the total number of patients and their percentage in each `DEGREE` category.
with CTE as 
(
select count(id) as Total_patients from [dbo].[Data_SQL ]
)
select Degree,count(id) as Count_patients,(count(id)*100*1.0/(select * from CTE)) as Percentage_of_Patients
from [dbo].[Data_SQL ]
group by Degree


--3. Write a query to  find the top 3 `MEDICAL_UNIT`s with the highest number of deaths and 
--   calculate their percentage of total deaths.
with Total_patients_death as
(
select count(*) as [Total_patients_dead]
from 
[dbo].[Data_SQL ]
where DEATH=1
)
select top 3 medical_unit,count(*) as Count_patients_death,(count(*)*100/(select * from Total_patients_death)) as [Percentage of Death patients]
from [dbo].[Data_SQL ]
where DEATH=1
group by MEDICAL_UNIT
order by Count_patients_death desc

--.4.Identify the total number of patients by gender who meet these conditions:   
--            PNEUMONIA = 1   
--            HYPERTENSION = 1   
--            AGE > 40. 

select sex,count(id) as count_patients
from [dbo].[Data_SQL ]
where PNEUMONIA=1 and HYPERTENSION=1 and AGE>40
group by sex