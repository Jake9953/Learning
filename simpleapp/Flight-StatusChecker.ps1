# Flight Status Checker - PowerShell Application

param(
    [Parameter(Mandatory=$false)]
    [string]$FlightNumber,
    [Parameter(Mandatory=$false)]
    [string]$Airline
)

function Get-FlightStatusDemo {
    param([string]$FlightNumber, [string]$Airline)
    
    $demoFlights = @(
        @{Callsign="AA100"; Airline="American Airlines"; RouteFrom="JFK"; RouteTo="LAX"; Status="On Time"; Aircraft="Boeing 777"; Gate="B42"; Terminal="4"},
        @{Callsign="UA456"; Airline="United Airlines"; RouteFrom="ORD"; RouteTo="SFO"; Status="Delayed"; Aircraft="Boeing 787"; Gate="C5"; Terminal="1"},
        @{Callsign="DL789"; Airline="Delta Airlines"; RouteFrom="ATL"; RouteTo="MIA"; Status="Boarding"; Aircraft="Airbus A320"; Gate="A12"; Terminal="S"}
    )
    
    return $demoFlights | Where-Object { $_.Callsign -like "*$FlightNumber*" -or $_.Airline -like "*$Airline*" -or [string]::IsNullOrEmpty($FlightNumber) }
}

function Show-FlightMenu {
    do {
        Clear-Host
        Write-Host "Flight Status Checker - Main Menu" -ForegroundColor Cyan
        Write-Host "1. Check Flight"
        Write-Host "2. List All"
        Write-Host "3. Exit"
        $choice = Read-Host "Select (1-3)"
        
        switch ($choice) {
            "1" { $num = Read-Host "Flight number"; Show-Results (Get-FlightStatusDemo $num) }
            "2" { Show-Results (Get-FlightStatusDemo "") }
            "3" { exit }
        }
        Read-Host "Press Enter"
    } while ($true)
}

function Show-Results {
    param([PSObject[]]$FlightData)
    if ($FlightData.Count -eq 0) { Write-Host "No flights found" -ForegroundColor Yellow; return }
    Write-Host ""
    foreach ($f in $FlightData) {
        Write-Host "Flight: $($f.Callsign) - $($f.Airline)" -ForegroundColor Cyan
        Write-Host "Route: $($f.RouteFrom) to $($f.RouteTo)"
        Write-Host "Status: $($f.Status) | Aircraft: $($f.Aircraft)"
        Write-Host "Gate: $($f.Gate) | Terminal: $($f.Terminal)"
        Write-Host "---"
    }
}

if ([string]::IsNullOrEmpty($FlightNumber)) {
    Show-FlightMenu
} else {
    Write-Host "Flight: $FlightNumber" -ForegroundColor Cyan
    Show-Results (Get-FlightStatusDemo $FlightNumber $Airline)
}
