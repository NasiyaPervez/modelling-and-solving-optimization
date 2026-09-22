# Modelling and Solving Optimization (AMPL + Gurobi tutorials)

**Short description:** A structured collection of textbook-style exercises in
mathematical programming — AMPL models for LPs, blending, flow, knapsack,
scheduling, Sudoku, MST and TSP, plus three worked Gurobi/Python tutorial
notebooks from the OVGU optimization course.

## What this is

Coursework for *Modelling and Solving Optimization Problems* (OVGU Magdeburg):
deliberately-concise AMPL models, one exercise per file, each annotated with the
task it solves. Solve them with any AMPL backend (Gurobi, HiGHS, CPLEX…). The
notebooks in `gurobi-tutorials/` are the same course's Gurobi Python tutorials.

## AMPL models (`ampl/`)

| File | Solves |
|---|---|
| `AMPL-E1.mod`, `userguide1.mod` | First 2-variable LP in AMPL (from the user guide) |
| `Sheet1P3.mod` | Problem 1.3 — small 2-variable LP |
| `Sheet1P4.mod` | Problem 1.4 — three linear equations, 3 unknowns |
| `Sheet2P2.mod` | Bakery shift scheduling (8-hour shifts) |
| `Sheet3P1-primal.mod` / `Sheet3P1-dual.mod` | Primal LP + its dual pair |
| `Sheet3P2-blending.mod` | Gasoline blending (lecture example) |
| `Sheet3P3-blending.dat` | Data for a blending problem (implicit set tables) |
| `OilFlow.mod` / `OilFlow.dat` | Max-flow over an oil pipeline network (fields, refineries, depots) |
| `MaxFlow1.mod` | Max-flow mini model |
| `MST-iterative.mod` / `.dat` | Minimum spanning tree, iterative formulation |
| `diet.mod` / `diet.dat` | Classic diet LP with nutrition requirements |
| `knapsack.mod` / `knapsack.dat` | Knapsack problem (Exercise 5.4, parts 1–2) |
| `scheduling.mod`, `scheduling1.dat`, `scheduling2.dat` | Job scheduling with processing times (uses HiGHS) |
| `sudoku-all.mod` / `sudoku_zeit_2.dat` | Sudoku as a constraint program + an instance |
| `tsp-template.mod` / `tsp.dat` | Travelling salesman (ordered sets, symmetric cost) |
| `brewtiful.dat` | Data for Exercise 6.3, "Brewtiful Brewing" |

## Gurobi tutorials (`gurobi-tutorials/`)

Worked Python/Gurobi models from the course examples:

| Notebook | Content |
|---|---|
| `SimpleExercise.ipynb` | Example 2 — leisure-activities LP: maximize a linear objective |
| `OperativePPPSets.ipynb` | Example 3 — using index *sets* to write clean models (max over sums) |
| `Wedding.ipynb` | Example 5 — Wedding extended, full 3D-index MILP |

Each notebook states the mathematical model in LaTeX before the code.

## Running

For the AMPL files, open any `.mod` (plus its `.dat`, where present) in AMPL:

```ampl
model ampl/knapsack.mod;
data ampl/knapsack.dat;
option solver gurobi;     # or highs / cplex
solve;
display x;
```

For the notebooks:

```bash
pip install gurobipy
jupyter nbconvert --execute gurobi-tutorials/Wedding.ipynb
```

Some models call for a specific solver (e.g. `scheduling.mod` sets `solver
highs`). Gurobi and HiGHS both offer free academic licences.

## License & attribution

MIT — see [LICENSE](LICENSE). These are the author's working copies of the
university course exercises; problem statements belong to the course materials.