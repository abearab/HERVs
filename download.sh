download_dir=$1
mkdir -p $download_dir

for f in `cat download-links.txt`; do
    wget -P ${download_dir}/ $f;
done
