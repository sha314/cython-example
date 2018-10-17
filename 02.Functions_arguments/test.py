print("importing...")
# from helloextension import c_hello
# from helloextension import c_factorial
import functionextension


def main():
    print("testing cython")
    x = functionextension.py_factorial(4)
    print(x)


if __name__ == "__main__":
    main()

    