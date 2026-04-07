#write a code to check give word is palindrome or not
word=(input("Enter the word"))
if word==word[::-1]:
	print("mention word is palindrome")
else:
	print("mention word isnot palindrome")

