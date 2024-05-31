class Solution {
    public int solution(int[] sides) {
        int max = 0;
        int sum = 0;
        for (int side : sides) {
            if (max < side) {
                max = side;
            }
            sum += side;
        }
        return (sum - max) > max ? 1 : 2;
    }
}