# library setting
Target library是你想要构建的内容。它可以是共享库、静态库或可执行文件   
Link library是你的目标库或可执行文件所依赖的内容。它们包含目标需要正确运行的已编译代码  

# 时序约束
set_master_clock--主时钟  
set_clock_latency---大概估值  latency + transition < hold time
set_clock_transition---报错，加buffer    
set_clock_uncertainty---uncertain=skew + jitter 对clock的uncertainty补偿  
set_input_delay -max ---setup time余量  //report 
set_input_delay -min ---hold time 余量  //report  
set_output_delay -max ---setup time + pcb delay (70%-80%clk≈setup_tiime)  
set_output_delay -min ---data_pcb_delay - clk_pcb_delay - hold time  (≈-holdtime)  

report_timing  
report_area  
report_power  
report_qor  

# 关键路径
整个设计中的最长组合逻辑延迟，它决定了工作频率，也是优化的目标  

# 优化频率
①Register balancing 寄存器平衡, 将逻辑从管道的一个阶段移动到另一阶段  
②Removing Hierarchy消除层次结构 合并module  
③选择高级功能模块的高速实现

