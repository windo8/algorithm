import java.util.*;
class Solution {
    public String solution(String s) {
        char[] array = s.toCharArray();
        Arrays.sort(array);
        String s2 = new String(array);
        StringBuilder sb = new StringBuilder(s2);
        String answer = sb.reverse().toString();
        return answer;
    }
}