# Home Credit - Credit Risk Model Stability

This is a [Kaggle competition](https://www.kaggle.com/competitions/home-credit-credit-risk-model-stability/overview)

## Data

Overview
- `_base.csv`: basic information with unique identifier `case_id`. Base for joining the other tables
- `_N`: depth
    * `_0`: depth 0, static features for each identifier `case_id`
    * `_1`: depth 1, associated historical record for each identifier (`case_id`, `num_group1`)
    * `_2`: depth 2, associated historical record for each identifier (`case_id`, `num_group1`, `num_group2`)
- `static_0`: static (internal) data
- `static_cb_0`: static credit bureau (external) data
- `applprev_N`: depth=N previous application history (internal) data
- `deposit_1`: deposit (internal) data
- `person_N`: depth=N personal information (internal) data
- `debitcard_1`: depit card(internal) data
- `tax_registry_*_1`: external data provided by Tax registry `*`
- `credit_bureau_*_N`: depth=N (external) data provided by Credit bureau provider `*`
- `other_1`: other (internal) data

Special columns
- `case_id` - This is the unique identifier for each credit case. You'll need this ID to join relevant tables to the base table
- `date_decision` - This refers to the date when a decision was made regarding the approval of the loan
- `WEEK_NUM` - This is the week number used for aggregation. In the test sample, `WEEK_NUM` continues sequentially from the last training value of `WEEK_NUM`
- `MONTH` - This column represents the month and is intended for aggregation purposes
- `target` - This is the target value, determined after a certain period based on whether or not the client defaulted on the specific credit case (loan)
- `num_groupN` - This is an indexing column used for the historical records of `case_id`. They together will be the unique identifier
    * `num_group1` used in both depth=1 and depth=2 tables
    * `num_group2` used only depth=2 tables
    * for features: `empls_economicalst_849M`, `empls_employedfrom_796D`, `empls_employer_name_740M`
        - `num_group1` - person
        - `num_group2` - employment
        - When `num_groupN`=0 it is the applicant (the person who applied for a loan)
    * for features: `relatedpersons_role_762T`
        - `num_group1` - person
        - `num_group2` - related person
        - When `num_groupN`=0 it is the applicant (the person who applied for a loan)
    * for features:  `pmts_date_1107D`, `pmts_dpd_1073P`, `pmts_dpd_303P`, `pmts_dpdvalue_108P`, `pmts_month_158T`, `pmts_month_706T`, `pmts_overdue_1140A`, `pmts_overdue_1152A`, `pmts_pmtsoverdue_635A`, `pmts_year_1139T`, `pmts_year_507T`
        - `num_group1` - contract
        - `num_group2` - payment
    * for features: `subjectroles_name_541M`, `subjectroles_name_838M`
        - `num_group1` - contract
        - `num_group2` - subject roles

All other features end with a capital letter
- P - Transform DPD (Days past due)
- M - Masking categories
- A - Transform amount
- D - Transform date
- T - Unspecified Transform
- L - Unspecified Transform