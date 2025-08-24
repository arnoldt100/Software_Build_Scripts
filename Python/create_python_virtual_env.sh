# This scripts builds a python virtual environment. 
#
#

# Declare and create the virtual environment directory.
declare -r venv_dir="${AT_PYTHON_VENV}"/lammps_mixed_precision
mkdir -p ${venv_dir}

#Change to the virtual environment directory and
#run the command to create the Python environment.
cd ${venv_dir}
python3 -m venv ./

# Activate the Python virtual environment.
source ./activate

# Below are commonly used python packages.
declare -A python_packages = ( [numpy] = "yes" 
                               [scipy] = "yes" 
                               [mypy] = "yes" )
