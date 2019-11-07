# Uninstall-Modules

PowerShell module to simplify uninstalling a batch of PowerShell modules by using glob patterns. This is especially useful for completely deleting PowerShell modules which install a lot of dependencies, such as the `Az` module.

# Usage

`Uninstall-Modules` comes with the command `Uninstall-Modules`. This command takes one required parameter `Glob`. This is a string which may contain wildcard characters to match multiple modules to be uninstalled. An optional flag `Force` can be passed to bypass the confirmation of uninstalling the modules. This also passes a `Force` flag to the underlying `Uninstall-Module` command.

# Example

`Uninstall-Modules -Glob Az.* -Force`

This forces the uninstall of all dependent packages which `Az` installs, after which only `Az` itself needs to be deleted.

# Installation

`Install-Module -Name Uninstall-Modules -Repository PSGallery`

