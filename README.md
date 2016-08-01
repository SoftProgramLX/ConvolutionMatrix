# ConvolutionMatrix
###C实现回旋矩阵

关键代码不超过十行，如下
```C
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
```

-----

<br>
效果图如下：<br>
![image1](https://github.com/SoftProgramLX/ConvolutionMatrix/blob/master/回旋矩阵/screen1.png)    ![image2](https://github.com/SoftProgramLX/ConvolutionMatrix/blob/master/回旋矩阵/screen2.png)
