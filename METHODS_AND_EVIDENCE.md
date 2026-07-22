# Methods and Evidence

## Runtime contract

The executable workbench separates five responsibilities:

1. **State declaration.** The system state, controls, parameters, projections,
   and requested outputs are explicit.
2. **Dependency declaration.** Transition reads, writes, ordering, and local or
   graph coupling determine the affected closure.
3. **Resident baseline.** A from-scratch trajectory is retained as the reusable
   reference for repeated interventions.
4. **Compact execution.** The runtime recomputes the complete closure and
   reconstructs the demanded output.
5. **Fallback.** Full replay remains the correct path when locality vanishes,
   declaration is insufficient, or compact materialization is not cheaper.

The source frontend supports four grammar families across 60 parameterized
programs. This is a compiler corpus, not 60 independent applications. Nonlinear
products are residual rather than affine; unsupported mutation, I/O, aliasing,
unbounded loops, and side effects reject instead of silently approximating.

## Validation discipline

Every performance claim follows semantic validation. The workbench uses
one-step and trajectory differential tests, mutation tests, frozen manifests,
deterministic seeds, repeated process sessions, checksummed evidence, and named
materialization boundaries. The corrected affine classifier retains the frozen
V13 corpus result: 40 accepted and 20 rejected parameterized programs, with
zero maximum error among accepted cases.

## Evidence progression

| Cycle | Question | Public disposition |
| --- | --- | --- |
| V4 | Can resident incremental execution preserve a conventional transition? | Exactness supported; sparse CPU gains, dense losses |
| V5-V7 | Does the model transfer and can generated execution reduce overhead? | Transfer supported; fusion important; broad universality rejected |
| V8-V10 | Where is the locality boundary and how should execution be selected? | Closure is predictive, but selection and materialization costs matter |
| V11 | Does the result survive stronger JAX, Torch, GraphBLAS, and handwritten controls? | Sparse conditional gains; broad median and cold-start gates fail |
| V12 | Does the mechanism transfer to queue, thermal, and branching applications? | 14/16 sparse wins; dense full replay remains necessary |
| V13 | Does the complete method help on external workflow traces? | 21/24 end-to-end wins; dense coverage absent; selector is post-hoc |

## Application evidence

V12 tested traffic, dynamic queue, thermal diffusion, and branch-aware
intervention. Sparse rows produced 14 wins in 16 comparisons, with 4.36x median
speedup among winning rows. Dense full execution won all seven dense rows, with
a 3.44x median advantage. This paired result is central: the mechanism is
useful where dependency closure stays local, and the fallback is part of the
method rather than an exception to it.

V13 tested external Montage workflow traces under repeated local changes. The
resident decision path won 23 of 24 rows at a 5.58x median among wins. Including
the measured workflow boundary, 21 of 24 rows won at a 4.43x median among wins.
Those are different timing claims and are reported separately.

These measurements do not isolate explicit state representation as their
cause. In the separate E2A fair-control sequence, Case 14 failed its efficiency
gate at 1.2122x executed work. Case 15 then gave the conventional control
equivalent dependencies, value stabilization, and adaptive propagation;
executed work reached 1.0000x parity. SSPM's remaining empirical question is
when its explicit baseline, compact branch, validation, and materialization
organization lowers total cost under a declared workload boundary.
The source sequence is preserved in the
[E2A correction](https://github.com/bluetopazz/electrons-to-agents-research/blob/main/CORRECTION.md).

## Negative and deferred evidence

The broad V11 median was slower than the strongest compiled-batch baseline, cold JIT
cost was not recovered through the tested horizon, and GraphBLAS did not create
a universal win. V13 has no dense rows, so it cannot establish its own dense
fallback boundary. Differential Dataflow and isolated-container reproduction
were not completed. CUDA/Triton and multi-GPU evaluation remain deferred.

The V13 classifier uses realized closure after compact execution. It is useful
as a post-hoc locality analysis, but not as a pre-execution operational selector.

## Source of record

The [executable workbench](https://github.com/bluetopazz/state-space-programming)
contains implementation, tests, manifests, raw repetitions, checksums, papers,
and the complete v5-v13 result history. This archive contains only bounded,
sanitized public summaries.
