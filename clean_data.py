""" Task 1: Decoding Netflix's Cinematic Data. """
#--- Import Pandas ---
import pandas as pd
#--- Read in dataset ----
df = pd.read_csv(r'C:\Users\dhwan\OneDrive\Desktop\Data Analysis\Netflix\NetflixOriginals.csv', encoding='latin-1')
# print(df.head())

""" Task 2: Unveiling the Datatypes in Netflix Originals Dataset. """
dtype = df.dtypes
print(dtype)

""" Task 3: Lowercasing Netflix Originals. """
df.columns = df.columns.str.lower()
print(df)

""" Task 4: Unveiling Null Values in Netflix Originals Dataset."""
null_values = df.isnull().sum()
print(null_values)

""" Task 5: Bid Farewell to NaNs in Netflix Originals Dataset. """
# df = df.dropna(axis=1) to drop column with missing values
df= df.dropna()
print(df.isnull().sum())

""" Task 6: Tackling Duplicates in Netflix Originals Dataset. """
duplicates = df[df.duplicated()]
print(len(duplicates))

""" Task 7: Eliminating Duplicates for Netflix Insights. """
# print(df.info())
df = df.drop_duplicates()
print(df.info())

""" Task 8: Converting Netflix Premiere object to Datetime """
df['premiere'] = pd.to_datetime(df['premiere'])
# pd.to_datetime(df['premiere'], format='%Y-%m-%d')
print(df.dtypes)
print(df.head())

""" Task 9: Unveiling the Cinematic Epochs with Year Extraction. """
df['year'] = df['premiere'].dt.year
print(df.head())

""" Task 10: Standardizing IMDb Score Column in Netflix Originals Dataset. """
#df.rename(columns={'imdb score': 'imdb_score'}, inplace=True) #to rename
df.columns = df.columns.str.replace(' ', '_').str.lower() #to remove spaces with underscore
print(df.columns)

""" Task 11: Archiving Refined Netflix Originals Dataset. """
df.to_csv(r'C:\Users\dhwan\OneDrive\Desktop\Data Analysis\Netflix\cleaned_netflix_originals_dataset.csv', index=False) 
#index = false removes row num while exporting
