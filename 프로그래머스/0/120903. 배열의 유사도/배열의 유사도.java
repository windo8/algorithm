import java.util.Arrays;

public class Solution {
    public int solution(String[] s1, String[] s2) {
        Arrays.sort(s1);
        Arrays.sort(s2);

        int i = 0, j = 0, count = 0;
        while (i < s1.length && j < s2.length) {
            if (s1[i].equals(s2[j])) {
                count++;
                i++;
                j++;
            } else if (s1[i].compareTo(s2[j]) < 0) {
                i++;
            } else {
                j++;
            }
        }

        return count;
    }
}