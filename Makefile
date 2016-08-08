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
	# copy out packages
	cp $(BUILD_TREE)/YAML_CPP_0.5.2.deb 	/var/www/html/packages/YAML_CPP_0.5.2.deb
	cp $(BUILD_TREE)/YAML_CPP_0.5.2.tar.gz 	/var/www/html/packages/YAML_CPP_0.5.2.tar.gz
	cp $(BUILD_TREE)/YAML_CPP_0.5.2.zip 	/var/www/html/packages/YAML_CPP_0.5.2.zip
.PHONY : package