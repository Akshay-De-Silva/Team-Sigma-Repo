import pandas as pd
from sklearn.ensemble import RandomForestClassifier


def machineLearning(dataset_json):
    # read json data to dataset variable for model training
    dataset = pd.read_json(dataset_json)
    X = dataset.drop(columns=['OnOff', 'Brightness', 'ColorTemp'])
    y = dataset.drop(columns=['Time'])

    # Creating the Random forest model with 150 decision trees
    model2 = RandomForestClassifier(n_estimators=150)
    model2.fit(X, y)

    # use the model to predict on/off, brightness, and color temperature for each hour of the day
    predictions2 = model2.predict(
        [[0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19],
         [20], [21], [22], [23]])

    # returning the 24 hour prediction to the rest API
    return predictions2
