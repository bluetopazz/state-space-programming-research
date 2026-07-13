# SSPM V3 Preregistration: Matrix-Executable System Representation

**Status:** frozen research plan before V3 implementation or timing  
**Archive date:** July 12, 2026  
**Planned report:** *Matrix-Executable System Semantics for Batched Control and Analysis*

> **Archival disposition, July 13, 2026.** This document preserves the original
> pre-experiment hypotheses and wording. The experiments are now complete. They
> support a bounded resident-state representation and intervention claim, not
> arbitrary-system linearization or universal kernel speed. See
> [the canonical claim](../CLAIM.md), [completed evidence](../METHODS_AND_EVIDENCE.md),
> and [claim ledger](../EVIDENCE_LEDGER.md) for the current disposition.

## 1. Research position

SSPM V3 proposes that arbitrary system updates can be modeled as transformations over a resident state matrix, with irreducible nonlinear and ordered behavior isolated explicitly. For state matrix $S_t$, controls $U_t$, affine operators $A$ and $B$, bias $b$, and ordered residual program $H_{\mathrm{ordered}}$:

$$
L_t=S_tA^\top+U_tB^\top+b,
$$

$$
S_{t+1}=P_{\mathcal M}\left(L_t+H_{\mathrm{ordered}}(S_t,U_t,L_t)\right).
$$

$P_{\mathcal M}$ applies declared projection and mode logic. System state remains resident in matrix form across repeated updates and scenario batches. An intervention changes a target state variable, control, parameter, constraint, or operator entry; the shared transformation then propagates its effects through the rest of the modeled system.

The proposal is linear-primary rather than globally linear. With an unrestricted residual, arbitrary representability is trivial. The empirical claim is stronger and falsifiable: useful systems must retain enough affine coverage that resident matrix manipulation is computationally and analytically preferable before residual evaluation, branching, or coupling dominates.

The flagship question is:

> Can arbitrary systems be represented as linear-primary transformations of resident state, with explicit residual closure, so that target interventions propagate more efficiently and dynamically than rebuilding traditional object or event models?

Execution speed and backend selection are supporting evidence. Control and analysis are the principal proposed benefits.

### 1.1 Primary hypotheses

- **H1 - semantic representation:** supported traditional updates can be extracted into affine operators plus ordered residual IR without changing one-step, trajectory, mode, or event semantics.
- **H2 - resident manipulation:** changing target states, controls, parameters, constraints, or operator entries can reuse resident state and shared transformations rather than reconstructing the system representation.
- **H3 - batched dynamism:** this reuse lowers setup and rollout cost as simultaneous interventions increase, while preserving objectives and constraints.
- **H4 - bounded generality:** benefit is predictable from affine coverage and residual burden; if modest nonlinearity removes the benefit, the generalized claim must narrow.

## 2. Representation contract

V3 will introduce an `AffineResidualProgram` with:

- typed state and input schemas;
- affine operators $A$, $B$, and $b$;
- ordered residual IR;
- declared projection;
- mode predicates;
- coupling semantics;
- source and transformation provenance.

A restricted source compiler will extract affine coefficients from traditional update functions. Unsupported nonlinear expressions, branches, updated-state reads, masks, and graph reductions will lower into the residual IR.

The compiler must reject hidden mutation, I/O, ambiguous aliasing, unbounded loops, and unsupported side effects. It must not silently approximate them.

## 3. Operator surface

The same representation will expose:

- `rollout(initial_state, controls, horizon)`;
- `compose(horizon)` for exact affine systems;
- `batch_interventions(states, control_candidates)`;
- `linearize(state, control)` for residual systems;
- `controllability()`;
- `reachable_set(initial_set, control_set, horizon)`;
- `mpc(initial_state, objective, constraints, horizon)`.

NumPy/GEMM, fused Numba, Torch, and C++ execution will be generated from the same program representation. MPS is the initial accelerator path. CUDA, Triton, CUDA Graphs, and dual-GPU execution may be added later without changing the frozen experiment manifest.

## 4. Workload ladder

### 4.1 Exact LTI system

Use a mass-spring-damper or double-integrator system. The family must permit exact affine composition, controllability analysis, condensed linear MPC, and exact low-dimensional reachable sets.

### 4.2 Piecewise-affine infrastructure system

Use a bounded queue and scheduler with identical exogenous traces and discrete-time boundaries across matrix and event-driven representations. Capacity, service, scheduling, projection, and mode transitions must remain explicit.

### 4.3 Nonlinear graph system

Use a controlled Kuramoto network. Linear or affine terms remain in the core; nonlinear sinusoidal coupling is isolated in the residual. Reachability claims for this family must remain empirical or locally linearized.

