# Limitations and Open Questions

## Representation

SSPM targets fixed-shape, side-effect-free numerical transitions. It is not a
general Python compiler or a universal hybrid-systems language. An ordered
residual can preserve broad behavior, but a residual that performs nearly the
entire update provides little analytical or execution value.

## Performance

The present advantage is relative to object, scalar, and equivalent event
reconstruction at large scenario counts. Manual vectorization and fused Numba
remain faster for every measured residual-frontier and serving control cell.
Resident representation should therefore choose a fused lowering or direct
vectorized bypass when generic affine-plus-residual replay duplicates work.

All timing results are local to Apple Silicon. MPS was correct but slower than
the strongest CPU path in the measured LTI hardware workload. CUDA, Triton,
x86, energy, memory counters, and multi-GPU execution remain unmeasured.

## Semantics

Differential and mutation testing provide bounded empirical evidence, not a
formal proof. Unsupported effects are rejected, but the source compiler does
not yet generate optimized nonlinear residual kernels. Projection, modes, and
updated-state reads require explicit ordering discipline.

## Control and reachability

Exact composition, controllability, MPC, and reachability claims apply only to
exact affine systems. Queue reachability is conservative. Kuramoto reachability
is local or empirical and must not be presented as a formal global guarantee.

## Serving study

The serving workload is source-informed, not hardware calibrated. It contains
no transformer kernels or request-level percentile latency model. The executed
cycle measured 10% and 100% affected-row fractions, omitted the preregistered 1%
and 50% cases, and used a host end-to-end final-state boundary. Setup and
propagation costs are therefore not separately attributable.

## Next falsification target

The next decisive question is whether explicit residual compilation and fusion
can preserve SSPM's inspectable semantics while approaching strong vectorized
execution. Until then, SSPM should be described as a resident-state
representation and manipulation method with conditional runtime benefits.
