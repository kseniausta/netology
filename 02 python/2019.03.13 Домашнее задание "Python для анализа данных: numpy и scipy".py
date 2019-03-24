import numpy as np
import math
import pandas as pd
from numpy import linalg

# 1. Создайте numpy array с элементами от числа N до 0
# (например, для N = 10 это будет array([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])).
print('Задание 1.')
def do_array(n):
    return(np.arange(n - 1, -1, -1))

print('Массив с элементами от числа N до 0:', do_array(10))

# 2. Создайте диагональную матрицу с элементами от N до 0. Посчитайте сумму ее значений на диагонали.
print('\nЗадание 2.')
def do_array_and_sum_diag(n):
    if math.sqrt(n) % 1 != 0:
        return('Невозможно создать матрицу из указанного числа элементов')
    ij = int(math.sqrt(n))
    a = []
    for i in range(n - 1, -1, -1):
        a.append(i)
    arr_rez = np.array(a).reshape(ij, ij)
    print('матрица: \n', arr_rez, '\nСумма значений на диагонали:')
    return int(arr_rez.diagonal().sum())

print(do_array_and_sum_diag(16))

# 3. Скачайте с сайта https://grouplens.org/datasets/movielens/ датасет любого размера.
# Определите какому фильму было выставлено больше всего оценок 5.0.
print('\nЗадание 3.')
movies = pd.read_csv('ml-latest-small/movies.csv').filter(items = ['movieId', 'title'])
ratings = pd.read_csv('ml-latest-small/ratings.csv').filter(items = ['movieId', 'rating'])
joined = ratings.merge(movies, on='movieId', how='left')
print('Фильм и количество оценок 5 (через value_counts):\n',
      joined[(joined['rating'] == 5)]['title'].value_counts().head(1))
ratings['count_r'] = ratings[(ratings['rating'] == 5)].groupby('movieId').count()
print('Фильм и количество оценок 5 (через count и sort_values):\n',
      ratings.sort_values('count_r', ascending=False).head(1))

# 4. По данным файла power.csv посчитайте суммарное потребление стран Прибалтики (Латвия, Литва и Эстония)
# категорий 4, 12 и 21 за период с 2005 по 2010 года. Не учитывайте в расчетах отрицательные значения quantity.
print('\nЗадание 4.')
data = pd.read_csv('power.csv')
data = data[((data['category'] == 4) | (data['category'] == 12) | (data['category'] == 21))
           & ((data['country'] == 'Latvia') | (data['country'] == 'Lithuania') | (data['country'] == 'Estonia'))
            & (data['year'] >= 2005) & (data['year'] <= 2010) & (data['quantity'] >= 0)]
print('Суммарное потребление:', data['quantity'].sum())

# 5. Решите систему уравнений:
# 4x + 2y + z = 4
# x + 3y = 12
# 5y + 4z = -3
print('\nЗадание 5.')
a = np.array([[4, 2, 1], [1, 3, 0], [0, 5, 4]])
b = np.array([4, 12, -3])
res = linalg.solve(a, b)
print('x =', res[0], 'y =', res[1], 'z =', res[2])
print(np.allclose( np.dot(a, linalg.solve(a, b)), b ))
