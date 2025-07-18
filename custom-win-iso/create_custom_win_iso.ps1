### RUN THIS SCRIPT WITH ELEVATED PERMISSIONS

#Version: 1.0
#Date: Feb 18, 2023

#Author: Lee Woodhouse
#Email: admin@leewoodhouse.com
#Blog: https://www.leewoodhouse.com

#Description
#The purpose of this script is to build a customized Windows 11 unattended istallation ISO.
#The installation will also inject VMware tools
#PVSCI drivers are included in the ISO for an installation on top of "VMware paravirtual SCSI" controller.

# Prerequisites:
# 1) Windows 10/11
# 2) Windows ADK installed in the default installation path (Only Deployment Tools required).
#    Dowload at url https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
# 3) A Windows 11 ISO file.
# 4) An autounattend.xml answer file for the Windows 11 os image you will be installing.
#    The autounattend.xml must be configured to launch the installation of VMware tools.
#    Please see details in the blog post.
# 5) Identify the URL of the VMware tools ISO matching the version to be installed in Windows.
#    Get the URL at https://packages.vmware.com/tools/esx/index.html
# 6) Eject any already mounted ISOs before running this script

### MODIFIY THESE VARIABLES AS NEEDED ###

$SourceIsoPath = 'C:\Temp\ISO\en-us_windows_11_index_3_only_version_22h2_updated_jan_2023_x64_dvd_1e679bd9.iso'
$AutoUnattendXmlPath = 'C:\Temp\ISO\UNATTENDS\autounattend_upgrade.xml'
$VMwareToolsUrl = "https://packages.vmware.com/tools/esx/8.0p01/windows/VMware-tools-windows-12.1.5-20735119.iso"

#########################################

New-Item -ItemType Directory -Path C:\Custom_ISO
New-Item -ItemType Directory -Path C:\Custom_ISO\Final
New-Item -ItemType Directory -Path C:\Custom_ISO\UnattendXML

#Clean DISM mount point if any. Linked to the PVSCSI drivers injection.
Clear-WindowsCorruptMountPoint
Dismount-WindowsImage -path 'C:\Custom_ISO\Temp\MountDISM' -discard

#Delete Temp folder if it exists from previous run.
Remove-Item -Recurse -Force 'C:\Custom_ISO\Temp'

New-Item -ItemType Directory -Path C:\Custom_ISO\Temp
New-Item -ItemType Directory -Path C:\Custom_ISO\Temp\WorkingFolder
New-Item -ItemType Directory -Path C:\Custom_ISO\Temp\VMwareTools
New-Item -ItemType Directory -Path C:\Custom_ISO\Temp\MountDISM

