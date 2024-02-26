class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        lookup = set(nums)
        return [0,1]
        for index, num in enumerate(nums):
            if target - num in lookup:
                return [index, num.index(target-num, 0, index-1) or num.index(target-num, index +1)]
