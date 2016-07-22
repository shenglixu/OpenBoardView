#ifdef __APPLE__

#include <string>
#import <Cocoa/Cocoa.h>

char *show_file_picker() {
	std::string filename;
	NSOpenPanel *op = [NSOpenPanel openPanel];

	if ([op runModal] == NSModalResponseOK) {
		NSURL *nsurl = [[op URLs] objectAtIndex:0];
		filename = std::string([[nsurl path] UTF8String]);
	}

	size_t len = filename.length();
	char *path = (char *)malloc(len+1);
	memcpy(path, filename.c_str(), len+1);

	return path;
}

std::string get_asset_path(const char* asset) {
	std::string path = std::string([[[NSBundle mainBundle] resourcePath] UTF8String]);
	path += "/";
	path += asset;
	return path;
}

#endif