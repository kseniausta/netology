import requests

# 1. Напишите функцию, которая возвращает сумму элементов на диагонали. Т. е. 13+32+23+35.
def sum_diag(data = [[0],]):
    sum_result = 0
    for i in range(len(data)):
        #суммируем, если есть элемент. например, в последней строке не 4, а 3 элемента
        try:
            sum_result += data[i][i]
        except:
            pass
    return sum_result

print('Задание 1.')
data = [
[13, 25, 23, 34],
[45, 32, 44, 47],
[12, 33, 23, 95],
[13, 53, 34, 35],
]
print('Сумма элементов по диагонали равна', sum_diag(data), '\n')

# 2. Дан список чисел, часть из которых имеют строковый тип или содержат буквы.
# Напишите функцию, которая возвращает сумму квадратов элементов, которые могут быть числами.
def sum_sq_of_number(data = [0]):
    sum_sq_result = 0
    for i in range(len(data)):
        #суммируем, если есть корректный элемент. например, в последней строке не 4, а 3 элемента
        try:
            sum_sq_result += float(data[i])**2
        except:
            pass
    return sum_sq_result

print('Задание 2.')
data = [1, '5', 'abc', 20, '2']
print('Сумма квадратов элементов равна', sum_sq_of_number(data), '\n')

# 3. Напишите функцию, которая возвращает название валюты (поле ‘Name’)
# с максимальным значением курса с помощью сервиса https://www.cbr-xml-daily.ru/daily_json.js
class Rate:

    def exchange_rates(self):
        """
        Возвращает ответ сервиса с информацией о валютах в виде:

        {
            'AMD': {
                'CharCode': 'AMD',
                'ID': 'R01060',
                'Name': 'Армянских драмов',
                'Nominal': 100,
                'NumCode': '051',
                'Previous': 14.103,
                'Value': 14.0879
                },
            ...
        }
        """
        r = requests.get('https://www.cbr-xml-daily.ru/daily_json.js')
        return r.json()['Valute']

    def max_rate(self):
        """
        Возвращает валюту currency с максимальным значением курса на текущий день
        """
        response = self.exchange_rates()
        max_value = 0
        for currency in response.values():
            if currency['Value'] > max_value:
                max_value = currency['Value']
                max_cur = currency['Name']
        return max_cur

print('Задание 3.')
print('Валюта с максимальным значение курса на сегодня:', Rate().max_rate(), '\n')

# 5. Напишите функцию, возвращающую сумму первых n чисел Фибоначчи
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, …
def sum_fibonacci(num = 1):
    def fibonacci(num):
        if num > 1:
            return fibonacci(num - 2) + fibonacci(num - 1)
        else:
            return 1
    fib = [0, ]
    for i in range(num):
        fib.append(fibonacci(i))
    return(sum(fib))

print('5 и 6 сделала для себя, на зачет с отл не сделала 4')
print('Задание 5.')
num = 7
print('Сумма первых', num, 'чисел Фибоначчи равна', sum_fibonacci(num), '\n')

# 6. Напишите функцию, преобразующую произвольный список вида [‘2018-01-01’, ‘yandex’, ‘cpc’, 100]
# в словарь {‘2018-01-01’: {‘yandex’: {‘cpc’: 100}}}
def list_to_dict(list_for_change = [0, ]):
    new_dict = {list_for_change[len(list_for_change) - 2]: list_for_change[len(list_for_change) - 1]}
    for i in range(2, len(list_for_change)):
        new_dict = {list_for_change[len(list_for_change) - (i + 1)]: new_dict}
    return new_dict

print('Задание 6.')
new_list = list_to_dict(['2018-01-01', 'yandex', 'cpc', 100])
print(new_list)
