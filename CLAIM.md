# Canonical Claim

## Base claim

SSPM studies whether bounded, side-effect-free dynamical systems can be encoded
as typed resident state matrices with explicit affine operators and ordered
nonlinear residuals, so interventions and scenario batches can reuse system
structure rather than reconstructing objects, events, or solver-specific state.

The representation is:

~~~math
L_t = S_t A^T + U_t B^T + b,
\qquad
S_{t+1} = P_M\left(L_t + H_{ordered}(S_t,U_t,L_t,G_t)\right).
~~~

Rows may represent entities or independent counterfactual scenarios. Columns
are named state fields. A, B, and b expose reusable affine dependencies.
H-ordered preserves nonlinear expressions, branches, updated-state reads,
masks, and graph reductions. P-M applies declared projections and mode logic.

## Why residence matters

Traditional implementations may rebuild objects, event records, dependency
structures, or device buffers for each intervention. SSPM instead keeps state
and operators resident. A target state, control, capacity, constraint, or
operator can change in place, after which the shared transition propagates its
effect across the modeled system or a stacked batch of alternatives.

This can improve:

- batched counterfactual and intervention analysis;
- model-predictive control and candidate-policy evaluation;
- exact composition, controllability, and reachability for affine systems;
- branch-aware or local analysis for residual systems;
- inspectability of state dependencies and approximation boundaries.

## What is not claimed

- Arbitrary nonlinear systems are not asserted to be globally linear.
- An unrestricted residual is not evidence of a useful decomposition.
- Matrix representation alone does not guarantee a faster numerical kernel.
- Differential testing is empirical evidence, not formal equivalence proof.
- Formal control and reachability claims do not extend beyond the mathematics
  supported by each workload.

## Current disposition

Completed experiments support semantic preservation, direct intervention APIs,
and large gains over reconstruction-heavy baselines at scale. They also show
that manual vectorization and fused execution remain faster for residual-heavy
transitions. The present claim is therefore a bounded representation and
manipulation claim, with runtime advantage conditional on the baseline and the
amount of reusable affine structure.
