#!/bin/bash

SCRIPT="./mv_operations.sh"

PASS=0
FAIL=0

echo "========================================"
echo " Linux mv Command Automated Test"
echo "========================================"
echo

# ============================================================
# Test 1: Move a file
# ============================================================

echo "Test 1: Move a File"

rm -rf test_env
mkdir -p test_env/documents

echo "Test data" > test_env/file1.txt

(
    cd test_env || exit 1
    ../mv_operations.sh move
)

if [ -f "test_env/documents/file1.txt" ] && \
   [ ! -f "test_env/file1.txt" ]; then

    echo "PASS: File moved successfully"
    PASS=$((PASS + 1))

else

    echo "FAIL: File was not moved correctly"
    FAIL=$((FAIL + 1))

fi

rm -rf test_env

echo

# ============================================================
# Test 2: Rename a file
# ============================================================

echo "Test 2: Rename a File"

rm -rf test_env
mkdir -p test_env

echo "Test data" > test_env/file1.txt

(
    cd test_env || exit 1
    ../mv_operations.sh rename
)

if [ -f "test_env/file2.txt" ] && \
   [ ! -f "test_env/file1.txt" ]; then

    echo "PASS: File renamed successfully"
    PASS=$((PASS + 1))

else

    echo "FAIL: File was not renamed correctly"
    FAIL=$((FAIL + 1))

fi

rm -rf test_env

echo

# ============================================================
# Test 3: Move multiple files
# ============================================================

echo "Test 3: Move Multiple Files"

rm -rf test_env
mkdir -p test_env/documents

echo "File 1" > test_env/file1.txt
echo "File 2" > test_env/file2.txt

(
    cd test_env || exit 1
    ../mv_operations.sh multiple
)

if [ -f "test_env/documents/file1.txt" ] && \
   [ -f "test_env/documents/file2.txt" ] && \
   [ ! -f "test_env/file1.txt" ] && \
   [ ! -f "test_env/file2.txt" ]; then

    echo "PASS: Multiple files moved successfully"
    PASS=$((PASS + 1))

else

    echo "FAIL: Multiple files were not moved correctly"
    FAIL=$((FAIL + 1))

fi

rm -rf test_env

echo

# ============================================================
# Test 4: Move a directory
# ============================================================

echo "Test 4: Move a Directory"

rm -rf test_env
mkdir -p test_env/documents
mkdir -p test_env/source_dir

echo "Directory test" > test_env/source_dir/test.txt

(
    cd test_env || exit 1
    ../mv_operations.sh directory
)

if [ -d "test_env/documents/source_dir" ] && \
   [ -f "test_env/documents/source_dir/test.txt" ] && \
   [ ! -d "test_env/source_dir" ]; then

    echo "PASS: Directory moved successfully"
    PASS=$((PASS + 1))

else

    echo "FAIL: Directory was not moved correctly"
    FAIL=$((FAIL + 1))

fi

rm -rf test_env

echo
echo "========================================"
echo " Test Summary"
echo "========================================"
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "All tests passed!"
    exit 0
else
    echo "Some tests failed."
    exit 1
fi
