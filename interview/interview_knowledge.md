## 时序约束
set_master_clock--主时钟  
set_clock_latency---大概估值  
set_clock_transition---报错，加buffer    
set_clock_uncertainty---uncertain=skew + jitter 对clock的uncertainty补偿  
set_input_delay -max ---setup time余量  
set_input_delay -min ---hold time 余量  
set_output_delay -max ---setup time + pcb delay (70%-80%clk≈setup_tiime) 
set_output_delay -min ---data_pcb_delay - clk_pcb_delay - hold time  (≈-holdtime) 
