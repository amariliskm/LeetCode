class Solution(object):
    def climbStairs(self, n):
        # def climb(n) :
        #     if n in {0,1,2} :
        #         return n
        #     return climb(n - 1) + climb(n - 2)
        # return climb(n)

        memo = {}
        memo[1] = 1
        memo[2] = 2
        
        def climb(n):
            if n in memo: # if the recurssion already done before first take a look-up in the look-up table
                return memo[n]
            else:   # Store the recurssion function in the look-up table 
                memo[n] =  climb(n-1) + climb(n-2)
                return memo[n]
        
        return climb(n)
#fibbonachi