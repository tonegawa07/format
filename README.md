# Data frame calculation format

Since complicated copy and paste is not required, human error prevention and quick calculation are possible.  
煩雑なコピー＆ペーストが不要なため，人為的ミスの防止と迅速な計算が可能です．  

```R
cal_hplc(std_conc = "std濃度 (ppm)", Dil = "希釈倍率", Ext_vol = "抽出時溶媒量(mL)", file_name = "用意したcsvファイル名 (拡張子除く)")
```


## HPLC_format
### For catechins and caffeine.

Create a csv file in the following format  
以下の形式のcsvファイルを作成して下さい．  

- 必須条件
  - 1列目が"STD"あるいは"UNK"であること  
  - 2列目が"STD", "UNK"それぞれの通し番号であること
  - 3列目以降には定量に使用する値が入っていること
  - 最終列が秤量値であること


| label | n | C         | EC        | GC        | EGC       | EGCG      | Caf.      | ECG       | CG        | DW           |
|-------|---|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|--------------|
| STD   | 1 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD   | 2 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD   | 3 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| UNK   | 1 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK   | 2 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK   | 3 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |

### For FAAs.

Create a csv file in the following format  
以下の形式のcsvファイルを作成して下さい．  

- 必須条件
  - 1列目が"STD"あるいは"UNK"であること  
  - 2列目が"STD", "UNK"それぞれの通し番号であること
  - 3列目以降には定量に使用する値が入っていること
  - 最終列が秤量値であること

| label | n | Asp             | Glu             | Asn             | Ser             | Gln             | IS              | Arg             | Ala             | Thea            | GABA            | DW           |
|-------|---|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|--------------|
| STD   | 1 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD   | 2 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD   | 3 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| UNK   | 1 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK   | 2 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK   | 3 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |