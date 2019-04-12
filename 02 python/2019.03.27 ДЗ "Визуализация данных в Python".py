import numpy as np
import math
import pandas as pd
import matplotlib.pyplot as plt
from pylab import rcParams
from datetime import datetime
from datetime import time
from pandas.plotting import lag_plot
from matplotlib.pyplot import figure

movies = pd.read_csv('ml-latest-small/movies.csv')
ratings = pd.read_csv('ml-latest-small/ratings.csv')
tags = pd.read_csv('ml-latest-small/tags.csv')
#print(movies.info())
#print(ratings.info())
#print(tags.info())
#print(movies['title'].head())

#1. Рейтинг по годам - гора
'''def production_year(stats):
    years = [x for x in range(1950, 2011)]
    new_year = 1900
    for year in years:
        if (str(year) in stats['title']) == True:
            new_year = year
    return new_year

movies = pd.read_csv('ml-latest-small/movies.csv').filter(items = ['movieId', 'title'])
ratings = pd.read_csv('ml-latest-small/ratings.csv').filter(items = ['movieId', 'rating'])
joined = ratings.merge(movies, on='movieId', how='left')
joined['year'] = joined.apply(production_year, axis = 1)

print(joined.groupby('year').agg({'rating': 'mean'}).sort_values('year').head(10))'''

#2. Сколько пользователей - количество оценок - поршень
'''ratings = pd.read_csv('ml-latest-small/ratings.csv').filter(items = ['userId', 'rating'])
ratings_filtered = ratings.groupby('userId').count()
print(ratings_filtered)'''

#3. Рейтинг, при учете всех оценок и рейтинг, при учете оценок только киноманов.
'''Проверяем, влияет ли на рейтинг новинок (берем последних 100 фильмов)
оценки от "случайных поользователей". 
Красная линия - оценки пользователей, которые поставили более ста оценок за все время.
Зеленая линия - оценки всех пользователей.'''
'''ratings = pd.read_csv('ml-latest-small/ratings.csv')
last_five_years = 1537799250 - 15*24*60*60
ratings_filtered = ratings.groupby('userId').count()
ratings_filtered = ratings_filtered[ratings_filtered['timestamp'] > 100]
ratings_filtered = ratings_filtered.reset_index()
ratings_fan = ratings[ratings['userId'].isin(
    ratings_filtered['userId'].tolist())].groupby('movieId').agg('mean')['rating']
ratings_all = ratings.groupby('movieId').agg('mean')['rating']
ratings_fan = ratings_fan.to_frame()
ratings_all = ratings_all.to_frame()
joined = ratings_all.merge(ratings_fan, on='movieId', how='inner').sort_values('movieId')
print(joined['rating_x'].to_list())
plt.plot(joined['rating_x'].tail(100).to_list(), label='Оценки всех пользователей', linewidth=2, color = 'red')
plt.plot(joined['rating_y'].tail(100).to_list(), label='Оценки киноманов', linewidth=2, color = 'green')
plt.show()'''

#4. Теги из скольки слов популярны - столбцы
'''tags = pd.read_csv('ml-latest-small/tags.csv')
count_words = {}
for tag in tags['tag'].to_list():
    len_ = len(tag.split(' '))
    count_words.setdefault(len_, 0)
    count_words[len_] += 1
print(count_words)'''

#5. Зависимость рейтинга и время выставления оценки - точками, полупрозрачными с затемнением
'''ratings = pd.read_csv('ml-latest-small/ratings.csv')
ratings['time'] = ratings['timestamp'] % (24*60*60)
print(ratings[['rating', 'time']])'''
