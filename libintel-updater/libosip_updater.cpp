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
#include <updater/updater.h>
#include <common.h>
#include <cutils/properties.h>
#include <sys/mman.h>

extern "C" {
int flash_image(void *data, unsigned sz, const char *name);
}

Value *FlashOSImage(const char *name, State * state, int argc, Expr * argv[])
{
	char* result = NULL;

	Value *funret = NULL;
	char *image_type;
	int ret;

	Value* partition_value;
	Value* contents;
	if (ReadValueArgs(state, argv, 2, &contents, &partition_value) < 0) {
		return NULL;
	}

	char* partition = NULL;
	if (partition_value->type != VAL_STRING) {
		ErrorAbort(state, "partition argument to %s must be string", name);
		goto exit;
	}

	partition = partition_value->data;
	if (strlen(partition) == 0) {
		ErrorAbort(state, "partition argument to %s can't be empty", name);
		goto exit;
	}

	if (contents->type == VAL_STRING && strlen((char*) contents->data) == 0) {
		ErrorAbort(state, "file argument to %s can't be empty", name);
		goto exit;
	}

	image_type = basename(partition);

	ret = flash_image(contents->data, contents->size, image_type);
	if (ret != 0) {
		ErrorAbort(state, "%s: Failed to flash image %s, %s.",
			   name, image_type, strerror(errno));
		goto free;
	}

	funret = StringValue(strdup("t"));

free:
	free(image_type);
exit:
	return funret;
}

void Register_libosip_updater(void)
{
	RegisterFunction("write_osip_image", FlashOSImage);
}
