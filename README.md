# TFE4152 - Project: Four pixel digital camera 
In the course TFE4152, Design of integrated circuits, we have been tasked to design a four pixel digital camera in a 2x2 matrix.
In this project we are designing and implementing the analog and digital control blocks for the digital camera. This includes the *Readout and control* and *Pixel electronics* blocks in the diagram given below. There are other specifications such as Expose_increase and Expose_decrease that has certain requirements that we're not going to discuss here.

![Blockdiagram](https://github.com/HunkyMcHunkin/TFE4152/blob/main/blokkdiagram.png)

To design this we have designed the *Readout and control* in SystemVerilog, implemented the *Pixel electronics* in AimSpice, and achieved the desired behaviour overall. Here we're only including the HDL part. The two figures below shows the three modules we're designing, and the timing diagram with the desired behaviour. Testbench for every module as well as for top are written to verify that it works. Under these two figures the waveform from our design is pictured. 

<img src="https://github.com/HunkyMcHunkin/TFE4152/blob/main/timingdiagram.png" width=40%><img src="https://github.com/HunkyMcHunkin/TFE4152/blob/main/timingdiagram_desired.png" width=60%>

<img src="https://github.com/HunkyMcHunkin/TFE4152/blob/main/mydiagram.png" width=100%>
