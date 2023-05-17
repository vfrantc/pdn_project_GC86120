spin -DCPP_CODE -a promela_model.pml
gcc -o pan pan.c json_exporter.cpp -lstdc++ -I/path/to/nlohmann/json/single_include
