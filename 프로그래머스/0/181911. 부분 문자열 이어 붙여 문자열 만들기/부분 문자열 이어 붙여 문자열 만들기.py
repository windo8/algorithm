def solution(my_strings, parts):
    string = [value[parts[index][0]: parts[index][1] + 1] for index, value in enumerate(my_strings)]
    return ''.join(string)