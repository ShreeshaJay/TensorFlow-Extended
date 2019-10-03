# TensforFlow Extended (2 courses)
 
![Powered by Jupyter Logo](https://cdn.oreillystatic.com/images/icons/powered_by_jupyter.png)

This project contains the Jupyter Notebooks and the associated Dockerfile for Armen Donigian's _TensorFlow Extended - Data Validation and Transform_ and _TensorFlow Extended - Model Build, Analysis and Serving_. It contains both the exercises (/notebooks) and the solutions (/solutions), as well as any data or files needed (/data).

This is a public repository so there is no need to create an account to download its contents. To download the source code from this page, click the 'Cloud' icon on the top right hand, above where the latest commit is detailed.

It's recommended that you use [Google Colab](https://colab.research.google.com) to import the following notebooks located in the `notebooks` directory:

+ `notebooks/V2_Part1_Data_Validation.ipynb`
+ `notebooks/V2_Part2_Data_Transform.ipynb`
+ `notebooks/V2_Part3_Model_Build_Analysis.ipynb`
+ `notebooks/V2_Part4_TensorFlow_Serving.ipynb`


To download via git from your preferred terminal application, type: 

```git clone https://resources.oreilly.com/live-training/tensorflow-extended```

Welcome to our Live Training course for **TensorFlow Extended: Data Validation and Transform**. The second part of this training is titled **TensorFlow Extended: Model build, analysis, and serving**.

In this training, we will cover the following:

## TensorFlow Data Validation

[TensorFlow Data Validation](https://github.com/tensorflow/data-validation) (TFDV) is a library for exploring and validating machine learning data. It is designed to be highly scalable and to work well with TensorFlow and TensorFlow Extended (TFX).

TF Data Validation:

+ Compute summary statistics for train/test/validation data in a scalable way. While `scikit-learn` is limited to datasets which fit into RAM, this is not a concern for TFDV.
+ Includes a viewer for data distributions and statistics (integration with [Facets](https://pair-code.github.io/facets/) 
+ Automatic schema inference 
+ Schema generation includes description of expectations about data (like required values, ranges, and vocabularies)
+ A schema viewer to help you inspect the schema
+ Anomaly detection to identify anomalies (missing features, out-of-range values, or wrong feature types)
+ An anomalies viewer to see which features have anomalies
+ TFDV can help validate new data for inference to ensure no bad features are processed
+ TFDV can help validate that your model has been trained on part of the decision surface for new data during inference 
+ TFDV can help validate data after it's been transformed by TF Transform to ensure nothing unexpected has occurred to the data

We will cover the following:

```
1. Review of TF Data Validation (TFDV)

2. Dataset Review, compute & visualize statistics

3.  statistics

4. Infer Schema

5. Train vs Evaluation set data errors

6. Annomolies & Skew

7. Freeze Schema
```

## TensorFlow Transform

#### The Feature Engineering Component of TensorFlow Extended (TFX)

[TensorFlow Transform](https://github.com/tensorflow/transform) is a library for preprocessing data with TensorFlow. `tf.Transform` is useful for data that requires a full-pass, such as:

+ Normalize an input value by mean and standard deviation.

+ Convert strings to integers by generating a vocabulary over all input values.

+ Convert floats to integers by assigning them to buckets based on the observed data distribution.

+ TensorFlow has built-in support for manipulations on a single example or a batch of examples. `tf.Transform` extends these capabilities to support full-passes over the example data.

We will export the output of `tf.Transform` as a TensorFlow graph to use for training and serving. Using the same graph for both training and serving can prevent skew since the same transformations are applied in both stages.

We will cover the following:

```
1. Review of TF Transform (TFT)

2. Dataset Review & Define Raw Features

3. Run steps from previous TF Data Validation pipeline

4. Pre-Process with tf.Transform

5. Transform the data using Apache Beam Pipeline

6. Create an Input Function for the Training

7. Create an Input Function for Serving

8. Define an Estimator 

9. Train, Evaluate, and Export our model
```

## TensorFlow Model Analysis

[TensorFlow Model Analysis (TFMA)](https://github.com/tensorflow/model-analysis) is an open source library for evaluating TensorFlow models. You can use TFMA to export a model's evaluation graph into an `EvalSavedModel`. The `EvalSavedModel` contains additional information which allows TFMA to compute the same evaluation metrics defined in the model in a distributed manner over a large amount of data and user-defined slices.

We will cover the following:

```
1. Review of TF Model Analysis (TFMA)

2. Dataset Review & Define Raw Features

3. Run steps from previous TF Data Validation pipeline

4. Construct an Apache Beam Pipeline

5. Define Data SliceSpecs for Model Analysis

6. Run TFMA

7. Show data sliced along feature column pickup_hour

8. show metrics sliced by COLUMN_CROSS_VALUE_SPEC 

9. Show overall metrics
```

## TensorFlow Serving

[TensorFlow Serving](https://www.tensorflow.org/tfx/serving/) is an open-source software library for serving machine learning models. Here are some features of TF Serving:

1. high performance model hosting system. Designed for primarily for synchronous inference but also supports bulk-processing (e.g. map-reduce) in production enviornments. 

2. TF Serving includes support for model lifecycle management. Multiple models, or multiple versions of the same model can be served simultaneously.
 
3. Facilitates canarying new versions, migrating clients to new models or versions, and A/B testing experimental models.

4. TensorFlow Serving comes with a scheduler that groups individual inference requests into batches for joint execution on a GPU, with configurable latency controls.

5. TensorFlow Serving has out-of-the-box support for TensorFlow models. 

6. In addition to trained TensorFlow models, TF servables can include other assets needed for inference such as embeddings, vocabularies and feature transformation configs, or even non-TensorFlow-based machine learning models.

7. The architecture is highly modular. You can use some parts individually (e.g. batch scheduling) or use all the parts together.  
 
We will cover the following:

```
1. TF Serving Overview & Architecture

2. Review & launch model server

3. Predict using Tensorflow Serving
```

## Dataset

The dataset will be using throughout this session will be the New York Yellow Cab dataset available via [BigQuery public datasets](bigquery-public-data:new_york.tlc_yellow_trips_2016).



## Running Jupyter Locally via Docker

We've shared the same Dockerfile we use for our JupyterHub session in this repository, to make sure you can run all of these notebooks in your own time, on your own machine. This isn't required during class, but can be useful for learning once the session is over.

You will need to have Docker installed on your system to create images and run containers. You can find the installation steps for all platforms on the company's [website](https://docs.docker.com/install/)
.

1) Clone the repository for the class either using the UI or your terminal (see above).

2) Once you have Docker installed, type the following on your terminal to create a Docker image: `docker build -t NAME .` (replace `NAME`, here and in next step, with what you want to call it. Note the period)

3) That will take a little while to create a Docker image, but once completed, you can run your server with the following:
`docker run -p 8888:8888 NAME`

4) Head to `localhost:8888` in your browser and you will be able to access the Jupyter Notebooks.
