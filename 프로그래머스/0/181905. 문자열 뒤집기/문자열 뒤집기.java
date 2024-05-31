class Solution {
    public String solution(String my_string, int s, int e) {
    StringBuilder sb = new StringBuilder(my_string);
    return sb.replace(s, e + 1, new StringBuilder(my_string.substring(s, e + 1)).     reverse().toString()).toString();
    }
}