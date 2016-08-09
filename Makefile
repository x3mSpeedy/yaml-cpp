# Simple makefile for building and packaging projetc yaml-cpp

# build type
BUILD_TYPE = debug
# default location for building
BUILD_TREE = build_tree
# given by docker -v option
PACKAGE_DIR = /packages/YAML_CPP_0.5.2_$(BUILD_TYPE)/

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
	mkdir -p $(PACKAGE_DIR)
	cp $(BUILD_TREE)/YAML_CPP_0.5.2.deb 	$(PACKAGE_DIR)/YAML_CPP_0.5.2.deb
	cp $(BUILD_TREE)/YAML_CPP_0.5.2.tar.gz 	$(PACKAGE_DIR)/YAML_CPP_0.5.2.tar.gz
	cp $(BUILD_TREE)/YAML_CPP_0.5.2.zip 	$(PACKAGE_DIR)/YAML_CPP_0.5.2.zip
.PHONY : package