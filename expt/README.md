# expt

## absolute.sh

This script is a example of [`fa_convert_eval_config`](https://github.com/nymwa/arteraro/tree/main/arteraro/fa_script)

## as for training

Please run `fa_train_pretrain` or `fa_train_finetune` under each directory with config.yaml.

You can train by running this.
```
for N in 0 1 2 3 4; do
	bash 0/finetune.sh
done
```

If you use grid engine and put sub_config.yaml under the directory, you can also run `finetune.sh`.

Here is a example of `sub_config.yaml`.
```
group: gaa50004
train:
	h_rt: 8:0:0
	node: rt_F
	num_node: 1
generate:
	h_rt: 0:20:0
	ensemble_h_rt: 1:0:0
score:
	h_rt: 0:10:0
rescore:
	h_rt: 2:0:0
rescore_score:
	h_rt: 0:10:0
```


## as for generation and evaluation

### if you use grid engine

Please run these commands one by one.

```
fa_generate_valid
bash generate_bea19_valid.sh
bash generate_conll_valid.sh
bash generate_fce_valid.sh
bash generate_jfleg_valid.sh
```

```
fa_score_valid
bash score_bea19_valid.sh
bash score_conll_valid.sh
bash score_fce_valid.sh
bash score_jfleg_valid.sh
fa_result_bea19; fa_result_conll; fa_result_fce; fa_result_jfleg
```

```
fa_generate_test
bash generate_conll_test.sh
bash generate_fce_test.sh
bash generate_jfleg_test.sh
```

```
fa_score_test
bash score_conll_test.sh
bash score_fce_test.sh
bash score_jfleg_test.sh
fa_result_conll; fa_result_fce; fa_result_jfleg
```

```
fa_ensemble
bash generate_bea19_ensemble.sh
bash generate_conll_ensemble.sh
bash generate_fce_ensemble.sh
bash generate_jfleg_ensemble.sh
bash score_bea19_valid_ensemble.sh
bash score_conll_valid_ensemble.sh
bash score_conll_test_ensemble.sh
bash score_fce_valid_ensemble.sh
bash score_fce_test_ensemble.sh
bash score_jfleg_valid_ensemble.sh
bash score_jfleg_test_ensemble.sh
fa_result_bea19; fa_result_conll; fa_result_fce; fa_result_jfleg
```

```
fa_rescore
bash rescore_bea19.sh
bash rescore_conll.sh
bash rescore_fce.sh
bash rescore_jfleg.sh
bash rescore_score_bea19_valid.sh
bash rescore_score_conll_valid.sh
bash rescore_score_conll_test.sh
bash rescore_score_fce_valid.sh
bash rescore_score_fce_test.sh
bash rescore_score_jfleg_valid.sh
bash rescore_score_jfleg_test.sh
fa_result_bea19; fa_result_conll; fa_result_fce; fa_result_jfleg
```

### if you do not use grid engine

Here is a example for `baseline/baseline`

```
fa_generate_valid
for L in bea19 conll fce jfleg; do
	for M in 0 1 2 3 4; do
		for N in `seq 11 50`; do
			bash $M/$L/valid/$N/generate.sh
		done
	done
done
```

```
fa_score_valid
for L in bea19 conll fce jfleg; do
	for M in 0 1 2 3 4; do
		for N in `seq 11 50; do
			bash $M/$L/valid/$N/score.sh
		done
	done
done
fa_result_bea19; fa_result_conll; fa_result_fce; fa_result_jfleg
```

```
fa_generate_test
bash 0/conll/test/(best epoch)/generate.sh
...
```

Please check best epoch by `fa_result_*`.


```
fa_score_test
bash 0/conll/test/(best epoch)/score.sh
...
fa_result_conll; fa_result_fce; fa_result_jfleg
```

```
fa_ensemble
bash ensemble/bea19/valid/generate.sh
bash ensemble/bea19/test/generate.sh
bash ensemble/conll/valid/generate.sh
bash ensemble/conll/test/generate.sh
bash ensemble/fce/valid/generate.sh
bash ensemble/fce/test/generate.sh
bash ensemble/jfleg/valid/generate.sh
bash ensemble/jfleg/test/generate.sh
bash ensemble/bea19/valid/score.sh
bash ensemble/conll/valid/score.sh
bash ensemble/conll/test/score.sh
bash ensemble/fce/valid/score.sh
bash ensemble/fce/test/score.sh
bash ensemble/jfleg/valid/score.sh
bash ensemble/jfleg/test/score.sh
fa_result_bea19; fa_result_conll; fa_result_fce; fa_result_jfleg
```

```
fa_rescore
bash ensemble/bea19/valid/rescore.sh
bash ensemble/bea19/test/rescore.sh
bash ensemble/conll/valid/rescore.sh
bash ensemble/conll/test/rescore.sh
bash ensemble/fce/valid/rescore.sh
bash ensemble/fce/test/rescore.sh
bash ensemble/jfleg/valid/rescore.sh
bash ensemble/jfleg/test/rescore.sh
for K in bea19 conll fce jfleg; do
	for L in 25 50 75 100 125 150 170 200 225 250 275 300 325 350 375 400 425 450 475 500; do
		bash $K/valid/score.$L.sh
		bash $K/test/score.$L.sh
	done
done
fa_result_bea19; fa_result_conll; fa_result_fce; fa_result_jfleg
```

