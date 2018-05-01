use cpsmar2017, clear

keep if a_hrspay>0
drop if a_age >= 75

tab a_hga, gen(cat_edu)
tab a_mjind, gen(cat_industry)
gen log_wage = log(a_hrspay)

gen female=0
replace female=1 if a_sex==2

regress log_wage a_age cat_edu* cat_industry* female

outsheet log_wage a_age cat_edu* cat_industry* female using cpsmar2017.csv, replace comma