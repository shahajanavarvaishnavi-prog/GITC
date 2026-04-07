#write a code to check give word is palindrome or not
word=str(input("Enter the word"))
if word==word[::-1]:
	print("is palindrome")
else:
	print("word isnot palindrome")

