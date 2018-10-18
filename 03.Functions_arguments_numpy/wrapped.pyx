# distutils: language = c++
# cython: language_level=3

import numpy as pnp  # python numpy
cimport numpy as cnp # cython numpy

# tag: numpy_old
# You can ignore the previous line.
# It's for internal testing of the cython documentation.

import numpy as np

# "cimport" is used to import special compile-time information
# about the numpy module (this is stored in a file numpy.pxd which is
# currently part of the Cython distribution).
cimport numpy as np

# We now need to fix a datatype for our arrays. I've used the variable
# DTYPE for this, which is assigned to the usual NumPy runtime
# type info object.
DTYPE = np.int

# "ctypedef" assigns a corresponding compile-time type to DTYPE_t. For
# every type in the numpy module there's a corresponding compile-time
# type with a _t-suffix.
ctypedef np.int_t DTYPE_t



from libcpp.vector cimport vector

# This file shows 2 examples:
#   - Wrapping an external c function into python, "py_hello"
#   - Wrapping an external c function into python, "py_factorial"


cdef extern from "src/cfunc.h":
	# Imports definitions from a c header file
	# Corresponding source file (cfunc.cpp) must be added to
	# the extension definition in setup.py for proper compiling & linking

	void view_array(vector[int]& v)
	void view_array_2d(vector[vector[int]]& v)


def py_view_array(v):
	print('executing py_view_array')
	view_array(v)

def	py_view_array_2d(v):
	print('executing py_view_array_2d')
	view_array_2d(v)


def py_view_np_array(A):
	print("executing py_view_np_array")
	if isinstance(A, pnp.ndarray):
		print('numpy. by converting to list')
		view_array_2d(A.tolist())
		pass
	elif isinstance(A, list):
		print('list')
		view_array_2d(A)
		pass
	# print(A.shape[0])
	# print(A.shape[1])
	# cdef np.ndarray[np.int64_t, ndim=2, mode="c"] B = A
	# view_array_2d(B)

# def py_add_np_array(np.ndarray[np.int64_t, ndim=2, mode="c"] A,
#                        np.ndarray[np.int64_t, ndim=2, mode="c"] B):

# 	cdef int size_y = A.shape[0]
# 	cdef int size_x = A.shape[1]

# 	cdef np.ndarray[np.int64_t, ndim=2, mode="c"] plus = np.zeros([size_y, size_x], dtype=np.int64)
# 	cdef np.ndarray[np.int64_t, ndim=2, mode="c"] minus = np.zeros([size_y, size_x], dtype=np.int64)

# 	_plus_minus(A, B, plus, minus)

# 	return np.asarray(plus), np.asarray(minus)

