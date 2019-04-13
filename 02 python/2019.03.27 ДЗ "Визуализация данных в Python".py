# датасет ml-latest-small скачан с http://files.grouplens.org/datasets/movielens/
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pylab import rcParams
from pandas.plotting import lag_plot
from matplotlib.pyplot import figure

# просмотр информации о каждой таблице
#movies = pd.read_csv('ml-latest-small/movies.csv')
#ratings = pd.read_csv('ml-latest-small/ratings.csv')
#tags = pd.read_csv('ml-latest-small/tags.csv')
#print(movies.info())
#print(ratings.info())
#print(tags.info())
#print(movies['title'].head())

#1. Рейтинг по годам.
# Показывает средний рейтинг за каждый год.
# Ухудшается ли качество фильмов с годами
def production_year(stats):
    years = [x for x in range(1950, 2019)]
    new_year = 1900
    for year in years:
        if (str(year) in stats['title']) == True:
            new_year = year
    return new_year

movies = pd.read_csv('ml-latest-small/movies.csv').filter(items = ['movieId', 'title'])
ratings = pd.read_csv('ml-latest-small/ratings.csv').filter(items = ['movieId', 'rating'])
joined = ratings.merge(movies, on='movieId', how='left')
joined['year'] = joined.apply(production_year, axis = 1)
joined = joined[joined['year'] > 1949].groupby('year').agg({'rating': 'mean'}).sort_values('year')
'''init_notebook_mode(connected=True)
trace0 = go.Scatter(
    x=joined.index,
    y=joined.rating,
    name='Ratings'
)

data = [trace0, ]
layout = {'title': 'Statistics of video games'}
#fig = plt.subplots()
fig = go.Figure(data=data, layout=layout)
iplot(fig)
plt.show()'''
x = joined.index
y1 = joined.rating
y = np.vstack([y1, ])
labels = ["Ratings ", ]
fig, ax = plt.subplots()
ax.stackplot(x, y1, labels=labels)
ax.legend(loc='upper left')
plt.show()

# 2. Сколько пользователей - количество оценок - !поршень
# Количество оценок, которые поставил каждый пользователь - распределение
ratings = pd.read_csv('ml-latest-small/ratings.csv').filter(items = ['userId', 'rating'])
ratings_filtered = ratings.groupby('userId').count()
sns.distplot(ratings_filtered['rating'])
plt.show()#расширить, внизу сделать больше делений, сделать историю

#3. Рейтинг, при учете всех оценок и рейтинг, при учете оценок только киноманов.
'''Проверяем, влияет ли на рейтинг новинок (берем последних 100 фильмов)
оценки от "случайных поользователей". 
Красная линия - оценки пользователей, которые поставили более ста оценок за все время.
Зеленая линия - оценки всех пользователей.'''
ratings = pd.read_csv('ml-latest-small/ratings.csv')
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
plt.plot(joined['rating_x'].tail(100).to_list(), label='Оценки всех пользователей', linewidth=2, color = 'red')
plt.plot(joined['rating_y'].tail(100).to_list(), label='Оценки киноманов', linewidth=2, color = 'green')
plt.show()

#4. Теги из скольки слов популярны
# Проверяем количество слов в каждом теге
tags = pd.read_csv('ml-latest-small/tags.csv')
count_words = {}
for tag in tags['tag'].to_list():
    len_ = len(tag.split(' '))
    count_words.setdefault(len_, 0)
    count_words[len_] += 1
pd.DataFrame(count_words.items(), columns=['q_words', 'count'])
sns.barplot(x='q_words', y = 'count', data=pd.DataFrame(count_words.items(), columns=['q_words', 'count']))
#добавить надписи количества
plt.show()

#5. Зависимость рейтинга и время выставления оценки - точками, полупрозрачными с затемнением
# Выяснить, если зависимость от оценки и времени суток , в которое ее поставили
# Например, 1 - чаще ставят утром, 5 - вечером
# Время по оси X - снизу вверх от 00 до 00 часов
ratings = pd.read_csv('ml-latest-small/ratings.csv')
ratings['time'] = ratings['timestamp'] % (24*60*60)
ratings = ratings[['rating', 'time']]
plt.figure(figsize=(6*3.13,4*3.13)) # эта строка не увеличивает окно, она открывает второе большое. как увеличить мое?
ratings.plot.scatter(x='rating', y='time', c='DarkBlue', alpha=.1, marker='o')
plt.show()
