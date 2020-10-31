import pandas as pd
import numpy as np
from collections import defaultdict
from keras.models import load_model
from sklearn.externals import joblib

def prd(symptoms):
  #training data from file training.csv
  df=pd.read_csv('./data/Training.csv')

  x=df.drop(['Disease'],axis=1)
  y=df['Disease']

  d=defaultdict(int)
  for a,i in zip(y.unique(),range(len(y.unique()))):
    d[i]=a
    y.replace(a,i,inplace=True)

  # Load models
  nb_model = joblib.load('./models/nb_model.pkl')
  svm_model = joblib.load('./models/svm_model.pkl')
  ann_model = load_model('./models/ann_model.h5')

  # Get symptoms
  symp=symptoms
  a=[0]*len(x.columns)
  b=list(x.columns[0:])
  for j in symp:
    if b.index(j)!=-1: 
      a[b.index(j)]=1

  # Predict
  y2_nb=nb_model.predict([a])
  y2_svm=svm_model.predict([a])
  y2_ann=ann_model.predict([a])
  r=y2_nb.tolist()

  # Return predictions
  dic=list()
  for p,q,s in zip(y2_nb,y2_svm,y2_ann):
    s=list(s)
    dic=list(set([ d[s.index(max(s))], d[p], d[q] ]))
  return dic