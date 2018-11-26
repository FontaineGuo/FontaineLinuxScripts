## Test for python
```
python removeRedEyes.py
```

## Test C++ code
```
# compile
# There are backticks ( ` ) around pkg-config command not single quotes
g++ -std=c++11 removeRedEyes.cpp `pkg-config --libs --cflags opencv` -o removeRedEyes
# run
./removeRedEyes
```