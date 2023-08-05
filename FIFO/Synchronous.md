#  Multi-bit data stream transmission across clock domains
#  FIFO can be devided to Synchronous fifo and asynchronous fifo

Synchronous FIFO: The read and write clocks are the same clock, and the clock edge reads and writes at the same time. All internal logic is synchronous logic, which is often used for interactive data buffering

Asynchronous FIFO: read and write clocks are different and independent of each other
