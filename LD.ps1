 function Get-FirstRecurringChar {
   [CmdletBinding()]
   param (
     [string]$foo
   )
# Ask for input if the user didnt add parameters
$foo = Read-Host -Prompt "Please enter characters" 

# Create empty array
$var = [ordered]@{} 
 
# Add Chars to Array
$foo.ToLower().ToCharArray() |
   foreach {
     if ($var.$_) {
       $var.$_ += 1
     }
     else {
       $var += @{$_ = 1}
     }

  }

$answer = $var.GetEnumerator() | Where-Object Value -gt 1 | Select-Object -First 1
# Print answer
echo $answer.Name
}
