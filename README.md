# SSPM: Resident Matrix Systems

**A public research archive for a matrix-executable approach to system state,
intervention, and counterfactual analysis.**

State-Space Programming Methodology (SSPM) investigates a bounded class of
dynamical programs whose typed state can remain resident in matrices while the
transition is separated into reusable affine structure and explicit nonlinear
closure:

~~~math
L_t = S_t A^T + U_t B^T + b,
\qquad
S_{t+1} = P_M\left(L_t + H_{ordered}(S_t,U_t,L_t,G_t)\right).
~~~

The base claim is operational:

> When state and reusable dependencies remain resident, a target change can be
> expressed as a state, input, constraint, or operator edit and propagated
> across many candidate scenarios without rebuilding an object or event model
> for each intervention.

This is not a claim that arbitrary nonlinear systems are globally linear. The
ordered residual retains nonlinearities, branches, graph coupling, and mode
logic. The useful region is where semantic equivalence holds, reusable structure
remains substantial, and intervention or analysis cost improves before residual
burden dominates.

## Current evidence

The completed V3 and Serving V1 cycles support a bounded representation and
intervention claim:

- exact agreement was maintained across the frozen LTI, bounded-queue, and
  controlled-Kuramoto workloads;
- affine coverage was 100% for LTI, 55.2% for the queue, and 37.5% for Kuramoto;
- SSPM exceeded reconstruction-heavy object, scalar, and equivalent event
  baselines at large scenario counts;
- resident intervention crossed the reconstruction baseline at 256 scenarios
  for every LTI and queue horizon tested;
- a source-informed serving model showed a 34.72x median advantage over object
  reconstruction for intervention replay;
- manual vectorization and fused Numba remained faster in residual-heavy
  workloads.

The conclusion is intentionally bounded: SSPM is presently supported as a
representation and analysis method, not as a universally faster numerical
kernel.

## Read the archive

- [Short paper: Resident State as an Executable System Representation](papers/resident-matrix-systems.pdf)
- [Paper source](papers/RESIDENT_MATRIX_SYSTEMS.md)
- [Canonical claim and boundaries](CLAIM.md)
- [Methods and completed evidence](METHODS_AND_EVIDENCE.md)
- [Claim-by-claim evidence ledger](EVIDENCE_LEDGER.md)
- [Limitations and open questions](LIMITATIONS.md)
- [Frozen V3 preregistration](research/preregistration_v3.md)
- [Sanitized aggregate results](evidence/public_results.csv)

## Figure atlas

- [Affine coverage across the workload ladder](figures/representation-coverage.png)
- [Resident intervention break-even](figures/intervention-break-even.png)
- [Residual-burden frontier](figures/residual-frontier.png)
- [Serving intervention comparison](figures/serving-interventions.png)

## Archive boundary

This repository publishes research writing, figures, preregistration, and
sanitized aggregate evidence. It does not publish the executable workbench, raw
timing traces, private machine paths, or application code. The private source of
record retains raw samples, seeds, checksums, manifests, and implementation
tests.

## Status

Public research archive, version 2.0, July 2026.

Completed locally on Apple Silicon. CUDA, Triton, x86, and dual-A6000
replication remain unmeasured.

## License

Documentation, figures, and sanitized data are released under
[CC BY-NC 4.0](LICENSE.md).