## 5. Experiment E1: representability and semantic preservation

Build a frozen corpus of LTI, queue/scheduler, and Kuramoto updates in object, scalar-loop, vectorized, and SSPM forms.

Measure:

- fraction extracted into affine terms;
- residual operation count and FLOP share;
- branch count;
- updated-state dependencies;
- graph reductions;
- unsupported constructs and rejection reason.

Differential-test one-step and trajectory behavior across every supported representation. Inject coefficient, dependency, ordering, threshold, projection, and mode mutations.

**Acceptance gate:** exact agreement for supported exact programs; tolerance-bounded agreement where numerical libraries require it; explicit rejection for unsupported programs; at least 80% detection in every non-equivalent mutation class.

## 6. Experiment E2: representation ablation

Compare:

- object-per-entity updates;
- scalar array loops;
- manual NumPy vectorization;
- equivalent discrete-event queue simulation;
- fused Numba;
- SSPM affine-plus-residual execution.

Use identical initial states, controls, event traces, horizons, precision, and materialization boundaries. Attribute gains separately to data layout, vectorization, GEMM, fusion, batching, and accelerator residency.

**Acceptance gate:** SSPM must beat object/scalar and equivalent discrete-event baselines by at least $2\times$ at 256 or more scenarios. Comparisons with vectorized and fused baselines remain empirical and are not required to pass.

## 7. Experiment E3: dynamic intervention

Keep system state resident as a matrix. Apply sparse or structured deltas to target state columns, control matrices, policy parameters, queue capacities, coupling strength, constraints, and initial-state cohorts without rewriting transition code.

Measure target-change setup latency, propagation latency, rollout latency, memory allocation, state reuse, and break-even scenario count. Compare rebuilding traditional objects or events against updating resident state or operators and executing batched candidate matrices.

Test 1, 32, 256, and 2,048 simultaneous interventions over horizons 10, 20, and 50.

## 8. Experiment E4: model-predictive control

- Use exact condensed linear MPC for the LTI family.
- Use mode-aware scenario MPC for the bounded queue.
- Use local-linear or shooting MPC for Kuramoto synchronization.

Compare objective value, constraint violations, solve time, rollout throughput, and policy agreement across representations.

**Acceptance gate:** identical candidate controls must produce equivalent objectives, and SSPM must introduce no additional constraint violations.

## 9. Experiment E5: reachability

- Compute exact affine reachable sets for the LTI family.
- Use branch-aware over-approximation for the queue family.
- Label Kuramoto results empirical or locally linearized, never formally exact.

Validate containment against exhaustive low-dimensional enumeration and Monte Carlo trajectories. Report set volume, conservatism, runtime, and scaling with horizon and scenario count.

## 10. Experiment E6: residual-burden frontier

Systematically increase:

- nonlinear residual density;
- branch entropy;
- graph coupling;
- updated-state dependencies.

Measure where affine batching remains useful and where fused custom execution becomes superior. Produce an execution/analysis phase diagram indexed by affine coverage and residual burden.

This is the principal falsification experiment. If benefits disappear at modest residual density, or if resident updates require reconstruction comparable to traditional models, the generalized representation claim must be narrowed.

## 11. Experiment E7: hardware extension

Run the frozen manifest on Apple CPU and MPS first. When the A6000 environment is available, add single-A6000 Torch CUDA, Triton, CUDA Graphs, and dual-A6000 execution.

Treat dual GPU as a separate topology with explicit partition, communication, and materialization costs. Report performance portability relative to the best implementation per platform, not isolated speedups.

## 12. Controls and retained artifacts

Retain:

- raw repetitions and seeds;
- source programs and checksums;
- extracted affine operators;
- residual IR;
- initial states, controls, event traces, and constraints;
- solver settings;
- compiler and library versions;
- hardware and topology manifests.

Matrix and traditional implementations must compute the same declared transition before performance, intervention, control, or reachability comparisons enter the evidence set.

Negative results must remain visible, including failed extraction, excessive residual burden, poor reachability bounds, constraint regressions, and control methods that gain no advantage.

## 13. Planned outputs

- machine-readable V3 evidence;
- representability and residual-burden tables;
- control and reachability figures;
- an execution/analysis phase diagram;
- the technical report *Matrix-Executable System Semantics for Batched Control and Analysis*.

## 14. Evidence separation

Existing SSPM runtime-selection results remain published as v1/v2 evidence. They become a secondary chapter of the broader methodology and do not satisfy any V3 acceptance gate.

No V3 empirical claim should be presented as supported until the corresponding frozen experiment and acceptance test have been executed.