#Prepare path for the Windows ISO destination file
$SourceIsoName = $SourceIsoPath.split("\")[-1]
$DestinationIsoPath = 'C:\Custom_ISO\Final\' +  ($SourceIsoName -replace ".iso","") + '_custom.iso'

#Download VMware Tools ISO  
$VMwareToolsIsoName = $VMwareToolsUrl.split("/")[-1]
$VMwareToolsIsoPath =  "C:\Custom_ISO\Temp\VMwareTools\" + $VMwareToolsIsoName 
(New-Object System.Net.WebClient).DownloadFile($VMwareToolsUrl, $VMwareToolsIsoPath) 

#Mount Source Windows ISO and get the assigned drive letter.
$MountSourceWindowsIso = mount-diskimage -imagepath $SourceIsoPath -passthru
$DriveSourceWindowsIso = ($MountSourceWindowsIso | get-volume).driveletter + ':'

#Mount VMware tools ISO and get the assigned drive letter.
$MountVMwareToolsIso = mount-diskimage -imagepath $VMwareToolsIsoPath -passthru
$DriveVMwareToolsIso = ($MountVMwareToolsIso  | get-volume).driveletter + ':'

#Copy the content of the Source Windows ISO to the working folder and remove the read-only attribtues.
copy-item $DriveSourceWindowsIso\* -Destination 'C:\Custom_ISO\Temp\WorkingFolder' -force -recurse
get-childitem 'C:\Custom_ISO\Temp\WorkingFolder' -recurse | %{ if (! $_.psiscontainer) { $_.isreadonly = $false } }

#Copy VMware Tools setup executable (for 64-bit) to tools folder on the finished ISO.
New-Item -ItemType Directory -Path 'C:\Custom_ISO\Temp\WorkingFolder\tools'
copy-item "$DriveVMwareToolsIso\setup64.exe" -Destination 'C:\Custom_ISO\Temp\WorkingFolder\tools'

### Inject PVSCSI Drivers in boot.wim and install.vim ###
$pvcsciPath = $DriveVMwareToolsIso + '\Program Files\VMware\VMware Tools\Drivers\pvscsi\Win8\amd64\pvscsi.inf'

#Modify all images in boot.wim
# ( ImageIndex 1 = Microsoft WIndows PE (amd64), ImageIndex 2 = Microsoft Windows Setup (amd64) )
Get-WindowsImage -ImagePath 'C:\Custom_ISO\Temp\WorkingFolder\sources\boot.wim' | foreach-object {
	Mount-WindowsImage -ImagePath 'C:\Custom_ISO\Temp\WorkingFolder\sources\boot.wim' -Index ($_.ImageIndex) -Path 'C:\Custom_ISO\Temp\MountDISM'
	Add-WindowsDriver -path 'C:\Custom_ISO\Temp\MountDISM' -driver $pvcsciPath -ForceUnsigned
	Dismount-WindowsImage -path 'C:\Custom_ISO\Temp\MountDISM' -save
}

#Modify all images in install.wim
# ( This operation will take a long time if there are lots of indexed images.
#   e.g. The business editions ISO can have as many as 10 images.
#   Windows 11 Education, Enterprise, Pro, Pro Education, Pro for Workstations etc. )
Get-WindowsImage -ImagePath 'C:\Custom_ISO\Temp\WorkingFolder\sources\install.wim' | foreach-object {
	Mount-WindowsImage -ImagePath 'C:\Custom_ISO\Temp\WorkingFolder\sources\install.wim' -Index ($_.ImageIndex) -Path 'C:\Custom_ISO\Temp\MountDISM'
	Add-WindowsDriver -path 'C:\Custom_ISO\Temp\MountDISM' -driver $pvcsciPath -ForceUnsigned
	Dismount-WindowsImage -path 'C:\Custom_ISO\Temp\MountDISM' -save
}

#Add the customized autaunattend.xml answer file.
#The answer file can be customized however you wish but must contain the section below in the specialize pass for the install of VMware tools.
#Note that the example below assumes the CD/DVD drive letter will be D:\

# <settings pass="specialize">
#         <component name="Microsoft-Windows-Deployment" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
#             <RunSynchronous>
#                 <RunSynchronousCommand wcm:action="add">
#                     <Path>D:\tools\setup64.exe /s /v"/qn REBOOT=R"</Path>
#                     <Order>1</Order>
#                 </RunSynchronousCommand>
#             </RunSynchronous>
#         </component>
#     </settings>

copy-item $AutoUnattendXmlPath -Destination 'C:\Custom_ISO\Temp\WorkingFolder\autounattend.xml'

#Use the contents of the working folder to build the custom windows ISO.
$OcsdimgPath = 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg'
$oscdimg  = "$OcsdimgPath\oscdimg.exe"
$etfsboot = "$OcsdimgPath\etfsboot.com"
$efisys   = "$OcsdimgPath\efisys.bin"

$data = '2#p0,e,b"{0}"#pEF,e,b"{1}"' -f $etfsboot, $efisys
start-process $oscdimg -args @("-bootdata:$data",'-u2','-udfver102', 'C:\Custom_ISO\Temp\WorkingFolder', $DestinationIsoPath) -wait -nonewwindow

#Optional Clean-up tasks
Dismount-DiskImage -ImagePath $SourceIsoPath
Dismount-DiskImage -ImagePath $VMwareToolsIsoPath
Remove-Item -Recurse -Force 'C:\Custom_ISO\Temp'

#Finished! Customized ISO located in C:\Custom_ISO\Final
