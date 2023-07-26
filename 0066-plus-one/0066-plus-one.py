class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:


        reverse = digits[::-1]
        i = 0
        reverse[i]+=1

        n = len(reverse)
        while reverse[i] == 10 :
            reverse[i] = 0
            if i+1 == n:
                reverse.append(1)#append
            else:
                reverse[i+1] += 1
            i += 1

        digits = reverse[::-1]
        return digits
        