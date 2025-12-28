SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/../../lazyenv.config"

echo "Copy DBeaver Scripts folder"
cp -r ${DBEAVER_SCRIPTS_DIR}/*.sql docker/postgres/scripts
echo "Done"