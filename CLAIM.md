# Canonical Claim

## Public claim

SSPM is a restricted state-transition runtime that shares resident state across
repeated local interventions, propagates complete declared dependency closures,
and falls back to full replay when locality disappears. Under its declared
semantics, incremental execution is from-scratch consistent; across multiple
application families, sparse closures often reduce CPU decision cost while
dense, cold, and materialization-heavy regimes do not.

## Transition model

For declared state `x`, input `u`, and transition `F`, a baseline rollout is:

~~~math
x_{t+1}=F(x_t,u_t), \qquad X^0=(x^0_0,\ldots,x^0_T).
~~~

An intervention edits a subset of state or controls. SSPM computes the
transitive affected set `C_t` from declared dependencies. Values outside the
closure are reused from the resident baseline; values inside it are recomputed
in transition order. If the closure becomes dense or a required output cannot
be reconstructed safely, the runtime executes the full transition.

## Conditional exactness

Incremental execution is equal to from-scratch replay when all of the following
conditions hold:

1. The declared state is sufficient for the transition.
2. Every read-after-write and cross-state dependency is represented.
3. The closure contains every value reachable from the edit over the requested
   horizon.
4. Reused baseline values were produced by the same transition semantics,
   parameters, and exogenous inputs.
5. The materialized output is reconstructed from recomputed and unaffected
   values without omission.

This is a conditional semantic statement, not a theorem about arbitrary hidden
state, side effects, or undeclared dependencies.

## Why state awareness matters

Repeated intervention workloads often differ in only a small portion of an
otherwise shared system. SSPM makes that relationship explicit: keep the
baseline state resident, edit the target, compute the complete affected region,
and reuse everything outside it. The runtime can therefore avoid recomputing
unaffected work while retaining a correctness-preserving full-replay path.

## What is not claimed

- SSPM does not model arbitrary systems as globally linear transformations.
- Resident state alone does not guarantee faster execution.
- Sparse results do not imply dense wins.
- The post-hoc V13 classifier is not an operational selector.
- Differential tests support bounded consistency; they are not universal
  formal verification.
- No CUDA/Triton, multi-GPU, energy, or production-service claim is made.
