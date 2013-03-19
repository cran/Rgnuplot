#include <R.h>
#include <stdio.h>
#include <stdlib.h>
#include "gnuplot_i.h"
#include <stdarg.h>
#define SLEEP_LGTH  1

static gnuplot_ctrl * h1;

int Rgnuplot_mandel( double  *x,double  *y,double  *z,int  *n ,int  *maxiterations,int  *retmandel )
{
double zz[2]={ z[0] * z[0] - z[1] * z[1] + *x, 2.0 * z[0] * z[1] + *y };
int m[1]={*n+1};
return(*retmandel = ( ((sqrt( z[0] * z[0] + z[1] * z[1] )>2.0) || (*n >= *maxiterations)) ? *n : Rgnuplot_mandel(x,y, zz ,m, maxiterations,retmandel) ));
}

void Rgnuplot_init(gnuplot_ctrl  **handle, char const  **optcmd)
{
h1=gnuplot_init2(*optcmd);
*handle=h1;
}

//	*	*	*	Function "gnuplot_init" Package "gnuplot"		*	*	*
/*void Rgnuplot_init( gnuplot_ctrl  **rtrnvalue )
{
*rtrnvalue=gnuplot_init();
}*/

void Rgnuplot_send(gnuplot_ctrl  **handle, char const **cmd)
{
gnuplot_ctrl  * hh=*handle;
fputs(*cmd, hh->gnucmd);
fputs("\n", hh->gnucmd);
//fprintf(hh->gnucmd, *cmd);
//fprintf(hh->gnucmd, "\n");
fflush(hh->gnucmd);
}

//	*	*	*	Function "gnuplot_close" Package "gnuplot"		*	*	*
void Rgnuplot_close( gnuplot_ctrl  **handle )
{
gnuplot_close(  *handle );//h1
}

//	*	*	*	Function "gnuplot_cmd" Package "gnuplot"		*	*	*
void Rgnuplot_cmd( gnuplot_ctrl  **handle, char const  **cmd, ... )
{
/*gnuplot_cmd( *handle,*cmd);//"plot sin(x)"
}*/

gnuplot_ctrl  * hh=*handle;
const char *p;
int i,subspecPos;
int *i2;
unsigned ui;
unsigned *ui2;
double d;
double *d2;
char *s;
char **s2;
va_list argp;
char str[50];
char subspecs[20];
subspecPos=-1;
va_start(argp, cmd);
for(p = *cmd; *p != '\0'; p++) {
if(*p == '%') subspecPos=0;
if(subspecPos==-1) {
			fputc(*p, hh->gnucmd);
//fprintf(hh->gnucmd, "%c", *p);
			continue;
		}
subspecs[subspecPos++]=*p;
subspecs[subspecPos+1]=0;

		switch(*++p) {

		case 'i':
		case 'd':
subspecs[subspecPos++]=*p;
subspecs[subspecPos+1]=0;
i2 = va_arg(argp, int**);
i=(int)*i2;
sprintf(str,subspecs,i);
//printf("$%s$", subspecs);printf("$%s$", str);
fputs(str, hh->gnucmd);
//fprintf(hh->gnucmd, str);
subspecPos=-1;
			break;

case 'e':
case 'E':
case 'f':
case 'g':
case 'G':
subspecs[subspecPos++]=*p;
subspecs[subspecPos+1]=0;
d2 = va_arg(argp, double**);
d=(double)*d2;
sprintf(str,subspecs,d);
//printf("$%s$", subspecs);printf("$%s$", str);
fputs(str, hh->gnucmd);
//fprintf(hh->gnucmd, str);
subspecPos=-1;
break;

		case 'u':
		case 'x':
		case 'X':
		case 'o':
subspecs[subspecPos++]=*p;
subspecs[subspecPos+1]=0;
			ui2 = va_arg(argp, unsigned int**);
ui=(unsigned)*ui2;
			sprintf(str,subspecs,ui);
//printf("$%s$", subspecs);printf("$%s$", str);
fputs(str, hh->gnucmd);
//fprintf(hh->gnucmd, str);
subspecPos=-1;
			break;
case 'c':
		case 's':
subspecs[subspecPos++]=*p;
subspecs[subspecPos+1]=0;
s2 = va_arg(argp, char ****);
s=(char*)*s2;
//printf("$%s$", subspecs);printf("$%s$", s);
			fputs(s, hh->gnucmd);
//fprintf(hh->gnucmd, s);
subspecPos=-1;
			break;
		case '%':
subspecs[subspecPos++]=*p;
subspecs[subspecPos+1]=0;
			fputc('%', hh->gnucmd);
//fprintf(hh->gnucmd, "%c", '%');
subspecPos=-1;
			break;
default :
if(subspecPos>-1) subspecPos++;
break;
		}
	}

	va_end(argp);
fputs("\n", hh->gnucmd) ;
//fprintf(hh->gnucmd, "\n");
fflush(hh->gnucmd) ;
}

