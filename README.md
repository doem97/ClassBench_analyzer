# Description

This is the analysis module for analysize the classbench.

The folder structure tree is:

    .
    ├── code                     # Code that developed to stable version
    |   ├── db_generator         # The db_generator outer tools
    |   └── parameter_files      # Seed files
    ├── data                     # Saves huge filter rulesets. It is ignored in git
    |   ├── fw_filters
    |   ├── acl_filters
    |   └── ipc_filters
    ├── developing               # Developing codes (usually `ipynb` files)
    └── script                   # Shell scripts and their log