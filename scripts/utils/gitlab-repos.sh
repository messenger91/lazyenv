SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.conf"

for URL in "${GITLAB_REPOS[@]}"
do
    URI=${URL:19}
    SPLITS=(${URI//// })
    PROFILE=${SPLITS[0]}
    REPO=${SPLITS[1]}
    cd $GITLAB_FOLDER

    if [ -d $GITLAB_FOLDER/$PROFILE ]; then
    cd $GITLAB_FOLDER/$PROFILE

        if [ -d $GITLAB_FOLDER/$PROFILE/$REPO ]; then
        echo "[PULL] $URL"
        cd $GITLAB_FOLDER/$PROFILE/$REPO
        git pull
        fi

        if [ ! -d $GITLAB_FOLDER/$PROFILE/$REPO ]; then
        echo "[CLONE] $URL"
        git clone git@gitlab.com:$PROFILE/$REPO.git
        fi

    fi

    if [ ! -d $GITLAB_FOLDER/$PROFILE ]; then
    echo "[CLONE] $URL"
    mkdir $GITLAB_FOLDER/$PROFILE
    cd $GITLAB_FOLDER/$PROFILE
    git clone git@gitlab.com:$PROFILE/$REPO.git
    fi

done
