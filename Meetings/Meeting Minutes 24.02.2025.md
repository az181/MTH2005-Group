# Meeting Minutes – 24/02/2025

## In Attendance
- Noah
- Ed
- Max
- Atticus
- Sam
- Joel
- Will
- Iestyn
- Blossom

## Random Point
- Jan showed us his code to divide the balls into boxes! Did anyone take any "inspiration" (photo or copying)?

## The Grid of Boxes
- **Subdivide the square into a 4x4 grid**
  - This will need to be proportional to the walls, as they move!
- **For each particle:**
  - Which box is it in?
  - Collisions with particles in the same box
  - Collisions with particles in the adjacent (including diagonals) boxes
- **Output:** Number of particles in each box; density calculation.
- **Optimise the number of boxes:** Balancing number of particles to number/size of boxes.
  - He had sqrt(nx) by sqrt(nx) boxes. (i.e., 2^p boxes in each direction)

## What Are We Actually Doing?
- **On the report:**
  - Explaining (broadly) what the functions do and how they work
  - Breakdown of the overall running procedure
  - **The experiments:**
    - What happens in the experiments
    - Quantitative data
    - Does this align with the expected theory? (wiki...)
    - Why does it or not? (Simplistic model is adequate or inadequate)
  - Adding in small code segments if it aids explanations
- **Reasonable length for our report:**
  - If saying something doesn’t add value, don’t add it.

## The Experiments
- **Temperature Fluctuations:**
  - How much does the temperature fluctuate?
  - Standard deviations
  - Plot fluctuation per number of particles (Logarithm?)
  - Law of Large Numbers?
- **Velocities:**
  - How are the velocities distributed among particles?
  - Use a histogram function
  - Slowly shrink box and report how distribution of velocities changes.
  - *"We so got this"
- **Gravity:**
  - Density/Distribution of particles

