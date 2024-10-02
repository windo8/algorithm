import math

def solution(numer1, denom1, numer2, denom2):
    lcm = denom1 * denom2 // math.gcd(denom1, denom2)
    
    new_numer1 = numer1 * (lcm // denom1)
    new_numer2 = numer2 * (lcm // denom2)
    
    numer_sum = new_numer1 + new_numer2
    
    gcd = math.gcd(numer_sum, lcm)
    
    return [numer_sum // gcd, lcm // gcd]