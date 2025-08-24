# This scripts builds a pyhton virtual environment. 
#
declare -r venv_dir="${AT_PYTHON_VENV}"/lammps_mixed_precision

mkdir -p ${venv_dir}
cd ${venv_dir}
python3 -m venv ./
