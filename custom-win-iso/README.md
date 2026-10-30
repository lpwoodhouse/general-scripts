# Custom Windows installation media — isolated lab example

autounattend.xml is a destructive lab template, not a production installation policy. It wipes and repartitions **Disk 0**, creates local administrator accounts, and bypasses hardware checks. Confirm the target disk and recovery plan before any use. Hardware-check bypasses do not establish vendor support.

The XML declares its wcm namespace and uses REPLACE_PRIVATELY_BEFORE_USE password placeholders. Replace them only in a protected local working copy, use unique temporary passwords and rotate them after installation. Do not commit filled-in answer files or installation media containing them. The placeholder is deliberately unusable as a deployment instruction.

XML parsing validates document structure only. Windows Setup behavior, image compatibility, VMware Tools path and partition layout require a disposable-VM installation test before reuse. No such installation was performed in this remediation.
