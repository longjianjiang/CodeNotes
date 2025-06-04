'''
题目5: 编写程序实现,
在程序中预设一个0-9之间的整数(预设就是指自己指定一个数字即可), 让用户通过键盘输入所猜的数,
如果大于预设的数, 显示"遗憾, 太大了", 小于预设的数, 显示"遗憾, 太小了",
如此循环, 直至猜中该数, 显示"预测N次, 你猜中了!", 其中N是用户输入数字的次数.
提示: 使用while无限循环, 当猜中时break
'''

import random

# num = random.randint(0, 9)
# count = 0
# while True:
#     guess = int(input("请输入你猜的数字: "))
#     count += 1
#     if guess > num:
#         print("遗憾, 太大了")
#     elif guess < num:
#         print("遗憾, 太小了")
#     else:
#         print(f"预测{count}次, 你猜中了!")
#         break

# 3, 2, 1, 4, 5
def bubble_sort(arr):
    n = len(arr)
    i = 0
    while i < n:
        j = i + 1
        while j < n:
            if arr[j] < arr[i]:
                tmp = arr[j]
                arr[j] = arr[i]
                arr[i] = tmp
            j += 1
        i += 1
    return arr

print(bubble_sort([3, 2, 1, 4, 5]))
