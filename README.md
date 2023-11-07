
# Bash Configuration

To set up bash configs, navigate to the .config/scripts directory and run  
the `bash_config.sh` script.


# NeoVIM Configuration


### Dependencies:  

Ensure the following are installed on your machine:  
* Python
* NeoVIM

In Ubuntu, a sufficiently new version of NeoVIM may not be available without  
building from source or adding an unstable repo:  

```

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

```

### Setup: 

Then, run the `nvim_config.sh` script from the .config/scripts directory 

Once that is complete, run `nvim .` and once in NeoVIM, run `PackerSync`.  
The plugins should install.  
