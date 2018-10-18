print("importing...")
# from helloextension import c_hello
# from helloextension import c_factorial
import functionextension
import numpy as np

def main():
	print("testing cython")
	x = [10,-2,35]
	functionextension.py_view_array(x)
	y = [[1,2], [30,40], [5, 6, 7]]
	functionextension.py_view_array_2d(y)
	z = np.array(y)
	print(z.shape)
	functionextension.py_view_array_2d(z)
	x2 = functionextension.py_add(np.ones(10), np.ones(10))
	print("type of the returened result : ", type(x2))
	print(x2)

if __name__ == "__main__":
	main()

    