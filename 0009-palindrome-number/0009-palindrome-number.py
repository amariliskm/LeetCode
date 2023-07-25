class Solution:
    def isPalindrome(self, x: int) -> bool:
        string = str(x)
        n = string[::-1]
        if string == n :
            return True
        else :
            return False