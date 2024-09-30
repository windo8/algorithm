def solution(n, control):
    for s in control:
        if 'w' == s:
            n += 1
        if 's' == s:
            n -= 1
        if 'd' == s:
            n += 10
        if 'a' == s:
            n -= 10
    return n