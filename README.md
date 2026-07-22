# SSPM: State-Aware Computing

**A public research archive for exact modeled reuse, compact counterfactuals,
and explicit locality boundaries.**

State-Space Programming Methodology (SSPM) is a restricted state-transition
runtime. It keeps one declared system state resident, applies a local edit,
propagates the complete affected dependency closure, and falls back to full
replay when locality disappears.

> SSPM is a restricted state-transition runtime that shares resident state
> across repeated local interventions, propagates complete declared dependency
> closures, and falls back to full replay when locality disappears. Under its
> declared semantics, incremental execution is from-scratch consistent. Explicit
> state representation is not inherently or uniquely faster: measured gains
> depend on locality, output demand, baseline reuse, and implementation boundaries.

The research contribution is not a claim that every system is linear or that
incremental execution always wins. It is a bounded execution model for repeated
"what changes if this changes?" workloads where state, dependencies, and output
requirements are explicit.

The formal proof models an execution as a time-expanded dependency graph. It
shows by topological induction that complete affected-closure recomputation and
baseline reuse are equal to full replay on demanded outputs under the declared
semantic premises. The result applies to deterministic nonlinear nodes as well
as affine ones; it does not require global linearity.

## Read first

- [Short paper: State-Aware Computing](papers/state-aware-computing.pdf)
- [Paper source](papers/STATE_AWARE_COMPUTING.md)
- [Formal semantics and conditional exactness proof](papers/formal-semantics-and-conditional-exactness.pdf)
- [Formal proof source](papers/FORMAL_SEMANTICS_AND_CONDITIONAL_EXACTNESS.md)
- [Canonical claim and conditional exactness boundary](CLAIM.md)
- [Methods and evidence](METHODS_AND_EVIDENCE.md)
- [Claim-by-claim evidence ledger](EVIDENCE_LEDGER.md)
- [Limitations and open work](LIMITATIONS.md)
- [Sanitized aggregate evidence](evidence/public_results.csv)
- [Executable research workbench](https://github.com/bluetopazz/state-space-programming)

## Evidence in one view

- Exact reuse held under the declared state and dependency semantics in the
  tested traffic, queue, thermal, and workflow families.
- Compact branching and selective materialization reduced measured cost in
  bounded sparse V12 and V13 rows; the ratios remain in the evidence ledger.
- A fair E2A control reproduced the same adaptive transition work exactly,
  rejecting an intrinsic representation-speed reading.
  See the [E2A correction](https://github.com/bluetopazz/electrons-to-agents-research/blob/main/CORRECTION.md).
- Dense, cold-compilation, materialization-heavy, and several external-backend
  regimes did not support a general speed claim.
- The V13 locality classifier is post-hoc: it uses realized closure after
  compact execution and is not a deployable pre-execution selector.

## Figure atlas

- [State-aware execution model](figures/state-aware-execution.png)
- [Sparse and dense locality boundary](figures/locality-boundary.png)
- [Cross-application evidence](figures/application-evidence.png)
- [End-to-end workflow result](figures/workflow-result.png)

## Methodological extension

- [Governed operational state and safe reuse](research/GOVERNED_OPERATIONAL_STATE.md)

The extension asks what changes when the resident state is an authorized view
rather than one universal state. Its central rule is conservative: policy,
purpose, visibility, and revision belong to the declared execution context.
Changing any of them invalidates reuse outside a newly computed authorized
closure. This is a semantic design consequence of SSPM, not a new performance
or security result.

## Archive boundary

This repository is a code-free research surface. It contains writing, figures,
and sanitized aggregates, but no research implementation, raw timing logs,
private paths, host identifiers, credentials, or operational infrastructure.
The executable workbench is public separately and is the source of record for
tests, manifests, checksums, raw evidence, failed gates, and implementation
history.

## Status

Public research archive, version 3.1, July 2026. Results are local to the
declared CPU environments and workload boundaries. Differential Dataflow,
isolated reproduction, CUDA/Triton, dense V13 coverage, and cold-compilation
gates remain failed, deferred, or incomplete as documented.

## License

Documentation, figures, and sanitized data are released under
[CC BY-NC 4.0](LICENSE.md).
