$models = (
    ls -file .\app\models\ |
    %{
        if((gc -Raw $_.FullName) -match "class ([a-z]+) "){
            $className = $Matches[1];
            if ($className -ne "ApplicationRecord"){
                Write-Output " - name: $className"
                $excludes = @()
                do {
                    $input = (Read-Host "Please enter the excludes for $className")
                    if ($input -ne '') {
                       $excludes += $input
                    }
                } until ($input -eq '');
                if ($excludes.length -gt 0){
                    Write-Output "   exclude:"
                    $excludes | %{Write-Output "     - $_"}
                }
            }
        }
    }
    );
$appendix = ($models | out-string)
Write-Output ("models:`n$appendix") | Out-File .\config\fixturator.yml -Encoding ascii; cat .\config\fixturator.yml
