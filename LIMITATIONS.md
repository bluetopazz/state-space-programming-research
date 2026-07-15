# Limitations and Open Work

## Semantic boundary

Exact reuse depends on sufficient declared state and complete dependencies.
Hidden mutation, I/O, aliasing, side effects, or omitted reads invalidate the
premise. The source frontend is deliberately restricted and covers four grammar
families across a parameterized corpus, not general Python or arbitrary systems.

## Performance boundary

The method helps only when avoided work exceeds closure computation, compact
execution, reconstruction, and materialization costs. Dense closures remove the
advantage. V12 shows this directly: sparse compact rows often win while full
replay wins every tested dense row. Cold compilation and accelerator transfer
can dominate the decision budget.

Reported ratios are local and conditional. The 5.58x V13 figure is a resident
decision-path result; the 4.43x figure includes the measured end-to-end workflow
boundary. Neither is a universal application speedup.

## Selection boundary

V13's classifier uses realized closure after compact execution. It is a post-hoc
locality classifier, not a deployable selector that decides before paying the
compact cost. A practical runtime still needs a conservative pre-execution cost
model or inexpensive closure estimate.

## Governed-state boundary

The operational-state extension treats policy and visibility as declared
execution context. That rule prevents reuse across incompatible projections by
construction, but it has not yet been benchmarked across real policy engines,
multi-tenant systems, revocation races, or external side effects. It is not a
general noninterference proof. Authorization, durable commit, and audit remain
separate system responsibilities around the pure transition model.

## Evidence gaps

- V13 contains no dense rows and cannot independently validate fallback policy.
- Differential Dataflow integration is incomplete.
- Isolated reproduction did not pass as a completed gate.
- CUDA/Triton, multi-GPU, energy, and production-service behavior are unmeasured.
- Current external traces cover one workflow family and local CPU conditions.
- Policy-aware closure, projection changes, and revocation behavior are not part
  of the current performance evidence.

## Next falsification targets

The strongest next experiments are preregistered external application transfer,
pre-execution selection without realized closure, dense/sparse paired traces,
isolated reproduction, and hardware-portability measurements. Negative results
should continue to narrow the claim rather than be optimized away.
