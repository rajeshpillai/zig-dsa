
```
function maxArea(heights):
    left  = 0
    right = length(heights) - 1
    best  = 0

    while left < right:
        left_side  = heights[left]
        right_side = heights[right]

        height = min(left_side, right_side)
        width  = right - left
        area   = height * width

        if area > best:
            best = area

        if left_side < right_side:
            left = left + 1
        else:
            right = right - 1

    return best
```