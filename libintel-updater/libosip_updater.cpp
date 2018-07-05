#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <inttypes.h>
#include <sys/stat.h>
#include <stdarg.h>
#include <libgen.h>
#include <edify/expr.h>
#include "updater/updater.h"
#include <common.h>
#include <cutils/properties.h>
#include <sys/mman.h>
#include <string>
#include <vector>
#include <memory>

extern "C" {
int flash_image(void *data, unsigned sz, const char *name);
}

Value *FlashOSImage(const char *name, State * state, const std::vector<std::unique_ptr<Expr>>& argv)
{
	char* result = NULL;

	Value *funret = NULL;
	char *image_type;
	int ret;

	Value* partition_value;
	Value* contents;
        std::vector<std::unique_ptr<Value>>* args;
	if (!ReadValueArgs(state, argv, args)) {
		return NULL;
	}

	std::string partition = NULL;
        std::string contents2 = NULL;
	if (partition_value->type != VAL_STRING) {
		ErrorAbort(state, "partition argument to %s must be string", name);
		return funret;
	}

	partition = partition_value->data;
	if (partition.length() == 0) {
		ErrorAbort(state, "partition argument to %s can't be empty", name);
		return funret;
	}
        
        contents2 = contents->data;
	if (contents->type == VAL_STRING && contents2.length() == 0) {
		ErrorAbort(state, "file argument to %s can't be empty", name);
		return funret;
	}
        const char *сpartition = partition.c_str();
	image_type = basename(сpartition);

	ret = flash_image(&(contents->data), contents->data.length(), image_type);
	if (ret != 0) {
		ErrorAbort(state, "%s: Failed to flash image %s, %s.",
			   name, image_type, strerror(errno));
		free(image_type);
	}

	funret = StringValue("t");
        return funret;
}

void Register_libosip_updater(void)
{
	RegisterFunction("write_osip_image", FlashOSImage);
}
