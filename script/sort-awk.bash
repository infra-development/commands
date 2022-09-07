# -F is for field separator
# Printing second column
# unique values
# default sorting
cat bdr_data.csv | awk -F, '{print $2}' | sort | uniq

# Print multiple columns. Column number 2, 3, 4
cat bdr_data.csv | awk -F, '{print $2, $3, $4}'

# Print number of fields in each line
cat bdr_data.csv | awk -F, '{print NF}'

# Print line number with number of fields per line
cat bdr_data.csv | awk -F, '{print NR, "--", NF}'