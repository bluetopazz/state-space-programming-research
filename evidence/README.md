# Sanitized Public Evidence

`public_results.csv` contains normalized, aggregate results used by the public
archive. It excludes raw timing samples, private paths, host identifiers,
credentials, exact operational configuration, and application source code.

Each row records its timing boundary and disclosure limit. Ratios greater than
one mean the named preferred path was faster under that row's source experiment.
Resident-only and end-to-end workflow figures are intentionally separate.
Cross-project E2A rows preserve the fair-control counterevidence and are not
SSPM performance measurements.

The executable source of record is:
<https://github.com/bluetopazz/state-space-programming>
