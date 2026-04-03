# Bus-Level Inertia Estimation

This project presents an event-based framework for estimating bus-level inertia in power systems using MATLAB.

---

## Methodology
- Apply disturbance (load change)
- Measure frequency response at each bus
- Compute RoCoF (df/dt)
- Estimate inertia using swing equation
- Apply RoCoF threshold filtering
- Identify weak buses (inertia deficit)
- Allocate virtual inertia using optimization

---

## Files Description
- `frequencyandRoCof.m` → RoCoF calculation  
- `finalinertia.m` → inertia estimation  
- `greedyallocation.m` → virtual inertia allocation  
- `simkkl.m` → simulation setup  
- `.fig files` → result plots  

---

## Simulation Setup
- MATLAB-based analysis  
- Event: load disturbance  

---

## Key Contribution
- Bus-level inertia estimation without explicit Y-bus modeling  
- Event-based inertia estimation framework  
- Practical virtual inertia allocation strategy  

---

## Modeling Note
This work currently uses MATLAB-based analysis.  
A simplified RMS-level multi-machine network model will be implemented in Simulink as future work.

---

## Future Work
- RMS-level Simulink modeling  
- Dynamic validation of virtual inertia control  

---

## Author
**Md. Shakil**  
Power System Laboratory
University of Fukui
