cat found/*  > current_check/unsorted.txt
cat current_check/unsorted.txt | sort -u | uniq > current_check/current_list.txt
now=`date +"%Y-%m-%d-at-%H:%M"`
cp current_check/current_list.txt current_check/previous_lists/current_list-${now}.txt
#rm found/*
for x in $(cat current_check/current_list.txt); 
do
nuclei -u $x -t detect-all-takeovers.yaml | tee -a results/results.txt
sed -i "s/$x//g" current_check/current_list.txt
sed -i '/^$/d' current_check/current_list.txt
done

