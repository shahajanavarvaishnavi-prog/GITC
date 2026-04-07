#write a code to check give word is palindrome or not
word=(input("Enter the word"))
if word==word[::-1]:
	print("given word is palindrome")
else:
	print("given word isnot palindrome")

