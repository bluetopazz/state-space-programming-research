# Governed Operational State and Safe Reuse

**Status:** Methodological extension
**Evidence tier:** Design implication; not a new benchmark result
**Public boundary:** Domain-neutral semantics only

## Research question

What must a state-aware runtime declare when the same underlying system is
observed through different authorization, purpose, or publication boundaries?

The short answer is that there is no single reusable state independent of its
governance context. A resident baseline is valid for a declared projection, not
for every possible reader or decision.

## Projected state

Let `S_t` be a sufficient system state at revision `t`. Let `a` identify an
authorization and purpose context, and let `P_a` be the corresponding state
projection:

~~~math
V_{a,t}=P_a(S_t).
~~~

A transition or decision program `F` operates on the projected state:

~~~math
Y_{a,t}=F(V_{a,t},u_t).
~~~

The safe order is therefore:

```text
declare context
-> project authorized state
-> derive dependencies and outputs
-> publish or propose
```

Computing `F(S_t, u_t)` first and removing restricted fields afterward is not
equivalent. Restricted inputs can affect counts, classifications, confidence,
missing-state indicators, candidate rankings, or other derived outputs even
when the original fields are absent from the final payload.

## Reuse key

For governed execution, the resident baseline key must bind at least:

```text
(state revision,
 policy revision,
 principal or capability context,
 declared purpose,
 transition semantics,
 exogenous-input revision,
 demanded-output contract)
```

Reuse is valid only when the new request is compatible with that key. A change
to policy, purpose, visibility, state revision, or output contract is an
intervention. The runtime must recompute its complete affected dependency
closure under the new projection. If compatibility or locality cannot be
established, it must replay from the newly projected state.

## Dependency consequences

This extension adds three practical rules to SSPM.

1. **Projection precedes derivation.** Dependencies are discovered over the
   state a computation is authorized to observe.
2. **Policy participates in invalidation.** A policy change can invalidate
   derived outputs even when the underlying source values did not change.
3. **Commit remains external.** State-aware reuse can produce a proposal or
   computed transition, but authorization, approval, durable side effects,
   audit, and rollback are responsibilities of the surrounding system.

These rules do not require the domain to be business software. They apply to
scientific instruments with role-scoped controls, infrastructure consoles with
tenant isolation, clinical workflows with purpose restrictions, and any other
system where the valid state surface depends on who is asking and why.

## Relation to conditional exactness

The SSPM exactness argument still applies if the authorized projection and its
context are declared as part of the transition semantics. The resident baseline
and full replay must use the same projection, parameters, exogenous inputs, and
output contract. Reusing values across incompatible policy contexts violates
those premises and is outside the theorem.

## Claim boundary

This note contributes a semantic extension, not an empirical result. It does
not claim:

- a universal authorization or information-flow theorem;
- measured policy-aware speedup;
- production multi-tenant safety;
- correctness in the presence of hidden state, undeclared side effects, or
  ambiguous policy composition;
- that all operational systems benefit from incremental execution.

The next falsification step is a preregistered paired-state study that changes
state and policy independently, verifies derived-output noninterference, tests
revocation and revision races, and measures when projection-aware reuse remains
cheaper than full replay.
