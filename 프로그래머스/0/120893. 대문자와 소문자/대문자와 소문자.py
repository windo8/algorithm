def solution(my_string):
    cha = ''
    for c in list(my_string):
        if c.isupper():
            cha += c.lower()
        if c.islower():
            cha += c.upper()
    return cha