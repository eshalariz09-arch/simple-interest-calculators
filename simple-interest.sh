#!/bin/bash

# Simple Interest Calculator
# Formula: SI = (P * R * T) / 100

echo "===================================="
echo "   Simple Interest Calculator"
echo "===================================="

# Take input from user
read -p "Enter Principal Amount: " principal
read -p "Enter Rate of Interest (%): " rate
read -p "Enter Time (in years): " time

# Validate input (check if fields are empty)
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo "Error: All fields are required. Please try again."
    exit 1
fi

# Validate input (check if values are numeric)
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $principal =~ $re && $rate =~ $re && $time =~ $re ]]; then
    echo "Error: Please enter valid numeric values."
    exit 1
fi

# Calculate Simple Interest using bc (for decimal support)
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo "------------------------------------"
echo "Principal Amount   : $principal"
echo "Rate of Interest   : $rate%"
echo "Time Period         : $time years"
echo "------------------------------------"
echo "Simple Interest     : $simple_interest"
echo "Total Amount         : $total_amount"
echo "===================================="