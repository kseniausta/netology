import pandas as pd

# 1. Используем файл keywords.csv.
# Необходимо написать гео-классификатор, который каждой строке сможет выставить географическую принадлежность
# определенному региону. Т. е. если поисковый запрос содержит название города региона, то в столбце 'region'
# пишется название этого региона. Если поисковый запрос не содержит названия города, то ставим 'undefined'.
# Результат классификации запишите в отдельный столбец region.
print('Задание 1. Долго работает, не понимаю, как быстрее')
def find_region(stat, region, city):
    return city if city in stat['keyword'] else 'undefined'
# Правила распределения по регионам Центр, Северо-Запад и Дальний Восток:
geo_data = {
    'Центр': ['москва', 'тула', 'ярославль'],
    'Северо-Запад': ['петербург', 'псков', 'мурманск'],
    'Дальний Восток': ['владивосток', 'сахалин', 'хабаровск']
}
stat = pd.read_csv('keywords.csv')
for region, cities in geo_data.items():
    for city in cities:
        stat['region'] = stat.apply(find_region, region = region, city = city, axis = 1)

print(stat[stat.region != 'undefined'].head())

# 2. Напишите функцию, которая классифицирует фильмы из материалов занятия по следующим правилам:
#    - оценка 2 и меньше - низкий рейтинг
#    - оценка 4 и меньше - средний рейтинг
#    - оценка 4.5 и 5 - высокий рейтинг
# Результат классификации запишите в столбец class
print('Задание 2.')
def classes(stats):
    if stats['rating'] <= 2:
        return 'низкий рейтинг'
    elif stats['rating'] <= 4:
        return 'средний рейтинг'
    elif stats['rating'] <= 5:
        return 'высокий рейтинг'
ratings = pd.read_csv('ml-latest-small/ratings.csv')
ratings['class'] = ratings.apply(classes, axis = 1)
print(ratings.head())

# 3. Посчитайте среднее значение Lifetime киноманов (пользователи, которые поставили 100 и более рейтингов).
# Под Lifetime понимается разница между максимальным и минимальным значением timestamp для каждого пользователя.
# Ответ дайте в днях.
print('Задание 3.')
ratings = pd.read_csv('ml-latest-small/ratings.csv')
ratings_filtered = ratings.groupby('userId').count()
ratings_filtered = ratings_filtered[ratings_filtered['timestamp'] > 100]
ratings_filtered = ratings_filtered.reset_index()
ratings_filtered['userId'].tolist()
ratings_grouped = ratings[ratings['userId'].isin(ratings_filtered['userId'].tolist())].groupby('userId').agg([min, max])['timestamp']
ratings_grouped['diff'] = (ratings_grouped['max'] - ratings_grouped['min']) / 60 / 60 / 24
print(ratings_grouped['diff'].mean())

# 4. Есть мнение, что "раньше снимали настоящее кино, не то что сейчас".
# Ваша задача проверить это утверждение, используя файлы с рейтингами фильмов из материалов занятия.
# Т. е. проверить верно ли, что с ростом года выпуска фильма его средний рейтинг становится ниже.
# При этом мы не будем затрагивать субьективные факторы выставления этих рейтингов, а пройдемся по следующему алгоритму:
#1. В переменную years запишите список из всех годов с 1950 по 2010.
#2. Напишите функцию production_year, которая каждой строке из названия фильма выставляет год выпуска. Не все названия фильмов содержат год выпуска в одинаковом формате, поэтому используйте следующий алгоритм:
#    - для каждой строки пройдите по всем годам списка years
#    - если номер года присутствует в названии фильма, то функция возвращает этот год как год выпуска
#    - если ни один из номеров года списка years не встретился в названии фильма, то возвращается 1900 год
#3. Запишите год выпуска фильма по алгоритму пункта 2 в новый столбец 'year'
#4. Посчитайте средний рейтинг всех фильмов для каждого значения столбца 'year' и отсортируйте результат по убыванию рейтинга
print('Задание 4.')

def production_year(stats):
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

print(joined.groupby('year').agg({'rating': 'mean'}).sort_values(['rating', 'year'], ascending=[False, True]).head(10))
