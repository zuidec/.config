## Utility scripts for use with embedded ARM development

### Setup

Run `./create_symlinks` to create links to the scripts in ~/bin

### Utilities

* **stloader** - Use to flash a .elf or .bin firmware via ST-Link debugger
    ex: `stloader -f firmware.elf`

* **stdebug** - Use to start a GDB debugging session via ST-Link debugger
    ex: `stdebug -f firmware.elf`
