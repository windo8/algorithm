import java.util.*;
class Solution {
    public int[] solution(int[] arr, int divisor) {
        ArrayList<Integer> list = new ArrayList<>();
        for(int x : arr) {
            if(x % divisor == 0) {
                list.add(x);
            }
        }
        int[] answer = null;
        if(list.size() != 0) {
            answer = new int[list.size()];
            for(int i = 0; i < list.size(); i++) {
                answer[i] = list.get(i);
            }
            Arrays.sort(answer);
        } else {
            answer = new int[1];
            answer[0] = -1;
        }
        
        return answer;
    }
}