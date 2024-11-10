# -*- coding: utf-8 -*-
"""email-spam.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/14yVdDBFUsPZIHpD7ZC93afEz-fAHTeUw
"""

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC,LinearSVC
from sklearn.neighbors import KNeighborsClassifier
from sklearn import metrics,preprocessing

df = pd.read_csv('emails.csv')
df.head()

df.info()

df.dtypes

df.drop(columns=['Email No.'],inplace=True)

df.isna().sum()

df.isnull().sum()

df.describe()

# independent variables
x = df.iloc[:,:df.shape[1]-1]
# dependent variable
y = df.iloc[:,-1]
x.shape, y.shape

X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.3, random_state=30)

models = {
    "K-Nearest Neighbors 2": KNeighborsClassifier(n_neighbors=2),
}

for model_name,model in models.items():
    model.fit(X_train,y_train)
    y_pred = model.predict(X_test)
    print(f"Accuracy of {model_name} is {metrics.accuracy_score(y_test,y_pred)}")

"""K-Nearest Neighbors (KNN) predicts the label or value of a new data point by finding the 'k' closest points in the training data. It calculates distances (e.g., Euclidean) between the new point and existing points, selects the 'k' nearest, and makes a prediction based on these neighbors. For classification, it takes a majority vote among the nearest neighbors, while for regression, it averages their values. KNN requires no training phase but can be sensitive to the choice of 'k' and data scaling, as it relies on distance-based comparisons."""