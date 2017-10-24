seq = 'GACTTAATGGGCAATAGGCAAGCACTTGAAAAAGATGCCAACGACATGAAAACACAAGACAA'
count = 0
for base in seq:
    if base is 'G':
        count += 1
print(count)

print(seq.count('G'))

s = "hello"
capital_s = ""
for char in s:
   capital_letter = char.upper()
   capital_s += capital_letter

print(capital_s)