//	*	*	*	Function "gnuplot_setstyle" Package "gnuplot"		*	*	*
void Rgnuplot_setstyle( gnuplot_ctrl  **h, char  **plot_style )
{
gnuplot_setstyle( *h,*plot_style );
}

//	*	*	*	Function "gnuplot_set_xlabel" Package "gnuplot"		*	*	*
void Rgnuplot_set_xlabel( gnuplot_ctrl  **h, char  **label )
{
gnuplot_set_xlabel( *h,*label );
}

//	*	*	*	Function "gnuplot_set_ylabel" Package "gnuplot"		*	*	*
void Rgnuplot_set_ylabel( gnuplot_ctrl  **h, char  **label )
{
gnuplot_set_ylabel( *h,*label );
}

//	*	*	*	Function "gnuplot_resetplot" Package "gnuplot"		*	*	*
void Rgnuplot_resetplot( gnuplot_ctrl  **h )
{
gnuplot_resetplot( *h );//h1
}

//	*	*	*	Function "gnuplot_plot_x" Package "gnuplot"		*	*	*
void Rgnuplot_plot_x( gnuplot_ctrl  **handle, double  *d, int *n, char  **title )
{
gnuplot_ctrl  * hh=*handle;
gnuplot_plot_x( hh,d,*n,*title );
}

//	*	*	*	Function "gnuplot_plot_xy" Package "gnuplot"		*	*	*
void Rgnuplot_plot_xy( gnuplot_ctrl  **handle, double  *x, double  *y, int *n, char  **title )
{
gnuplot_ctrl  * hh=*handle;
gnuplot_plot_xy( hh,x,y,*n,*title );
}

//	*	*	*	Function "gnuplot_plot_once" Package "gnuplot"		*	*	*
void Rgnuplot_plot_once( char  **title, char  **style, char  **label_x, char  **label_y, double  *x, double  *y, int *n )
{
gnuplot_plot_once( *title,*style,*label_x,*label_y,x,y,*n );
}

//	*	*	*	Function "gnuplot_plot_slope" Package "gnuplot"		*	*	*
void Rgnuplot_plot_slope( gnuplot_ctrl  **handle, double *a, double *b, char  **title )
{
gnuplot_plot_slope( *handle,*a,*b,*title );
}

//	*	*	*	Function "gnuplot_plot_equation" Package "gnuplot"		*	*	*
void Rgnuplot_plot_equation( gnuplot_ctrl  **h, char  **equation, char  **title )
{
gnuplot_plot_equation( *h,*equation,*title );
}

//	*	*	*	Function "gnuplot_write_x_csv" Package "gnuplot"		*	*	*
void Rgnuplot_write_x_csv( char const  **fileName, double const  *d, int *n, char const  **title,int *rtrnvalue )
{
*rtrnvalue=gnuplot_write_x_csv( *fileName,d,*n,*title );
}

//	*	*	*	Function "gnuplot_write_xy_csv" Package "gnuplot"		*	*	*
void Rgnuplot_write_xy_csv( char const  **fileName, double const  *x, double const  *y, int *n, char const  **title,int *rtrnvalue )
{
*rtrnvalue=gnuplot_write_xy_csv( *fileName,x,y,*n,*title );
}

//	*	*	*	Function "gnuplot_write_multi_csv" Package "gnuplot"		*	*	*
void Rgnuplot_write_multi_csv( char const  **fileName, double const * **xListPtr, int *n, int *numColumns, char const  **title,int *rtrnvalue )
{
*rtrnvalue=gnuplot_write_multi_csv( *fileName,*xListPtr,*n,*numColumns,*title );
}

