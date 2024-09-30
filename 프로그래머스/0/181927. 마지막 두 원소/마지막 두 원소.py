def solution(num_list):
    a, b = num_list[-2:]
    if a >= b:
        num_list.append(b * 2)
    elif a < b:
        num_list.append(b - a)
    return num_list