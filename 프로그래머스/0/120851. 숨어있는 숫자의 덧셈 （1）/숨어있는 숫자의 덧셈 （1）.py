def solution(my_string):
    return sum(map(lambda x: int(x) ,filter(str.isdigit, my_string)))