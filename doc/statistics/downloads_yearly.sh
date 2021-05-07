gawk -f downloads_yearly.awk downloads.txt > downloads_yearly.txt
gnuplot downloadsyearly.gp
rm downloads_yearly.txt
