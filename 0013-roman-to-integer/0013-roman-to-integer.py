class Solution:
    def romanToInt(self, s: str) -> int:
        dict = {
            'I' : 1,
            'V' : 5,
            'X' : 10,
            'L' : 50,
            'C' : 100,
            'D' : 500,
            'M' : 1000,
            # 'IV' : 4,
            # 'IX' : 9,
            # 'XL' : 40,
            # 'XC' : 90,
            # 'CD' : 400,
            # 'CM' : 900
        }

        array = list(s)
        cnt = 0

        for i in range(len(array)):
            cnt += dict[array[i]]

        for i in range(len(array)-1):
            if array[i]=='I' and array[i+1]=='V':
                cnt -=2
            elif array[i]=='I' and array[i+1]=='X' :
                cnt -=2
            elif array[i]=='X' and array[i+1]=='L' :
                cnt -=20
            elif array[i]=='X' and array[i+1]=='C':
                cnt -=20
            elif array[i]=='C' and array[i+1]=='D':
                cnt -= 200
            elif array[i]=='C' and array[i+1]=='M':
                cnt -= 200


        return cnt
