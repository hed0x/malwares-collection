#include <stdio.h>

unsigned char * simple_resize(unsigned char * orgin,int ox,int oy,int dx,int dy)
{
    unsigned char *cr,*p,*l;
    int i,j,k,ip;
    cr=(unsigned char*) malloc(dx*dy*3); l=cr;
    
    for(j=0;j<dy;j++,l+=dx*3)
    {
	p=orgin+(j*oy/dy*ox*3);
	for(i=0,k=0;i<dx;i++,k+=3)
	{
	    ip=i*ox/dx*3;
	    l[k]=p[ip];
	    l[k+1]=p[ip+1];
	    l[k+2]=p[ip+2];
	}
    }
    free(orgin);
    return(cr);
}

unsigned char * color_average_resize(unsigned char * orgin,int ox,int oy,int dx,int dy)
{
    unsigned char *cr,*p,*q;
    int i,j,k,l,ip,xa,xb,ya,yb;
    int sq,r,g,b;
    cr=(unsigned char*) malloc(dx*dy*3); p=cr;
    
    for(j=0;j<dy;j++)
    {
	for(i=0;i<dx;i++,p+=3)
	{
	    xa=i*ox/dx;
	    ya=j*oy/dy;
	    xb=(i+1)*ox/dx; if(xb>=ox) xb=ox-1;
	    yb=(j+1)*oy/dy; if(yb>=oy) yb=oy-1;
	    for(l=ya,r=0,g=0,b=0,sq=0;l<=yb;l++)
	    {
		q=orgin+((l*ox+xa)*3);
		for(k=xa;k<=xb;k++,q+=3,sq++)
		{
		    r+=q[0]; g+=q[1]; b+=q[2];
		}
	    }
	    p[0]=r/sq; p[1]=g/sq; p[2]=b/sq;
	}
    }
    free(orgin);
    return(cr);
}
