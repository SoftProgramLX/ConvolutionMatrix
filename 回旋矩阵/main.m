//
//  main.m
//  回旋矩阵
//
//  Created by apple on 15/3/25.
//  Copyright (c) 2015年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#if 0
        
        int n, max, num = 1, a[1000][1000];
        
        printf("请输入矩阵行数\n");
        scanf("%d", &n);
        printf("请输入矩阵中最大数\n");
        scanf("%d", &max);
        
        int maxNum = max < n*n ? max: n*n;
        
        for (int i = 0; i <= n/2 && num <= maxNum; i++) {//控制最多转n/2圈
            for (int j = 0; j < 4; j++) {//控制没圈转弯四次，且得到转弯的方向
                for (int k = i; (k < n-i-1 || i == k) && num <= maxNum; k++, num++) {//控制每条线的数逐渐加一
                    switch (j) {
                        case 0: a[i][k] = num; break;
                        case 1: a[k][n-i-1] = num; break;
                        case 2: a[n-i-1][n-k-1] = num; break;
                        case 3: a[n-k-1][i] = num; break;
                            
                        default: break;
                    }
                }  
            }
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                printf("%3d", a[i][j]);
            }
            printf("\n");
        }
    
    
#else
    
        int num, max;
        int a[1000][1000] = {0};
        printf("请输入矩阵行数\n");
        scanf("%d", &num);
        printf("请输入矩阵中最大数\n");
        scanf("%d", &max);
        
        a[0][0] = 1;
        int m = 0, n = 0;
        
        /*  用m代表数组行，n代表列；
         由于逆时针循环旋转，所以有这样的规律 右>下>左>上>右>下>左>上>右>下 进行循环加数；
         二维数组全部初始化为零，那么只要右边一位数为零，值就加一，否则只要下边一位数为零就加一，从而得到下面的 if else 循环
         */
        for (int i = 2; i <= max && i <= num*num; i++) {
            
            if (a[m-1][n] == 0 && m > 0) {
                if (a[m][n-1] == 0 && n > 0) {
                    n--;
                } else {
                    m--;
                }
            } else if (a[m][n+1] == 0  && n+1 < num) {
                n++;
            } else if (a[m+1][n] == 0 && m+1 < num) {
                m++;
            } else if (a[m][n-1] == 0 && n > 0) {
                n--;
            }
            
            a[m][n] = i;
        }
        
        for (int i = 0; i < num; i++) {
            for (int j = 0; j < num; j++) {
                printf("%3d", a[i][j]);
            }
            printf("\n");
        }
        
#endif
       
        
    }
    return 0;
}



