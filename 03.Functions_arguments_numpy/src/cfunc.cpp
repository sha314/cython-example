
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