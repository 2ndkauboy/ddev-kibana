setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=~/tmp/test-kibana
  mkdir -p $TESTDIR
  export PROJNAME=test-kibana
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME} --omit-containers=db
  ddev start -y >/dev/null
  ddev get ddev/ddev-elasticsearch >/dev/null
}

health_checks() {
  ddev exec "curl -s kibana:5601" | grep "/app/kibana"
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  ddev restart
  health_checks
}

@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get 2ndkauboy/ddev-kibana with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get 2ndkauboy/ddev-kibana
  ddev restart >/dev/null
  health_checks
}

