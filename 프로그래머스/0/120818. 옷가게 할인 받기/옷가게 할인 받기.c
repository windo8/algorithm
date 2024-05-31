#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int solution(int price) {
    int answer = 0;

    double discountRate = 0;
    if(price >= 500000) {
        discountRate = 0.20;
    } else if (price >= 300000) {
        discountRate = 0.10;
    } else if (price >= 100000) {
        discountRate = 0.05;
    }
    double discountAmount = price * discountRate;
    answer = (int)(price - discountAmount);
    
    return answer;
}