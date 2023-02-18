#Read data from csv file
#train_data = read.csv('train.csv')
#test_data = read.csv('test.csv')
train_data = read.csv('train.csv')
test_data = read.csv('test.csv')

#Import Libraries 
library(tree)
library(ISLR)
library(randomForest)
library(gbm)
library(xgboost)

#Replace all numeric missing values with medians
na.median = function(x) replace(x, is.na(x), median(x, na.rm = TRUE))   
data1 = sapply(train_data, is.numeric)
data2 = sapply(test_data, is.numeric)
train = replace(train_data, data1, lapply(train_data[data1], na.median))
test = replace(test_data, data2, lapply(test_data[data2], na.median))

#Run regression
model = gbm(SalePrice ~ MSSubClass + LotFrontage +LotArea + OverallQual + OverallCond + YearBuilt + YearRemodAdd + 
                   MasVnrArea + BsmtFinSF1 + BsmtFinSF2 + BsmtUnfSF + TotalBsmtSF + firstFlrSF + secondFlrSF + GrLivArea + 
                   BsmtFullBath + BsmtHalfBath + FullBath + HalfBath + BedroomAbvGr + KitchenAbvGr + TotRmsAbvGrd + 
                   Fireplaces + GarageYrBlt + GarageCars + GarageArea + WoodDeckSF + OpenPorchSF + EnclosedPorch + 
                   threeSsnPorch + ScreenPorch + PoolArea + MiscVal + MoSold + YrSold, 
            data=train, distribution = "gaussian", n.trees = 10000, shrinkage = 0.001, interaction.depth = 12)

#Predict on test data
prediction = predict(model, newdata=test)

#Export prediction result in csv
write.csv(prediction,"Prediction.csv", row.names = TRUE)

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
XGboost, and gradient boosting) I settled on using gradient boosting. I adjusted the parameters till I felt I
had optimized for accuray. To take it further would likely require better data cleaning and feature selection, along 
with more precise paramter tuning"
