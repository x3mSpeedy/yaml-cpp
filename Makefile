# Simple makefile for building and packaging projetc yaml-cpp

BUILD_TREE = build_tree

cmake:
	mkdir -p $(BUILD_TREE)
	cd $(BUILD_TREE) && cmake -DBUILD_SHARED_LIBS=ON ..
.PHONY : cmake

	
build: cmake
	cd $(BUILD_TREE) && make yaml-cpp
.PHONY : build	


package: build
	cd $(BUILD_TREE) && make package
.PHONY : package