# Install miniconda for python env management
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe -o miniconda.exe
start /wait "" miniconda.exe /S /AddToPath=1 /RegisterPython=1 /D=%UserProfile%\Miniconda3
del miniconda.exe

conda update conda
conda config --add create_default_packages ipykernel

# Install Scoop CLI installer. Like Homebrew for Windows.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install pipx for global python cli apps
scoop install pipx
pipx ensurepath
