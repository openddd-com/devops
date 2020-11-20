

#%%
import numpy as np
data=np.random.rand(500,10)
label=np.random.randint(2,size=500)
train_data=lgb.Dataset(data,label=label)

valid_data=lgb.Dataset('valid.svm',reference=train_data)

#%%
train_data=lgb

#%%
lgb.cv(param,)

#%% early Stopping
bst=lgb.strain(param,train_data,num_round,valid_sets=valid_sets,early_stopping_rounds=5)


#%%

data=np.random.rand(7,10)
ypred=bst.predict(data)

#%%
ypred=bst.predict(data,num_iteration=bst.best_iteration)