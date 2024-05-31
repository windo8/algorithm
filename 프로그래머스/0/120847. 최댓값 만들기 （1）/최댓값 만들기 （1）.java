import java.util.Arrays;

class Solution {
    public int solution(int[] numbers) {
        int answer = 0;
        Arrays.sort(numbers);
        int s1 = numbers[numbers.length-1];
        int s2 = numbers[numbers.length-2];
        
        answer = s1 * s2;
        return answer;
    }
}