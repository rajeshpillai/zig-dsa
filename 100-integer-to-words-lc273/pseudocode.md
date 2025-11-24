```pseudocode
# Pseudocode for LeetCode 273 – Integer to English Words

We will use:
- Arrays for words below 10, below 20, and tens
- A helper function to convert numbers in [1, 999]
- The main function to handle Billion, Million, Thousand groups

---

## Word tables

lessThan10 = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]
lessThan20 = ["Ten","Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"]
lessThan100 = ["Twenty","Thirty","Forty","Fifty","Sixty","Seventy","Eighty","Ninety"]

---

## Helper for [1..999]

function helper(num):
    // returns English words for 1 <= num <= 999 (no leading/trailing spaces)

    if num == 0:
        return ""   // empty string, used by caller

    if num < 10:
        return lessThan10[num - 1]

    if num < 20:
        return lessThan20[num - 10]

    if num < 100:
        tensPart = lessThan100[(num / 10) - 2]         // integer division
        ones = num % 10
        if ones == 0:
            return tensPart
        else:
            return tensPart + " " + helper(ones)

    // 100..999
    hundreds = num / 100
    rest = num % 100

    result = lessThan10[hundreds - 1] + " Hundred"

    if rest != 0:
        result = result + " " + helper(rest)

    return result

---

## Main function

function numberToWords(num):
    if num == 0:
        return "Zero"

    result = ""  // will accumulate parts with spaces

    // Handle billions
    billions = num / 1_000_000_000
    if billions > 0:
        result = result + helper(billions) + " Billion"
        num = num % 1_000_000_000

    // Handle millions
    millions = num / 1_000_000
    if millions > 0:
        if result is not empty:
            result = result + " "
        result = result + helper(millions) + " Million"
        num = num % 1_000_000

    // Handle thousands
    thousands = num / 1_000
    if thousands > 0:
        if result is not empty:
            result = result + " "
        result = result + helper(thousands) + " Thousand"
        num = num % 1_000

    // Handle the rest (0..999)
    if num > 0:
        if result is not empty:
            result = result + " "
        result = result + helper(num)

    return result

```