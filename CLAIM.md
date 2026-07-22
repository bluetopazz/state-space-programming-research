# Canonical Claim

## Public claim

SSPM is a restricted state-transition runtime that shares resident state across
repeated local interventions, propagates complete declared dependency closures,
and falls back to full replay when locality disappears. Under its declared
semantics, incremental execution is from-scratch consistent. Explicit state
representation does not inherently or uniquely make computation faster.
Measured gains are conditional on locality, demanded outputs, resident-baseline
reuse, and implementation boundaries; equally capable conventional systems can
perform the same adaptive transition work.

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

The complete definitions, lemmas, proof by topological induction, nonlinear
extension, floating-point interpretation, and failure boundary are given in
[Formal Semantics and Conditional Exactness of State-Aware Transition
Reuse](papers/FORMAL_SEMANTICS_AND_CONDITIONAL_EXACTNESS.md).

## Why state awareness matters

Repeated intervention workloads often differ in only a small portion of an
otherwise shared system. SSPM makes that relationship explicit: keep the
baseline state resident, edit the target, compute the complete affected region,
and reuse everything outside it. The runtime can therefore avoid recomputing
unaffected work while retaining a correctness-preserving full-replay path.
That avoided work is an incremental-computation mechanism, not a capability
exclusive to SSPM or to state-space representation.

## Governed state projections

An operational system may expose different state projections for different
principals, purposes, policies, or revisions. In that setting, the projection
context is part of the declared execution state. A cached result is reusable
only when its state revision, policy revision, purpose, visibility boundary,
transition semantics, and exogenous inputs remain compatible.

Derived outputs must be computed from the authorized projection rather than
computed from unrestricted state and filtered afterward. A policy or visibility
change is therefore an intervention that can expand the affected closure or
force full replay. This extends the SSPM semantic discipline; the current
workbench does not yet establish policy-aware performance or a general security
theorem. See [Governed Operational State and Safe Reuse](research/GOVERNED_OPERATIONAL_STATE.md).

## What is not claimed

- SSPM does not model arbitrary systems as globally linear transformations.
- Resident state alone does not guarantee faster execution.
- Equivalent conventional dependency tracking and adaptive propagation can
  eliminate the executed-work distinction.
- Sparse results do not imply dense wins.
- The post-hoc V13 classifier is not an operational selector.
- Differential tests support bounded consistency; they are not universal
  formal verification.
- No CUDA/Triton, multi-GPU, energy, or production-service claim is made.
- No general authorization, noninterference, or policy-aware speed claim is
  made.
