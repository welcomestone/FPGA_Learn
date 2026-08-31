# D触发器（寄存器学习）

# 1、原理 
 在之前学习得二选一多路器与38译码器是属于组合电路逻辑，
 ![alt text](image.png)

 而现在学习的D触发器属于时序逻辑  具有储存得功能
 ![alt text](image-1.png)
 D端口为输入端口，Q端口为输出端口，CK端口为时钟端口  
 ![alt text](image-2.png)
 ![alt text](image-3.png)

 # 2、Verilog 实现 LED灯按频率闪烁  
 Reset_n ：低电平有效的复位
 ![alt text](image-4.png)
 新建项目文件
 ![alt text](image-5.png)
 ![alt text](image-6.png)
 ![alt text](image-7.png)
 开始代码编写
 频率解释
 ![alt text](image-8.png)
 换算：
 已知晶振为50MHz 那一个周期的时长为
  1000 000 000 / 50 000 000 = 20 ns(纳秒)

 那现在需要计时500ms的周期是多少个呢？
 ![alt text](image-9.png)
 500 000 000 /20 = 25 000 000 
 计算位宽 -- 25位
 ![alt text](image-10.png)
这是我写的代码，能找出里面有多少错误的地方吗？
![alt text](image-11.png)
是的，短短几句代码，就有如此多的错误
![alt text](image-12.png)
这是纠正过得
![alt text](image-13.png)

# 打开逻辑图纸看一下
![alt text](image-14.png)
![alt text](image-15.png)


# 3、仿真文件的编写，  *.tb
这里注意去反和取非得关系   ~ 和 ！的关系  ，对于单比特数据来说，他们没有区别，但是对于多比特来说相差甚远，至于原因，忘了的话建议自己查一下
![alt text](image-16.png)
仿真结果  这里可以使用光标来查看具体的时间单位
![alt text](image-17.png)
设置时间单位 对着底下的20ns 右键菜单
![alt text](image-18.png)

结果
![alt text](image-19.png)

# 4、板载测试
