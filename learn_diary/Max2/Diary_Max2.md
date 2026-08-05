# 二选一多路器学习日志

# 原理
![alt text](image-4.png)

1、芯片命名规则
![FPGA_name_rules](image.png)
2、芯片选取(新建项目过程中芯片选择，筛选)
![FPGA_choose](image-1.png)
3、调试软件选择
![alt text](image-2.png)
4、新建verilog文件
![alt text](image-3.png)
5、文件开始和结束

module Max2             

endmodule  

6、代码做完后  按CTRL+K  进行编译，可在里面检查代码报错等消息
![alt text](image-5.png)

# 仿真测试

快捷键  CTRL+N   打开新建文件界面  

新建测试文件，文件名和上面一样，但上面加上解释性后缀_tb   Max2_tb       (testbench)
`timescale 1ns/1ns          //必须有  表示延时的单位/精度
module Max2_tb();

	reg s0;
	reg s1;
	reg s2;

	wire mux2_out;

Max2 Max2(                      //例化一个Max2 出来，可以多个例化
	.a(s0),
	.b(s1),
	.sel(s2),
	.out(mux2_out)
);

	initial begin
		s2 = 0;s1 = 0;s2 = 0;
		#20;	                                //表示20个1ns，（20个精度）
		s2 = 0;s1 = 0;s2 = 1;
		#20;	                                //仿真时将时间推迟20ns 不能当成通用语句，
                                                //更不能当作延时方法使用  仅能用作仿真  
		s2 = 0;s1 = 1;s2 = 0;
		#20;	
		s2 = 0;s1 = 1;s2 = 1;
		#20;	
		s2 = 1;s1 = 0;s2 = 0;
		#20;	
		s2 = 1;s1 = 0;s2 = 1;
		#20;	
		s2 = 1;s1 = 1;s2 = 0;
		#20;	
		s2 = 1;s1 = 1;s2 = 1;
		#20;	
	
	end


endmodule

以上是标准式仿真开头

有时会遇到
`timescale 1ns/1ps   这种的，表示时间精度为1ps，，，此时下面的 #20  可以写成  #20.1或者#20.001这种也没有问题  这种一般在延时精度高的场合使用

7、进行仿真添加
![alt text](image-6.png)
![alt text](image-7.png)
![alt text](image-8.png)
![alt text](image-9.png)
![alt text](image-10.png)
![alt text](image-11.png)

可能安装过程并没有装simlation   https://www.altera.com/downloads/simulation-tools/modelsim-fpgas-standard-edition-software-version-18-0?utm_source=chatgpt.com这是官网下载地址，选择Windows。

安装好之后在quartus中进行配置
![alt text](image-12.png)
选择sim的安装路劲
![alt text](image-13.png)
回到quartus中选择进行RLT仿真
![alt text](image-14.png)
会进入到sim的软件中，关闭不必要的显示
点击这个全局放大器，（黑色的放大镜）会的到类似时序图，该图和上面的仿真编程的时间控制一致
该输出也是按照设计的规则来运行的
![alt text](image-15.png)
按下左下角按键能隐藏多余的路劲名称，防止干扰判断
![alt text](image-16.png)
若名称不一致影响判断，可双击进行修改
![alt text](image-17.png)


# 芯片选脚部分

按下如图按键或者快捷键  CTRL+shift+N   也可打开
![alt text](image-18.png)
选择芯片引脚和引脚供电      （供电部分根据硬件结构来选择）
![alt text](image-19.png)
其他未使用引脚状态默认设置
![alt text](image-20.png)
![alt text](image-21.png)
![alt text](image-22.png)
这里需要很注意，我们一般就选择第一项
![alt text](image-23.png)
![alt text](image-24.png)

# 芯片烧录
![alt text](image-25.png)
一般都是这个路径
![alt text](image-26.png)