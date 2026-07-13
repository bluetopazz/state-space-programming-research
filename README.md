# State-Space Programming Research

> A public research archive on semantic validation and heterogeneous execution for batched state-transition programs.

State-Space Programming Methodology (SSPM) studies a recurring systems problem: the same numerical update can be expressed as scalar code, array operations, compiled loops, tensor programs, or accelerator kernels, but timing those versions is meaningful only when they preserve the same transition and expose comparable movement costs.

The project starts from one rule:

> **No semantic equivalence, no speedup claim.**

SSPM represents a bounded program family as

$$
S_{t+1}=F(S_t,U_t,G_t,\Theta),
$$

where rows are entities, columns are named state variables, $U_t$ contains controls, and optional $G_t$ introduces coupling. A transition-family record identifies the state schema, inputs, update convention, numerical bounds, coupling class, and executable reference before an alternative backend enters measurement.

## What the research asks

1. Can explicit transition-family records make cross-backend comparisons more trustworthy?
2. Which workload features cause the fastest backend to change?
3. Can a small feature-aware planner select among CPU and accelerator paths without hiding transfer and residency?
4. Does the method transfer from synthetic stressors to a source-grounded nonlinear scientific model?

## Current evidence

- Independent implementations agree numerically over the tested domains, including a portable C++ path for one family.
- A bounded catalog of 48 output-level semantic perturbations is detected by directed differential cases. This is a sensitivity result, not compiler verification.
- Across 28 synthetic crossover configurations, four execution modes become the observed winner at least once.
- A feature-aware planner selects the winner on six held-out configurations, but its preregistered median-regret gate ties a fixed MPS policy and is therefore **inconclusive**.
- A Hodgkin-Huxley transition using canonical 1952 parameters preserves one-step and 500-step behavior across NumPy, fused Numba, Torch CPU, and Torch MPS within declared tolerances.

These results support a research method and a systems direction. They do not establish a universal compiler, formal equivalence, biological validation, or hardware-independent runtime superiority.

## Read the archive

- [Simplified research report](papers/state-space-programming-methodology.pdf)
- [Report source](papers/STATE_SPACE_PROGRAMMING_METHODOLOGY.md)
- [Methods and evidence](METHODS_AND_EVIDENCE.md)
- [Evidence ledger](EVIDENCE_LEDGER.md)
- [Limitations](LIMITATIONS.md)
- [Public aggregate evidence](evidence/public_results.csv)

## Archive boundary

This repository contains research writing, selected figures, and aggregate evidence only. It intentionally excludes implementation code, private notebooks, raw benchmark observations, environment-specific paths, and operational development history.

The executable workbench remains a separate engineering artifact. This archive is the stable public explanation of the research direction.

## Status

`public research archive / v1.0 / July 2026`

SSPM is an active research direction. The next credible gates are generated source-level mutations, enforced field contracts, broader held-out evaluation, independent measurement sessions, additional grounded transition families, and replication on x86 and CUDA-class hardware.

## License and contact

Original text, figures, and aggregate evidence are licensed under [CC BY-NC 4.0](LICENSE.md). Research inquiries and collaboration proposals can be sent through [Ronnie's Lab](https://ronnieslab.com/#contact).

