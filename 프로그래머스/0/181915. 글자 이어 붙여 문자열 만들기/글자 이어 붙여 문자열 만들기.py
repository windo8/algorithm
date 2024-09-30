def solution(my_string, index_list):
    answer = [my_string[i] for i in index_list]
    return ''.join(answer)