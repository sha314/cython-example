
#include "cfunc.h"
#include<iostream>
#include <stdio.h>

using namespace std;



void view_array(const std::vector<int>& v){
	cout << '{';
	for(size_t i{}; i < v.size(); ++i){
		cout << v[i] << ',';
	}
	cout << '}' << endl;
}


void view_array_2d(const std::vector<std::vector<int>>& v){
	cout << '{';
	for(size_t i{}; i < v.size(); ++i){
		view_array(v[i]);
	}
	cout << '}' << endl;
}

/**
 To add two array or list
**/
std::vector<int>
add(
	const std::vector<int>& v1,
	const std::vector<int>& v2
){
	if (v1.size() != v2.size()){
		cout << "Size mismatched !" << endl;
		return std::vector<int>();
	}
	std::vector<int> v3(v1.size());
	for(size_t i{}; i < v1.size(); ++i){
		v3[i] = v1[i] + v2[i];
	}
	return v3;
}