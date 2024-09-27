def solution(hp):
    a = hp // 5  
    hp %= 5            
    b = hp // 3 
    c = hp % 3  

    return a + b + c