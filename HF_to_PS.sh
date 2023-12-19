apt-get update && apt-get install git-lfs -y
while getopts ":f:" option; do
  case $option in
    f)
      url="$OPTARG"
      git-lfs clone $url
      cd ${url##*/}
      pip install -U gradio 
      pip install -U transformers --no-dependencies
      pip install -r requirements.txt
      sed -i 's/.launch()/.launch(share=True)/' app.py
      python app.py --share 
      ;;
  esac
done