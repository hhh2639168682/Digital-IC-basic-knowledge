# library setting
set .lib, set .db
Target library是你想要构建的内容。它可以是共享库、静态库或可执行文件   
Link library是你的目标库或可执行文件所依赖的内容。它们包含目标需要正确运行的已编译代码  

# 关键路径
整个设计中的最长组合逻辑延迟，它决定了工作频率，也是优化的目标  

# 优化频率
RTL:流水线设计，插入寄存器破坏最长路径  

gate_level:  
①Register balancing 寄存器平衡, 将逻辑从管道的一个阶段移动到另一阶段  
②Removing Hierarchy消除层次结构 合并module  
③选择高级功能模块的高速实现

# 时序约束
set_master_clock--主时钟  
set_clock_latency---大概估值  latency + transition < hold time
set_clock_transition---报错，加buffer    
set_clock_uncertainty---uncertain=skew + jitter 对clock的uncertainty补偿  
set_input_delay -max ---setup time余量  //report 
set_input_delay -min ---hold time 余量  //report  
set_output_delay -max ---setup time + pcb delay (70%-80%clk≈setup_tiime)  
set_output_delay -min ---data_pcb_delay - clk_pcb_delay - hold time  (≈-holdtime)  

report_timing  report_area  report_power————report_qor  

最小时钟约束：T2 + Tclk >= TDQ + Tcomb + Tsetup +  T1

竞争约束：T1 + TDQ + Tcomb >= Thold +T2

# setup time、hold time
setup time：触发器在时钟上升沿到来之前，其数据输入端数据保持不变的最小时间。

hold time：触发器在时钟上升沿到来之后，其数据输入端必须保持不变的最小时间。

setup time violation:
fix本质是增大setup time
Tsetup = T2 + Tclk - T1 - TDQ - Tcomb  
(1)降低时钟频率，增大时钟周期--↑Tclk
(2)在时钟路径上加buffer--↑T2  
(3)用延迟更小的触发器--↓TDQ  
(4)组合逻辑优化或插入流水线，缩短关键路径--↓Tcomb

hold time violation:
fix本质是让数据更晚到来  
 Thold >= T1 + TDQ + Tcomb - T2
(1)在数据路径上插buffer--↑Tcomb（fix hold time）
(2)换有更大器件延迟的触发器--↑TDQ
(3)优化时钟路径，让时钟来的更早
