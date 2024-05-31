class Solution {
    public boolean solution(String s) { // "a234" false
        boolean answer = true;
        //String => char, 1) toCharArray() 2) chatAt(index)
        char[] c = s.toCharArray();
        if(s.length() == 4 || s.length() == 6) {
            for(char x : c) {
            if(x < '0' || x > '9') {
                answer = false;
                }
            }
        } else {
            answer = false;
        }
        return answer;
    }
}