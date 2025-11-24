## Pseudocode

```text
function validMountainArray(arr):
    n = length(arr)
    if n < 3:
        return false

    i = 0

    # Walk strictly up
    while i + 1 < n and arr[i] < arr[i + 1]:
        i = i + 1

    # Peak can't be first or last
    if i == 0 or i == n - 1:
        return false

    # Walk strictly down
    while i + 1 < n and arr[i] > arr[i + 1]:
        i = i + 1

    # Must reach the end if it is a valid mountain
    return i == n - 1
```

---