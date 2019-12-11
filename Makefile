ANGLE_PATH = /Users/alvatar/projects/external/angle

ANGLE_LIB_PATH = out/Debug

#LIB_PATH = $(ANGLE_PATH)/$(ANGLE_LIB_PATH)
LIB_PATH = ./lib

all:
	@rm -f gles2.o1
	@gsc -cc-options "-I$(ANGLE_PATH)/include" -ld-options "-L$(LIB_PATH) -lGLESv2 -lEGL" gles2
	@install_name_tool -change @rpath/libEGL.dylib @loader_path/lib/libEGL.dylib gles2.o1
	@install_name_tool -change @rpath/libGLESv2.dylib @loader_path/lib/libGLESv2.dylib gles2.o1
