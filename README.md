# Non-Holonomic_VO

### Constraints Used:

- vmax = 1.5
- vmin = 0.2
- wmax = 1.0
- agent_rad = 1
- obst_rad = 0.5
- time_sample = 0.1
- sensor_range = 9

### Tests performed:

- Obstacle and agent velocity in same direction as that of desired velocity.
- Obstacle larger than agent
- Agent larger than obstacle
- Obstacle faster than agent
- Agent faster than obstacle
- No obstacle
- Obstacle and agent on a direct collision path.

### Optimizer:

`fmincon` with linearised VO constraints using Mathematica. 
