# Data frame calculation format

## Catechins_format
### For 7 types of catechins and caffeine.
C(+), EC, GC, EGC, EGCG, Caf., ECG, CG

Since complicated copy and paste is not required, human error prevention and quick calculation are possible.  
Create a csv file in the following format

| label | n | C         | EC        | GC        | EGC       | EGCG      | Caf.      | ECG       | CG        | DW           |
|-------|---|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|--------------|
| STD   | 1 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD   | 2 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD   | 3 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| UNK   | 1 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK   | 2 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK   | 3 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |

## FAAs_format
### For 9 types of FAAs.  
Asp, Glu, Asn, Ser, Gln, Arg, Ala, Thea, GABA

Since complicated copy and paste is not required, human error prevention and quick calculation are possible.  
Create a csv file in the following format

| label | n | Asp             | Glu             | Asn             | Ser             | Gln             | IS              | Arg             | Ala             | Thea            | GABA            | DW           |
|-------|---|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|--------------|
| STD   | 1 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD   | 2 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD   | 3 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| UNK   | 1 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK   | 2 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK   | 3 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |