#!/usr/bin/env -S uv run --verbose
# /// script
# requires-python = ">=3.9"
# dependencies = [
#     "polars",
#     "pyarrow",
# ]
# ///

import sys
import os.path
import polars as pl

def main():
    for f in sys.argv[1:]:
        if os.path.exists(f):
            df = pl.scan_parquet(f)
            df.sink_csv(f.removesuffix(".parquet") + ".csv")

if __name__=="__main__":
    main()
