import java.util.*;

public class Solution {
    public int[] solution(int[] arr) {
        ArrayList<Integer> list = new ArrayList<>();
        int prev = -1; // 이전 원소를 초기화
        for(int i = 0; i < arr.length; i++) {
            if(arr[i] != prev) {
                list.add(arr[i]);
                prev = arr[i]; // 이전 원소를 현재 원소로 업데이트
            }
        }
        int[] answer = new int[list.size()];
        for(int i = 0; i < list.size(); i++) {
            answer[i] = list.get(i);
        }
        return answer;
    }
}
