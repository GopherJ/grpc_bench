#!/bin/sh

RESULT_DIR=results/$(date "+%y%d%mT%H%M%S")

# Rust Tonic benchmark
./run_single_bench.sh rust_tonic_test "${RESULT_DIR}"

# Rust Thruster benchmark
./run_single_bench.sh rust_thruster_test "${RESULT_DIR}"

# Go grpc benchmark
./run_single_bench.sh go_grpc_test "${RESULT_DIR}"

# Cpp grpc benchmark
./run_single_bench.sh cpp_grpc_test "${RESULT_DIR}"

# Ruby benchmark
./run_single_bench.sh ruby_grpc_test "${RESULT_DIR}"

# Python grpc benchmark
./run_single_bench.sh python_grpc_test "${RESULT_DIR}"

# Scala akka benchmark
./run_single_bench.sh scala_akka_test "${RESULT_DIR}"

# Java grpc benchmark
./run_single_bench.sh java_grpc_test "${RESULT_DIR}"

# Kotlin grpc benchmark
./run_single_bench.sh kotlin_grpc_test "${RESULT_DIR}"

# Crystal grpc benchmark
./run_single_bench.sh crystal_grpc_test "${RESULT_DIR}"

# Dart grpc benchmark
./run_single_bench.sh dart_grpc_test "${RESULT_DIR}"

# Java Micronaut benchmark
./run_single_bench.sh java_micronaut_test "${RESULT_DIR}"

# Swift grpc benchmark
./run_single_bench.sh swift_grpc_test "${RESULT_DIR}"

# Lua grpc benchmark
./run_single_bench.sh lua_grpc_test "${RESULT_DIR}"

# Node.js grpc benchmark
./run_single_bench.sh node_grpc_test "${RESULT_DIR}"

# PHP benchmark
./run_single_bench.sh php_grpc_test "${RESULT_DIR}"

# C# benchmark
./run_single_bench.sh csharp_grpc_test "${RESULT_DIR}"

# Elixir benchmark
./run_single_bench.sh elixir_grpc_test "${RESULT_DIR}"

# Java AoT benchmark
./run_single_bench.sh java_aot_test "${RESULT_DIR}"

echo "-----"
echo "Benchmark finished. Detailed results are located in: ${RESULT_DIR}"

docker run --name analyzer --rm \
  -v "${PWD}"/analyze:/analyze:ro \
  -v "${PWD}"/"${RESULT_DIR}":/reports:ro \
  ruby:2.7-buster ruby /analyze/results_analyze.rb reports
