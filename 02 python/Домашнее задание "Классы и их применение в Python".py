from datetime import datetime
from datetime import timedelta
import traceback

# 1. Напишите функцию date_range, которая возвращает список дней между датами start_date и end_date.
# Даты должны вводиться в формате YYYY-MM-DD.

print('Задание 1.')
def date_range(start_date = str(datetime.now().date()), end_date = str(datetime.now().date())):
    start_date = datetime.strptime(start_date, '%Y-%m-%d')
    end_date = datetime.strptime(end_date, '%Y-%m-%d')
    cur_date = start_date
    days_list = []
    while end_date >= cur_date:
        days_list.append(str(cur_date.date()))
        cur_date += timedelta(days = 1)
    return(days_list)

print(date_range('2019-03-14', '2019-03-16'))

# 2. Дополните функцию из первого задания проверкой на корректность дат.
# В случае неверного формата или если start_date > end_date должен возвращаться пустой список.
print('Задание 2.')
def date_range_v2(start_date, end_date):
    days_list = []
    try:
        start_date = datetime.strptime(start_date, '%Y-%m-%d')
        end_date = datetime.strptime(end_date, '%Y-%m-%d')
        cur_date = start_date
        while end_date >= cur_date:
            days_list.append(str(cur_date.date()))
            cur_date += timedelta(days=1)
    except:
        pass
    return(days_list)

print(date_range_v2('2019-03-41', '2019-03-16'))
# 3. Дан поток дат в формате YYYY-MM-DD, в которых встречаются некорректные значения:
# stream = ['2018-04-02', '2018-02-29', '2018-19-02']
# Напишите функцию, которая проверяет эти даты на корректность.
# Т. е. для каждой даты возвращает True (дата корректна) или False (некорректная дата).
print('Задание 3.')

def date_correct(dates = []):
    result = {}
    for date in dates:
        try:
            date = datetime.strptime(date, '%Y-%m-%d').date()
            result[str(date)] = True
        except ValueError:
            result[date] = False
    return result

stream = ['2018-04-02', '2018-02-29', '2018-19-02']
print(date_correct(stream))

# 4. Напишите функцию, которая возвращает список дат с 1 по вчерашний день текущего месяца.
# Если дан 1 день месяца, то возвращается список дней прошлого месяца.
print('Задание 4.')

def days_of_month(today = datetime.now()):
    end_date = today - timedelta(days = 1)
    start_date = end_date - timedelta(days = end_date.day - 1)
    days_list = []
    while end_date >= start_date:
        days_list.append(str(start_date.date()))
        start_date += timedelta(days = 1)
    return(days_list)

print(days_of_month())
# проверка первого числа
# print(days_of_month(datetime.strptime('2019-03-01', '%Y-%m-%d')))

# 5. Напишите функцию, которая возвращает точную дату в формате YYYY-MM-DD по фразе:
# ‘today’ - сегодняшнюю дату, # ‘last monday’ - прошлый понедельник,
# ‘last day’ - Последний день текущего месяца
print('Задание 5.')

def your_date(name):
    date_dict = {
        'today': datetime.now().date(),
        'last monday': datetime.now().date() - timedelta(days = datetime.now().weekday() + 7),
        'last day': (datetime.strptime((
                '01-' + str(datetime.now().month + 1) + '-' + str(datetime.now().year)), '%d-%m-%Y') # первый день след месяца
                     - timedelta(days = 1)).date() # вычитаем один день, чтобы получить последний текущего
    }
    try:
        return(date_dict[name])
    except:
        return('Значения нет в справочнике')

print('today:', your_date('today'))
print('last monday:', your_date('last monday'))
print('last day:', your_date('last day'))
print('come on:', your_date('come on'))
