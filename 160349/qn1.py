#!/usr/bin/python
import string
symbols = string.digits + string.uppercase

def intbase(number, base):

    return int(number, base)

def inttobase(number):

    sign = -1 if number < 0 else 1
    number *= sign
    ans = ''
    while number:
        ans += symbols[number % 10]
        number //= 10
    if sign == -1:
        ans += '-'
    return ans[::-1]

def fractionalbase(number, base):

    ans = 0
    for i in xrange(1, len(number)+1):
        ans += symbols.index(number[i-1]) * base**-i
    return ans

def fractionaltobase(number, precision=6):

    ans = ''
    for i in xrange(precision):
        tmp = number * 10
        itmp = int(tmp)
        ans += str(symbols[itmp])
        number = tmp - itmp
    return ans

def convert(number, base, precision=None):
    try:
        integer_part, fractional_part = number.split('.')
        precision = 6 if precision is None else precision
        integer_part = inttobase(
            intbase(integer_part, base),
        )
        fractional_part = fractionaltobase(
            fractionalbase(fractional_part, base),
            precision
        )
        return integer_part+'.'+fractional_part
    except ValueError:   
        return inttobase(intbase(number, base))
a = raw_input()
b = input()
if b<2 or b>37 :
   print "Invalid Input"
else :
   i = 0
   while(i<len(a)):
       j = 0
       flag = 0
       while(j<36):
          if symbols[j] == a[i] and j >= b :
              flag +=1
              break
          
          else:
              j +=1
       i +=1


if flag>0 :
  print "Invalid input"
elif not a.upper():
  print "invalid input"
else :
  c = convert(a, b)
  print c
