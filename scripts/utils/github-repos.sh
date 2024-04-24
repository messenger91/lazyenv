
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../.env"


## now loop through the above array
for URL in "${GITHUB_REPOS[@]}"
do
    URI=${URL:19}
    SPLITS=(${URI//// })
    PROFILE=${SPLITS[0]}
    REPO=${SPLITS[1]}
    cd $GITHUB_FOLDER

    if [ -d $GITHUB_FOLDER/$PROFILE ]; then
    cd $GITHUB_FOLDER/$PROFILE

        if [ -d $GITHUB_FOLDER/$PROFILE/$REPO ]; then
        echo "[PULL] $URL"
        cd $GITHUB_FOLDER/$PROFILE/$REPO
        git pull
        fi

        if [ ! -d $GITHUB_FOLDER/$PROFILE/$REPO ]; then
        echo "[CLONE] $URL"
        git clone git@github.com:$PROFILE/$REPO.git
        fi
    
    fi

    if [ ! -d $GITHUB_FOLDER/$PROFILE ]; then
    echo "[CLONE] $URL"
    mkdir $GITHUB_FOLDER/$PROFILE
    cd $GITHUB_FOLDER/$PROFILE
    git clone git@github.com:$PROFILE/$REPO.git
    fi

done