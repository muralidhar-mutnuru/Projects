1)	Business problem

You work for Kangaroo Auto Insurance Company, an Australian company.  Your business partner, who is not familiar with statistics at all, and would like you to create a rating plan based on the historical auto claim data.  Your business partner is concerned about segmentation as well as competitiveness, as there are several other competitors in the market.

For this case competition, your group’s task is to provide a method for predicting the claim cost for each policy, and to convince your business partner that your predictions will work well.  


2)	Data Description

Modeling data will be sent out via email. The Kangaroo data set is based on one-year vehicle insurance policies from 2004 to 2005. There are 67856 policies, of which 4624 (6.8%) had at least one claim. The data will be split to three parts, training data, validation data and hold out data. In hold out data, claimcst0, clm and numclaims will be set to NA. You can build your model on training data and test the model on validation data. In the end, you can use your best model to score the hold out data. We will evaluate your model based on your hold out data prediction. 

Below is the variable information in the data.
ID: policy identity
Veh_value: market value of the vehicle
Exposure: The basic unit underlying an insurance premium
Clm: Occurrence of claim (0=no, 1=yes)
Numclaims: The number of claims
Claimcst0:  Claim amount (our response variable)
Veh_body: Type of vehicles
Veh_age: Age of vehicles (1=youngest, 4=oldest)
Gender: Gender of driver
Area: Driving area of residence
Agecat: Driver’s age category from young (1) to old (6)


3)	Model Evaluation
The model will be evaluated by gini index. We will calculate your score once you submit your result.

4)	Presentation instructions
Submit your code with documentation along with a report answering the following questions:
a.	What methods did you consider (you don’t have to actually try all of these methods; just ones that you think would work for this problem)?
b.	What method did you choose in the end, and why?
c.	How did you do you variable selection?  
d.	What variables help explain pure premium (explain to a non-statistician; please include this in your presentation for your business partner)?
e.	What other variables not in the data set do you think might be useful?

The teams scoring better than the benchmark will move to the second stage, the live presentation. Each qualifying team will give a 7min presentation on the above questions and 3min Q&A session.
