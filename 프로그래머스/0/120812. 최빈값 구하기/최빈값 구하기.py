def solution(array):
    answer = {}
    for n in array:
        answer[n] = array.count(n)
    print(answer)
    max_v = 0
    max_k = 0
    for k, v in answer.items():
        if v > max_v:
            max_v = v
            max_k = k
            
    if list(answer.values()).count(max_v) >= 2:
        return -1
    
    return max_k