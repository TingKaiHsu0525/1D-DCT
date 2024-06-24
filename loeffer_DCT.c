#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define N 8
#define PI 3.141592654
#define PT 1.414213562
//double ONE_DCT(double *v,int j,double a,double b,double c,double d,double e,double f);

double ONE_DCT(double *v,int j,double a,double b,double c,  //v is the row address
    double d,double e,double f,double PTt)
{
    
	double vp0,vp1,vp2,vp3,vn0,vn1,vn2,vn3;
    vp0=v[0]+v[7];
	vp1=v[1]+v[6];
	vp2=v[2]+v[5];
	vp3=v[3]+v[4];
	vn0=v[0]-v[7];
	vn1=v[1]-v[6];
	vn2=v[2]-v[5];
	vn3=v[3]-v[4];
    if (j==0)
        return (vp0 + vp1 + vp2 + vp3);
    else if (j==4)
        return (vp0 - vp1 - vp2 + vp3);
    else if (j==2)
        return (vp1-vp2)*a + (vp0-vp3)*b;
    else if (j==6)
        return (vp2-vp1)*b+ (vp0-vp3)*a;
    else if (j==7)
        return ((((-vn3)*d+vn0*c)+(vn2*e+vn1*f))-((vn3*c+vn0*d) + ((-vn2)*f+vn1*e)));
    else if (j==3)
        return (PTt*(((-vn3)*d+vn0*c)-(vn2*e+vn1*f))); 
    else if (j==5)
        return (PTt*((vn3*c+vn0*d)-((-vn2)*f+vn1*e)));   
    else if (j==1)
	  return	((((-vn3)*d+vn0*c)+(vn2*e+vn1*f))+((vn3*c+vn0*d) + ((-vn2)*f+vn1*e)));
         
	
}

              
int main(void)
{
	
	double input[N][N]={{137, 81, 137, 157, 10 ,0, 0 ,10},{200, 166, 176, 200, 81 ,10, 10, 81 },
	{156, 166 ,176, 181 ,137, 147 ,110 ,120 },{147 ,152, 156, 161, 137 ,141, 151, 137 },
	{166 ,156, 151 ,149 ,139 ,139 ,137 ,166},{142 ,137 ,117 ,137, 147, 137 ,139, 139},
	{137 ,132 ,137, 166 ,137 ,137, 127, 137},{166 ,137 ,166 ,166, 156 ,137 ,137, 127 }};	
    double temp2 [N][N];
	double output [N][N];
	double temp1 [N][N];
    int i;
    int j;
    
    double a=PT*cos((6*PI)/16.0);
    double b=PT*sin((6*PI)/16.0);
    double c=cos(PI*3/16.0);
    double d=sin(PI*3/16.0);
    double e=cos(PI/16.0);
    double f=sin(PI/16.0);
    
 for(i=0;i<8;i++)
 {
	 for(j=0;j<N;j++)
	 {
		 temp1 [i][j]=input[i][j];
	 }
 }

//做第一次轉換
for(i=0;i<N;i++)
    {
	    for(j=0;j<N;j++)
	    {
		    
		    temp2 [j][i]=ONE_DCT(&temp1[i][0],j,a,b,c,d,e,f,PT);
		}
	}
//列硬1d結果

printf("1D DCT \n");


for(i=0;i<N;i++)
	{
	    for(j=0;j<N;j++)
	    {
	        printf("%12f",((temp2[i][j])));//1d 差 2根號2分之一
			//倍2次差八倍電路移動3格程式用捕的

        }
		printf("\n");
    } 

printf("2D DCT \n");

//做第二次轉換
for(i=0;i<N;i++)
    {
	    for(j=0;j<N;j++)
	    {
		    
		    output[j][i]=ONE_DCT(&temp2 [i][0],j,a,b,c,d,e,f,PT);
		}
	}
//列印轉換結果
 for(i=0;i<N;i++)
	{
	    for(j=0;j<N;j++)
	    {
	        printf("%12f",((output[i][j])));
        }
		printf("\n");
    }    
 


}
