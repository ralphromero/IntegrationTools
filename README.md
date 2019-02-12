# IntegrationTools
Useful scripts and tools for B2B integration.

## Tools
* UTF8File.ps1 - Modifies schemas and Biztalk maps so they are more visible to GIT.
* XSLHack.xsl - Used if you need to generate a custom xml envelope such as using no-namespace. Write out your custom envelope then apply the copy template which will recursively copy your source xml document. This can be used in a Biztalk map as long as there are no more validation components after this is applied.