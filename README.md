acropolis
=========

Stock prediction using various regularization techniques on linear regression. 


Objectives
----------
Predict % yield of next quarter

Features
--------
1. Split / Dividends - Ramya
2. Market Cap (Share price times total shares) - Vronsky
3. Volume - Ramya
4. P/E (Price to Earnings Ratio)[Market value per share / Earnings per Share (EPS)] - Parker
5. SMP (Standard & Poor rating) - Shawn
6. Field of Business (Ag, Tech, Finance) - Dan
7. Size (Employees / Stockholder) - Chris
8. State - Dan
9. Number of financial quarters this company has existed before our start date - Dan
10. Kurtosis - Ramya

Notes
------
1. Companies must have been created before 2000 and in USA
2. We will train on 30 companies
3. We are running 30 DISTINCT regressions - one per company.
4. We are using a Neural Network from the DeepLearn Toolbox. https://github.com/rasmusbergpalm/DeepLearnToolbox
5. All company data will start on the year of the most recently created company
6. Features are taken on a per quarter basis

Tasks
------
Tue 11/18: Everyone is assigned a feature. Research it and present findings. Don't need data right now, just need explanation of how to use it.
