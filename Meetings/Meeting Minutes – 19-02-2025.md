# Meeting Minutes – 19/02/2025

## In attendance
Sam, Max, Atticus, Iestyn, Blossom

## Action Points
- [ ] Coding Initial Conditions and Random Positions
- [ ] Simulation Step Function
- [ ] Checking for a Wall Collision
- [ ] Function for Calculating a Wall Collision
- [ ] Checking for a Ball-to-Ball Collision
- [ ] Function for Calculating a Ball Collision
- [ ] Overleaf Report Basic Formatting

## Preliminary Actions
- Setting up a GitHub
- **Group Name:** Modelling Innit
- **Finish by:** 20th March

## Getting Started
- Naive function `SimulationStep` that:
  - **Inputs:** timestep, position, velocity, ball properties, box properties, (gravity)
  - **For each particle (N):**
    - Checks how close it is to a wall, and calculates wall collision velocity
    - Checks how close it is to each other particle (N) (except itself), and calculates particle collision velocity
  - **Outputs:** new position, new velocity
- **Current Plan:** Just the barebones of the `SimulationStep` function, i.e. Initial Conditions, for loops and general vibe.
- Starting on the formatting of the Overleaf Project

## Overleaf Conventions
- Capitalise phrases with a name, e.g., Forward Euler, Verlet, Newtonian
- Use "time step" instead of other variations
- Group consensus needed on any disputes or ambiguity
