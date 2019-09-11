<#
.SYNOPSIS
   Installs a font or set of fonts.

.DESCRIPTION
   This function copies fonts to the system Fonts folder, adds the font registry
   keys and installs the font resources.  
  
   It only works with FNT, FON, OTF, TTC, TTF fonts.

   By default, it accepts only a single font file path, but the -multiple
   switch allows it to accept either a folder path or a list of font
   path names where it will attempt to install all of them.

.EXAMPLE
   Installs a single font
      PS C:\> Install-ChocolateyFont "FilePath\FontName.ext"

.EXAMPLE
   Installs all fonts in a folder
      PS C:\> Install-ChocolateyFont "FullFolderPath" -multi

.EXAMPLE
   Installs all fonts contained in a list of file paths
      PS C:\> Install-ChocolateyFont $ListOfFontFilePaths -multi

.INPUTS
   A string font or folder path or an array of strings of paths to font files.

.OUTPUTS
   Default:  "0" for success, "1" for failure
   With -multiple switch:  The number of fonts successfully installed.

.NOTES
   Aliased as Add-Font.
#>
function Install-ChocolateyFont { 
   param(
      [Parameter(Mandatory=$true)][string[]]$Paths,
      [Parameter(Mandatory=$false)][switch]$Multiple=$false
   )
   
   # Establish some basic starting points
   $successes = 0
   $FontsFolder = (New-Object -ComObject Shell.Application).namespace(0x14).self.path
   $fontRegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts'
   $FontFileTypes = @{
            '.fon' = ''
            '.fnt' = ''
            '.ttf' = ' (TrueType)'
            '.ttc' = ' (TrueType)'
            '.otf' = ' (OpenType)'
   }
   New-FontResourceType

   if (-not $Multiple) {
      If ($Paths.count -gt 1) {
         Throw "The '-multiple' switch must be used to install more than a single font."
      } elseif (Test-Path $Paths -PathType Container) {
         Throw "The '-multiple' switch must be used to install all fonts in a folder."
      }
      $FilePaths = $Paths
   } elseif (Test-Path $Paths -PathType Container) {
      $FilePaths = Get-ChildItem $Paths -Include ('*.fon','*.otf','*.ttc','*.ttf') -Recurse | 
                     Select-Object -ExpandProperty FullName
   } else {
      $FilePaths = $Paths
   }

   foreach ($Path in $FilePaths) {
      # Skip non-supported file types
      If (-not $FontFileTypes.ContainsKey(".$($path.split('.')[-1])")) { 
         Write-Warning "'$Path' is not a file of type $($FontFileTypes.keys -join ', ')."
         continue
      }
      # Skip non-existant files
      If (-not (Test-Path $Path)) {
         Write-Warning "File Path '$Path' does not exist!"
         continue
      }
   
      $File = Get-Item $Path
      $FolderObj = (New-Object -ComObject shell.application).namespace($File.directoryname)
      $FileObj = $FolderObj.Items().Item($File.Name)
      $FontName = $FolderObj.GetDetailsOf($FileObj,21)

      try {
         Copy-Item $File.FullName -destination $FontsFolder -Force

         $fontFinalPath = Join-Path $FontsFolder $File.Name
         $retVal = [FontResource.AddRemoveFonts]::AddFont($fontFinalPath)

         if ($retVal -eq 0) {
            Throw "Font resource, '$($File.FullName)', installation failed"
         } else {
            Write-Verbose "Font resource, '$($File.FullName)', installed successfully"
            Set-ItemProperty -Path "$($fontRegistryPath)" -Name "$FontName$($FontFileTypes.item($File.Extension))" -Value "$($File.Name)" -Type STRING -Force
            $successes++
         }
      } catch {
         Write-Warning "An error occured installing '$($File.FullName)'"
         Write-Warning "$($error[0].ToString())"
         $error.clear()
      }
   }
   
   If ($Multiple) {
      Return $successes
   } elseif ($successes) {
      Return 0
   } else {
      Return 1
   }
}

Set-Alias Add-Font Install-ChocolateyFont
