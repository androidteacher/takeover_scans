## This program should probably be used by no-one ever, but it works for me.

## amass_runner.sh
- requires amass installed and in your path
- back up previous data to found/old_amass_results/
- looks for domains in targets.txt and enumerates subdomains
- subdomains are written out to the found/ directory
## myamass
- used by amass_runner to run a simple active enum
## nuc_runner.sh
- runs nuclei
- creates a single list from all files in the found/ folder
- this list will be in current_check/current_list.txt
- instead of nuclei -l, a for loop is used to iterate through current_list.txt
- detect-all-takeovers.yaml template is the only one run
- as nuc_runner.sh checks each domain, output is written to results/results.txt
- after nuc_runner.sh checks each domain, that domain is deleted from the top of current_list.txt

##Use:
- place target domains in target.txt
- run amass_runner.sh
- run nuc_runner.sh
