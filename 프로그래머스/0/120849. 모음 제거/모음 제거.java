import java.util.*;
class Solution {
    public String solution(String my_string) {
        String answer = "";
        String[] vowels = {"a", "e", "i", "o", "u"};

        for (int i = 0; i < my_string.length(); i++) {
            String ch = Character.toString(my_string.charAt(i));
            boolean isVowel = false;

            for (int j = 0; j < vowels.length; j++) {
                if (vowels[j].equals(ch)) {
                    isVowel = true;
                    break;
                }
            }

            if (!isVowel) {
                answer += ch;
            }
        }

        return answer;
    }
}
