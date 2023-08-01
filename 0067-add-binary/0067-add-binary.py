class Solution:
    def addBinary(self, a: str, b: str) -> str:
        array = [list(a),list(b)]

        maximum_length = max(len(array[0]),len(array[1]))
        minimum_length = min(len(array[0]),len(array[1]))

        if maximum_length != minimum_length:
            maxi =[]
            mini =[]


            for i in range(len(array)):
                if len(array[i]) == maximum_length:
                    maxi = array[i]
                else : mini = array[i] 

            mini_reverse = mini[::-1]
            maxi_reverse = maxi[::-1]


            for i in range(maximum_length-minimum_length):
                mini_reverse += "0" # dijadikan sama panjang
        else :
            mini_reverse = array[0][::-1]
            maxi_reverse = array[1][::-1]


        mini_reverse = [int(numeric_string) for numeric_string in mini_reverse]
        maxi_reverse = [int(numeric_string) for numeric_string in maxi_reverse]

        sum=""

        for i in range(maximum_length):
            num = mini_reverse[i] + maxi_reverse[i]
            if num == 0:
                sum += "0"
            elif num == 1:
                sum += "1"
            elif num == 2:
                sum += "0"
                if i+1 == maximum_length:
                    sum += "1"
                else : mini_reverse[i+1] = mini_reverse[i+1]+1
            elif num == 3:
                sum += "1"
                if i+1 == maximum_length:
                    sum += "1"
                else : mini_reverse[i+1] = mini_reverse[i+1]+1

        
        return sum[::-1]