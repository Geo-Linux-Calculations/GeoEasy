head -1 downloads.txt > downloads_last_12_months.txt
tail -12 downloads.txt >> downloads_last_12_months.txt
gnuplot downloads12.gp
rm downloads_last_12_months.txt
