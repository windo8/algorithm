class Solution {
    public String solution(String my_string) { // "bread"
        String answer = ""; // "daerb"
        StringBuilder sb = new StringBuilder(my_string);
        answer = sb.reverse().toString();
        // int startIndex = my_string.length() -1; // 4, 3, 2, 1, 0
        // for(int i = startIndex; i >= 0; i --) {
        //     answer += my_string.charAt(i);
        // }
        return answer;
    }
}