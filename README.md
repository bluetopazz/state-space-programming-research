# State-Space Programming Research

> A public research archive on matrix-executable system semantics for batched control and analysis.

State-Space Programming Methodology (SSPM) proposes that arbitrary system updates can be approached as transformations over a resident state matrix. The primary representation is an explicit affine core plus an ordered residual:

$$
L_t=S_tA^\top+U_tB^\top+b,
$$

$$
S_{t+1}=P_{\mathcal M}\left(L_t+H_{\mathrm{ordered}}(S_t,U_t,L_t)\right).
$$

The state remains resident as a matrix. An intervention changes a target state variable, control, parameter, constraint, or operator entry, then propagates the consequences through the shared transformation rather than rebuilding a collection of objects or events. Many candidate interventions can be stacked and evaluated as batched matrices.

The affine core exposes direct system operators. The residual preserves nonlinear expressions, branches, updated-state reads, masks, graph reductions, projection, and mode logic that cannot be moved into the matrix terms without changing semantics.

The flagship hypothesis is that a linear-primary representation of system state can preserve traditional update behavior while enabling faster and more dynamic manipulation: intervention, propagation, model-predictive control, reachability, composition, and batched scenario analysis. Heterogeneous execution and backend selection remain supporting infrastructure rather than the principal contribution.

“Arbitrary system” is a research proposal, not a current theorem. With an unrestricted residual, any update can be decomposed trivially; the nontrivial claim is that real systems retain enough affine structure for resident matrix manipulation to provide analytical and computational leverage before residual burden dominates.

The project starts from one rule:

> **No semantic equivalence, no speedup claim.**

## What the research asks

1. Can arbitrary traditional system updates be represented as a linear-primary transformation over resident state, with all irreducible behavior isolated explicitly in an ordered residual?
2. Does changing one target variable, control, or operator and propagating the transformation preserve the behavior of the traditional system model?
3. Does resident matrix state make many interventions, MPC candidates, compositions, and reachability queries faster and more dynamically reconfigurable than rebuilding object or event systems?
4. Where does increasing residual density, branch entropy, graph coupling, or updated-state dependence erase that advantage?

## V3 research program

The separately frozen [V3 preregistration](research/preregistration_v3.md) uses a three-level workload ladder:

1. an exact LTI mass-spring-damper or double-integrator system;
2. a piecewise-affine bounded queue and scheduler;
3. a controlled Kuramoto graph with nonlinear coupling isolated in the residual.

It evaluates representability, semantic preservation, representation ablations, dynamic intervention, MPC, reachability, the residual-burden frontier, and hardware portability. Unsupported mutation, I/O, aliasing, loops, and side effects must be rejected rather than silently approximated.

## Prior evidence: v1/v2

- Independent implementations agree numerically over the tested domains, including a portable C++ path for one family.
- A bounded catalog of 48 output-level semantic perturbations is detected by directed differential cases. This is a sensitivity result, not compiler verification.
- Across 28 synthetic crossover configurations, four execution modes become the observed winner at least once.
- A feature-aware planner selects the winner on six held-out configurations, but its preregistered median-regret gate ties a fixed MPS policy and is therefore **inconclusive**.
- A Hodgkin-Huxley transition using canonical 1952 parameters preserves one-step and 500-step behavior across NumPy, fused Numba, Torch CPU, and Torch MPS within declared tolerances.

These results remain published unchanged as supporting evidence for semantic discipline and heterogeneous execution. They do not yet validate the V3 compiler, control operators, reachability methods, or residual-burden claim.

## Read the archive

- [V3 preregistration: Matrix-Executable System Representation](research/preregistration_v3.md)
- [V1/V2 evidence report](papers/state-space-programming-methodology.pdf)
- [V1/V2 report source](papers/STATE_SPACE_PROGRAMMING_METHODOLOGY.md)
- [Methods and evidence](METHODS_AND_EVIDENCE.md)
- [Evidence ledger](EVIDENCE_LEDGER.md)
- [Limitations](LIMITATIONS.md)
- [Public aggregate evidence](evidence/public_results.csv)

## Archive boundary

This repository contains research writing, selected figures, and aggregate evidence only. It intentionally excludes implementation code, private notebooks, raw benchmark observations, environment-specific paths, and operational development history.

The executable workbench remains a separate engineering artifact. This archive is the stable public explanation of the research direction.

## Status

`public research archive / v1.2 / July 2026`

V3 is preregistered but not yet evidenced. Its acceptance gates must be evaluated before the planned report, *Matrix-Executable System Semantics for Batched Control and Analysis*, is presented as a result.

## License and contact

Original text, figures, and aggregate evidence are licensed under [CC BY-NC 4.0](LICENSE.md). Research inquiries and collaboration proposals can be sent through [Ronnie's Lab](https://ronnieslab.com/#contact).
