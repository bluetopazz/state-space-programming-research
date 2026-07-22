# Evidence Ledger

| Public statement | Source artifact | Validation | Disposition and boundary |
| --- | --- | --- | --- |
| Incremental execution matches full replay under declared dependencies | Workbench tests; V5-V13 validators | Differential tests and exactness gates pass | Supported only under the conditional runtime contract |
| Source frontend accepts 40 and rejects 20 parameterized programs | `artifacts/v13/summary.json` | Frozen corpus unchanged after nonlinear-product fix | Four supported grammar families, not 60 independent applications |
| Sparse V12 rows win 14/16 comparisons | `artifacts/v12/summary.json` | V12 evidence validator passes | Supported on tested CPU/application rows |
| V12 sparse winning-row median is 4.36x | `artifacts/v12/summary.json` | Reconciled from frozen summary | Compact/full ratio among wins, not an all-row mean |
| Dense full replay wins 7/7 V12 dense rows | `artifacts/v12/summary.json` | V12 evidence validator passes | Supports fallback requirement, not incremental speed |
| V13 resident decision wins 23/24 rows at 5.58x median among wins | `artifacts/v13/summary.json` | V13 evidence validator passes | Resident decision boundary only |
| V13 complete workflow wins 21/24 rows at 4.43x median among wins | `artifacts/v13/summary.json` | V13 evidence validator passes | End-to-end measured workflow boundary |
| V13 locality classifier is predictive before execution | `scripts/run_v13_experiments.py`; V13 summary | Audit shows realized closure is consumed after compact execution | Rejected as operational claim; retained as post-hoc analysis |
| Explicit state representation inherently reduces executed transition work | [E2A Cases 14-15 public correction](https://github.com/bluetopazz/electrons-to-agents-research/blob/main/CORRECTION.md) and frozen case summaries | Fair-control sequence reaches 1.0000 executed-work ratio after equal propagation capability | Rejected as representation-level causality |
| Explicit modeled state can retain storage or inspection differences after work parity | [E2A Case 15 public correction](https://github.com/bluetopazz/electrons-to-agents-research/blob/main/CORRECTION.md) | 0.1534 inspection ratio and 0.0525 branch-storage ratio under its bounded control | Cross-project supporting evidence; implementation-specific, not universal |
| External backends establish a universal speed advantage | `artifacts/v11/summary.json` | V11 evidence validator passes | Rejected; sparse subset wins but broad median loses |
| Cold compilation amortizes in tested range | `artifacts/v11/summary.json` | V11 evidence validator passes | Failed through the tested 10,000-decision range |
| Dense V13 behavior is established | `artifacts/v13/summary.json` | Coverage audit | Unmeasured; external traces produced no dense rows |
| CUDA/Triton or multi-GPU portability is established | V12/V13 accelerator records | Availability audit | Deferred or unavailable; no performance claim |
| Differential Dataflow and isolated reproduction are complete | V13 external/reproduction records | Gate audit | Failed or incomplete; preserved explicitly |

Raw measurements, host fields, machine paths, and operational details remain in
the private executable source of record and are not duplicated here.
