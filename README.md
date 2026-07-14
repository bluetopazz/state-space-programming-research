# SSPM: State-Aware Computing

**A public research archive for exact local reuse across repeated system interventions.**

State-Space Programming Methodology (SSPM) is a restricted state-transition
runtime. It keeps one declared system state resident, applies a local edit,
propagates the complete affected dependency closure, and falls back to full
replay when locality disappears.

> SSPM is a restricted state-transition runtime that shares resident state
> across repeated local interventions, propagates complete declared dependency
> closures, and falls back to full replay when locality disappears. Under its
> declared semantics, incremental execution is from-scratch consistent; across
> multiple application families, sparse closures often reduce CPU decision cost
> while dense, cold, and materialization-heavy regimes do not.

The research contribution is not a claim that every system is linear or that
incremental execution always wins. It is a bounded execution model for repeated
"what changes if this changes?" workloads where state, dependencies, and output
requirements are explicit.

## Read first

- [Short paper: State-Aware Computing](papers/state-aware-computing.pdf)
- [Paper source](papers/STATE_AWARE_COMPUTING.md)
- [Canonical claim and conditional exactness boundary](CLAIM.md)
- [Methods and evidence](METHODS_AND_EVIDENCE.md)
- [Claim-by-claim evidence ledger](EVIDENCE_LEDGER.md)
- [Limitations and open work](LIMITATIONS.md)
- [Sanitized aggregate evidence](evidence/public_results.csv)
- [Executable research workbench](https://github.com/bluetopazz/state-space-programming)

## Evidence in one view

- Exact reuse held under the declared state and dependency semantics in the
  tested traffic, queue, thermal, and workflow families.
- Sparse V12 application rows won 14 of 16 comparisons, with a 4.36x median
  compact-to-full advantage among winning rows.
- V13 workflow experiments produced a 4.43x median end-to-end advantage across
  the 21 of 24 rows where the complete workflow won.
- Dense, cold-compilation, materialization-heavy, and several external-backend
  regimes did not support a general speed claim.
- The V13 locality classifier is post-hoc: it uses realized closure after
  compact execution and is not a deployable pre-execution selector.

## Figure atlas

- [State-aware execution model](figures/state-aware-execution.png)
- [Sparse and dense locality boundary](figures/locality-boundary.png)
- [Cross-application evidence](figures/application-evidence.png)
- [End-to-end workflow result](figures/workflow-result.png)

## Archive boundary

This repository is a code-free research surface. It contains writing, figures,
and sanitized aggregates, but no research implementation, raw timing logs,
private paths, host identifiers, credentials, or operational infrastructure.
The executable workbench is public separately and is the source of record for
tests, manifests, checksums, raw evidence, failed gates, and implementation
history.

## Status

Public research archive, version 3.0, July 2026. Results are local to the
declared CPU environments and workload boundaries. Differential Dataflow,
isolated reproduction, CUDA/Triton, dense V13 coverage, and cold-compilation
gates remain failed, deferred, or incomplete as documented.

## License

Documentation, figures, and sanitized data are released under
[CC BY-NC 4.0](LICENSE.md).
