# Evidence Ledger

| Claim | Disposition | Public evidence | Boundary |
| --- | --- | --- | --- |
| Supported updates can be represented as affine structure plus explicit residual | Supported for frozen V3 corpus | 100% LTI, 55.2% queue, 37.5% Kuramoto affine coverage | Bounded side-effect-free subset; unsupported effects reject |
| Generated exact-affine lowerings preserve semantics | Supported | NumPy, Numba, Torch CPU, C++20 max error 2.14e-14 | Nonlinear residual code generation remains future work |
| One representation can support intervention, MPC, and reachability | Supported within tested families | Equivalent policies/objectives; containment gates pass | Exact claims restricted to affine LTI; queue conservative; Kuramoto local/empirical |
| Resident state improves large batched intervention over reconstruction-heavy models | Supported locally | V3 crossover plus 34.72x serving intervention median | Machine-local, synthetic/source-informed workloads |
| SSPM is faster than manual vectorization or fused kernels | Rejected in measured residual workloads | 0/50 residual-frontier wins; 0 serving control-cell wins | Fusion or direct vectorized bypass is required |
| SSPM provides universal finite-dimensional linearization | Explicitly rejected | Ordered residual and projection preserve nonlinearity | Arbitrary-system scope remains a research hypothesis |
| Serving study reproduces production inference behavior | Explicitly rejected | Fluid scheduler only | No model kernels, production traces, TTFT, TPOT, or SLO calibration |
| CUDA/Triton and dual-A6000 portability is established | Unmeasured | No public result | Requires a separately frozen hardware cycle |

Negative and contradictory outcomes are retained. A speed claim is valid only
after semantic agreement and only against the named baseline, workload size,
timing boundary, and hardware.
