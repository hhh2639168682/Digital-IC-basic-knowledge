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
**setup time** 触发器在时钟上升沿到来之前，其数据输入端数据保持不变的最小时间。

**hold time** 触发器在时钟上升沿到来之后，其数据输入端必须保持不变的最小时间。

**setup time violation:**

fix本质是增大setup time  
**Tsetup = T2 + Tclk - T1 - TDQ - Tcomb**  
(1)降低时钟频率，增大时钟周期--↑Tclk  
(2)在时钟路径上加buffer--↑T2    
(3)用延迟更小的触发器--↓TDQ    
(4)组合逻辑优化或插入流水线，缩短关键路径--↓Tcomb  

**hold time violation:**

fix本质是让数据更晚到来  
**Thold = T1 + TDQ + Tcomb - T2**  
(1)在数据路径上插buffer--↑Tcomb（fix hold time)  
(2)换有更大器件延迟的触发器--↑TDQ  
(3)优化时钟路径，让时钟来的更早  

# library setting
set .lib, set .db
Target library(工艺库)是综合后电路网表最终要映射的库。由fab提供，一般是.db，可以由文本格式的.lib转换过来   
Link library，设置模块或者单元电路的引用，所有dc可能用到的库，都需要link，包括用到基础单元库，还包括一些ip库，rom，pad，pll，memeory。
symbol library，定义了电路现实的schematic库， .sdb文件
synthetic library，初始化dc时，设置designware库，综合库包含高级通用组件，例如加法器、乘法器。

# 关键路径
整个设计中的最长组合逻辑延迟，它决定了工作频率，也是优化的目标  

# 提高频率，降低时钟周期
RTL:流水线设计，插入寄存器破坏最长路径  
优化逻辑路径:更高效的算法或逻辑结构  
平衡多路复用器的大小: 避免使用非常大的多路复用器

gate_level:  
①Register balancing 寄存器平衡, 将逻辑从管道的一个阶段移动到另一阶段  
②Removing Hierarchy消除层次结构 合并module  
③选择高级功能模块的高速实现
# 同步复位
优点:百分百同步,可以过滤毛刺.

缺点:复位信号必须大于clk, 还要考虑skew, Tcomb, TDQ, reset delay, 需要较多的logic resource.
# 异步复位
优点:异步复位信号识别方便，而且可以很方便的使用全局复位。由于大多数的厂 商目标库内的触发器都有异步复位端口，可以节约逻辑资源。  

缺点:复位信号容易受到毛刺的影响。复位结束时刻恰在亚稳态窗口内时，无法决定现在的复位状态是 1 还是 0，会导致亚稳态。    
# 异步复位同步释放
rst_async_n=0时，rst_sync_n会被立即复位为0，输出到后续电路用于异步复位；  

rst_async_n=1时，假设此时恰好在时钟沿附近，会造成recovery或者removal的违例，但经过DFF1和DFF2的两级同步，rst_sync_n释放沿与时钟沿同步，送入到后续电路不会再有recovery和removal违例出现。  


# ASIC低功耗设计
# 系统级

**多电压设计 (Multi-Vt Design)**

为不同的设计模块选择不同的阈值电压。关键路径使用低Vt（低阈值电压）单元，非关键路径使用高Vt单元。

**动态电压和频率调整 (Dynamic Voltage and Frequency Scaling, DVFS)**

根据工作负载动态调整电压和频率。当负载较低时，降低电压和频率可以节省功耗。

# RTL级
**门控时钟 (Clock Gating)**

当某个模块不需要工作时，关闭其时钟以节省动态功耗。

**并行与流水线设计**

**资源共享与状态编码**
共用alu；减少状态机的位切换，减少状态位数

**操作数隔离**

# 门级
**电源门控 (Power Gating)**

在不活动时，通过添加电源开关（通常是高阈值的MOSFET）断开模块的电源，以消除静态功耗。

**动态功耗，静态功耗优化**
插入buffer，相位分配。

**多阈值电压设计 (Multi-Vt Design)**

