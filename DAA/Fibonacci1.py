import time

start = time.time()

def fibonacci_recursive(n):
    if n <= 1:
        return n
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)


n = int(input("Enter Number: "))
result = fibonacci_recursive(n)
print(f"The {n}th Fibonacci number is {result}.")

end = time.time()
print("Execution time is: {}ms".format((end-start)*10**3))