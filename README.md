# Housing-Price-Prediction

"Previous Explanation 

Overview - Download the datasets given and run the code. As long as all folders are in the right paths the code will run. 
All modifications to the dataset are done in the code. The output is exported in a csv for convience. Modify the row 
column headers and Id numbers to match the sample submission output. 

First - We modify the dataset and replace all missing numeric values with the median value. This is far better than 
replacing with zero, but not perfect.

Second - We take a linear regression of all numberic variables. We leave out categorical variables for two reasons.
One, because it is much harder to replace missing values. Two, currently with my knowledge combining these are a pain.

Third - once the regression is complete on the training dataset, we use it to predict the values of the test dataset.

Fourth - The prediction is exported to a csv file. Change the row headers of the file to 'Id' and 'SalePrice' for  
column A & B respectively. change the Id numbers from 1-500 to 951 - 1450. 

Final Thoughts - This method is ok, but has lots of room for future imporvement. First, replacing the values using 
MICE (Multivariate Imputation by Chained Equations) will lead to better data quality, thus better predictors. Second,
linear regression is a good start but being able to succesfully incorporate categorical variables would be quite 
interesting. In addition, other methods such as decision trees and greedy algorthims such as XGboost will be worth
looking into."

"Updates Made
As mentioned while linear regression is a good method after trying multiple different alghorthims (randomForest,
XGboost, and gradient boosting) I settled on using gradient boosting trees. I adjusted the parameters till I felt I
had optimized for accuray. To take it further would likely require better data cleaning and feature selection, along 
with more precise paramter tuning"
