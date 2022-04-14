#!/bin/bash
set -e
# git_link is the http git link of a repo
git_link=${1}
# update_dir is what is the folder path in website you want to copy to
update_dir=${2}
down_folder="/tmp/${update_dir}"
folder_base=$(basename ${update_dir})

# print info
echo ${update_dir}
echo ${git_link}

# clean temp
echo "Clean dwonload folder ${down_folder}"
rm -rf ${down_folder}
# clone repo
echo "Downloading ${update_dir} to \"${down_folder}\""
git clone ${git_link} ${down_folder}

# copy
echo "Update files"
cp -r ${down_folder}/vignettes/systemPipeRNAseq.Rmd ${update_dir}
mv ${update_dir}/systemPipeRNAseq.Rmd ${update_dir}/SPrnaseq.Rmd
cp -r ${down_folder}/vignettes/bibtex.bib ${update_dir}
echo "done"

# Update skeleton
echo "Update skeleton"
Rscript -e 'SPRthis::skeleton_update("vignettes/SPrnaseq.Rmd")'
Rscript -e 'roxygen2::roxygenise()'
Rscript -e 'pkgdown::build_site()'
rm -rf vignettes/SPrnaseq_cache



