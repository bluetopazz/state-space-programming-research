# Methods and Completed Evidence

## Representation

The executable research workbench defines an AffineResidualProgram containing
typed state and input schemas, affine operators A, B, and b, an ordered residual,
projection and mode logic, coupling metadata, and provenance. A restricted
source compiler extracts supported affine terms and rejects hidden mutation,
I/O, ambiguous aliasing, loops, and unsupported side effects rather than
silently approximating them.

The same representation exposes rollout, composition, batched intervention,
local linearization, controllability, reachability, and model-predictive control
operations. Exact analytical claims are restricted to exact affine programs.

## Workload ladder

| Family | Role | Affine coverage | Analysis boundary |
| --- | --- | ---: | --- |
| Double integrator | Exact LTI reference | 100% | Exact composition, MPC, and zonotope reachability |
| Bounded queue/scheduler | Piecewise-affine infrastructure system | 55.2% | Scenario MPC and conservative branch-aware reachability |
| Controlled Kuramoto | Nonlinear graph system | 37.5% | Shooting MPC and local/empirical reachability only |
| Fluid serving scheduler | Source-informed infrastructure application | Residual-heavy | Counterfactual replay; not hardware-calibrated serving |

## Semantic gates

The frozen V3 corpus compares object, scalar-loop, manual NumPy, fused Numba,
event, and SSPM trajectories under identical initial states, controls, traces,
horizons, precision, and output boundaries. All tested trajectories agreed
within declared tolerances. Six mutation classes - coefficient, dependency,
ordering, threshold, projection, and mode - achieved 100% detection. Generated
exact-affine NumPy, Numba, Torch CPU, and C++20 paths agreed within maximum error
2.14e-14.

These are bounded differential results. They do not prove arbitrary source
program equivalence.

## Intervention and execution results

At 2,048 scenarios and horizon 20, SSPM was between 6.9x and 63.8x faster than
object/scalar baselines, and 13.9x faster than the equivalent queue-event
baseline. Resident intervention crossed reconstruction-heavy baselines at 256
scenarios for every LTI and queue horizon tested.

The stronger kernel claim failed. At the same scale, manual NumPy was roughly
8.3x faster than SSPM for LTI and 7.6x faster for queue; fused Numba was roughly
68.0x and 44.6x faster. Across 50 residual-frontier configurations, resident
SSPM won none against the equivalent manual-vectorized update.

## Serving study

A separately frozen cycle represented a source-informed fluid scheduler with
prefill/decode backlog, KV occupancy, admission, completion, drops, and
accumulated latency work. Across two process sessions and 5,280 retained timing
samples:

- one-step and 50-step semantic agreement passed with zero observed error;
- object reconstruction / affine-residual replay was 36.17x at the median for
  256 or more scenarios;
- object reconstruction / resident intervention replay was 34.72x at the
  median, ranging from 24.29x to 54.34x;
- manual vectorization beat generic affine-residual and resident replay in every
  measured cell.

The model is source-informed but not calibrated to vLLM, model kernels,
production traces, TTFT, TPOT, or SLO distributions.

## Control and reachability

Exact condensed LTI MPC, 512-candidate queue scenario MPC, and 256-candidate
Kuramoto shooting MPC selected equivalent policies and objectives across
traditional and SSPM execution, with no additional constraint violations.
Exact LTI zonotopes and conservative queue intervals contained every tested
trajectory. Kuramoto enclosures are explicitly local or empirical, not formal.

## Reproducibility boundary

The private executable source of record retains raw repetitions, deterministic
seeds, source checksums, controls, solver settings, package versions, and
machine manifests. This public archive exposes only aggregate, non-sensitive
evidence and the frozen V3 protocol. No result should be generalized beyond the
declared workloads and local hardware.
