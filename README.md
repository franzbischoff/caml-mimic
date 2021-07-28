**Status:** Archived. Code is provided as-is with no updates expected. Unfortunately I don't have the personal time to dedicate to maintaining this repo/responding to issues, nor access to the MIMIC dataset anymore, though I hope the model code and data splits can still be of use to the community.

# caml-mimic

Code for the paper [Explainable Prediction of Medical Codes from Clinical Text](https://arxiv.org/abs/1802.05695).

## Before starting

I made some changes in James' code. Mainly some fixes for using new libraries and some workarounds for not breaking on Windows.
I could not test WSL2 Cuda yet, so the only GPU environment I got so far was the native windows CUDA with `torch==1.9.0+cu111`.

The scripts inside the `predictions` folder were changed so you can run them from the script location and the PATH will be figured out.

It is advised to create an environment in the root of the project as follows:

`python -m venv .venv`

and update pip:

`python -m pip install –upgrade pip`

If you get trouble installing torch, try this site: <https://pytorch.org/get-started/locally/>

## Dependencies
Tested with Python 3.9x

Install the requirements as following:

`pip install -r requirements.txt`

On windows, use `requirements_win.txt` and if you want to use CUDA, install `requirements_win_cuda11.txt`

## Data processing

To get started, first edit `constants.py` to point to the directories holding your copies of the MIMIC-II and MIMIC-III datasets. Then, organize your data with the following structure:
```
mimicdata
|   D_ICD_DIAGNOSES.csv
|   D_ICD_PROCEDURES.csv
|   ICD9_descriptions (already in repo)
└───mimic2/
|   |   MIMIC_RAW_DSUMS
|   |   MIMIC_ICD9_mapping
|   |   training_indices.data
|   |   testing_indices.data
└───mimic3/
|   |   NOTEEVENTS.csv
|   |   DIAGNOSES_ICD.csv
|   |   PROCEDURES_ICD.csv
|   |   *_hadm_ids.csv (already in repo)
```
The MIMIC-II files can be obtained from [this repository](https://physionet.org/works/ICD9CodingofDischargeSummaries/).

Now, make sure your python path includes the base directory of this repository. Then, in Jupyter Notebook, run all cells (in the menu, click Cell -> Run All) in `notebooks/dataproc_mimic_II.ipynb` and `notebooks/dataproc_mimic_III.ipynb`. These will take some time, so go for a walk or bake some cookies while you wait. You can speed it up by skipping the "Pre-train word embeddings" sections.

## Saved models

To directly reproduce the results of the paper, first run the data processing steps above. We provide our pre-trained models for CAML and DR-CAML for the MIMIC-III full-label dataset. They are saved as `model.pth` in their respective directories. We also provide an `evaluate_model.sh` script to reproduce our results from the models.

## Training a new model

To train a new model from scratch, please use the script `learn/training.py`. Execute `python training.py -h` for a full list of input arguments and flags. The `train_new_model.sh` scripts in the `predictions/` subdirectories can serve as examples (or you can run those directly to use the same hyperparameters).

## Model predictions

The predictions that provide the results in the paper are provided in `predictions/`. Each directory contains:

* `preds_test.psv`, a pipe-separated value file containing the HADM_ID's and model predictions of all testing examples
* `train_new_model.sh`, which trains a new model with the hyperparameters provided in the paper.

To reproduce our F-measure results from the predictions, for example the CNN results on MIMIC-II, run `python get_metrics_for_saved_predictions.py predictions/CNN_mimic2_full`.

