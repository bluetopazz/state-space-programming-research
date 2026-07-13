# Methods and Evidence

## Unit of analysis

SSPM studies fixed-width, batched numerical transitions. A transition family defines the meaning of a row, the names and units of state fields, admissible input structure, update ordering, coupling semantics, numerical bounds, dtype, and an executable reference.

The current implementation uses schema fingerprints and sampled numerical comparisons. Metadata alone does not prove functional identity, and the present runtime does not yet enforce every declared field bound or kind. Public claims therefore distinguish structural identity from empirical semantic agreement.

## Evidence sequence

1. **Declare the family.** Freeze the schema, reference transition, update convention, and measurement boundary.
2. **Admit a backend.** Require matching family identity and compare its output against the reference over sampled cases.
3. **Check trajectories.** Repeat the transition to expose accumulated drift that may be invisible after one step.
4. **Measure phases.** Separate preparation, transfer, resident execution, return, and end-to-end latency where the backend permits it.
5. **Evaluate selection.** Split complete workload configurations before fitting and report regret against the observed fastest eligible backend.

## Transition families

| Family | Role | Evidence boundary |
|---|---|---|
| Synthetic business transition | Exercises ordered dependencies, thresholds, projections, and updated intermediates | Semantic and execution stressor only |
| Synthetic thermal-control transition | Adds a different nonlinear state shape and control pattern | Not a calibrated physical model |
| Hodgkin-Huxley 1952 transition | Tests portability to a literature-grounded nonlinear system | Backend agreement and step refinement, not biological validation |

## Crossover experiment

The frozen experiment contains 28 complete configurations varying row count, state width, horizon, host or resident input state, active-mask density, and graph degree. A stable hash assigns 22 configurations to calibration and six to held-out evaluation. NumPy CPU, fused Numba CPU, Torch CPU, and MPS execution modes are compared where eligible.

The experiment preregistered two distinct gates:

- **Crossover gate:** at least two execution modes must become observed winners.
- **Planner primary gate:** planner median regret must be strictly lower than the best fixed eligible policy.

The crossover gate passes with four observed winner modes. The planner selects all six held-out winners, but the primary gate does not pass because planner and fixed MPS median regret both equal zero. Tail regret favors the planner, but it remains a secondary result.

## Mutation sensitivity

The public result covers 48 structured perturbations across coefficient, dependency, sign, omission, threshold, ordering, and projection categories. Directed test cases detect all 48.

Most operators perturb the result of a known reference transition at declared semantic sites. They are therefore evidence that the sampled test domain notices these output-level faults. They are not automatically generated source or compiler mutations, and the result must not be interpreted as proof that arbitrary lowering defects will be detected.

## Scientific-family check

The Hodgkin-Huxley family uses canonical squid giant-axon conductances and a forward-Euler step. NumPy, fused Numba, Torch CPU, and Torch MPS agree within declared one-step and 500-step tolerances. A half-step comparison supplies a limited numerical-refinement diagnostic.

This establishes cross-backend agreement for the chosen discretization. It does not establish biological accuracy, solver optimality, or stability for arbitrary stimuli and horizons.

## Hardware boundary

All published performance observations come from one Apple M1 Pro environment. MPS, NumPy, Numba, and Torch results are local measurements. CUDA, Triton, x86, energy, memory counters, and multi-node execution are not measured in this archive.

