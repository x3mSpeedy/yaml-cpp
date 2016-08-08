# Simple makefile for building and packaging projetc yaml-cpp

BUILD_TREE = build_tree

install:
	mkdir -p $(BUILD_TREE)
	cd $(BUILD_TREE) && cmake -DBUILD_SHARED_LIBS=ON ..
	cd $(BUILD_TREE) && make yaml-cpp
	cd $(BUILD_TREE) && make package
.PHONY : install