
def estPalindrome(st):

    oneWay = [c for c in st.lower() if c.isalpha()]
    return (oneWay == oneWay[::-1])


print(estPalindrome("RADAR"))
print(estPalindrome("ESOPE RESTE ICI ET SE REPOSE"))

