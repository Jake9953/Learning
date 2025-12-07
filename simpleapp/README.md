# Flight Status Checker - PowerShell Application

A PowerShell-based flight status checking application that integrates with multiple flight tracking APIs.

## Features

- **Interactive Menu** - User-friendly interface for checking flight statuses
- **Command-Line Mode** - Direct queries from PowerShell command line
- **Multiple API Providers** - Support for OpenSky, AeroDataBox, and Aviationstack
- **Demo Mode** - Test with sample flight data without API keys
- **Real-Time Tracking** - Live flight position, altitude, and status updates
- **Formatted Output** - Clean, readable display of flight information

## Prerequisites

- PowerShell 5.1 or higher
- Internet connection for API calls
- (Optional) API keys for premium features

## Usage

### Interactive Mode

```powershell
.\Flight-StatusChecker.ps1
```

This launches the interactive menu where you can:
1. Check flight status with demo data
2. Query real OpenSky API
3. List all available demo flights
4. Search by airline
5. Exit the application

### Command-Line Mode

```powershell
.\Flight-StatusChecker.ps1 -FlightNumber "AA100" -Airline "American"
```

### Parameters

- **FlightNumber** (optional) - Flight number to search (e.g., "AA100", "UA456")
- **Airline** (optional) - Airline code or name (e.g., "AA", "United")
- **ApiProvider** (optional) - "opensky" or "aerodatabox" (default: "opensky")

## API Providers

### OpenSky Network (Recommended - Free)
- **Endpoint:** https://api.opensky-network.org/api/flights/all
- **Pros:** Free, no API key required, real-time data
- **Cons:** Rate-limited for free tier
- **Data:** Aircraft position, altitude, velocity, heading

### AeroDataBox
- **Endpoint:** https://aerodatabox.p.rapidapi.com
- **Pros:** Comprehensive flight data, terminal/gate info
- **Cons:** Requires RapidAPI key (paid plans available)

### Aviationstack
- **Endpoint:** https://api.aviationstack.com/v1/flights
- **Pros:** Global coverage, reliable, free tier available
- **Cons:** API key required

## Configuration

Edit `config.json` to:
- Enable/disable API providers
- Set API keys
- Adjust timeout settings
- Configure caching behavior

## Demo Data

The application includes sample flight data for testing:

| Flight | Airline | Route | Status |
|--------|---------|-------|--------|
| AA100 | American Airlines | JFK → LAX | On Time |
| UA456 | United Airlines | ORD → SFO | Delayed |
| DL789 | Delta Airlines | ATL → MIA | Boarding |

## Output Examples

```
Flight: AA100
Airline: American Airlines
Route: JFK → LAX
Status: On Time
Aircraft: Boeing 777
Gate: B42 | Terminal: 4
Departure: 12/7/2025 2:45:00 PM
Arrival: 12/7/2025 8:00:00 PM
```

## Error Handling

- Network timeouts are caught and logged
- Invalid API responses are handled gracefully
- Missing configuration values default to safe settings
- User input validation prevents command injection

## Future Enhancements

- [ ] Export results to CSV/JSON
- [ ] Schedule periodic checks
- [ ] Email notifications for flight status changes
- [ ] Integration with airport information
- [ ] Multi-flight batch queries
- [ ] Historical flight data analysis

## License

Free to use and modify.

## Support

For issues or questions:
1. Check that your internet connection is active
2. Verify API credentials in `config.json`
3. Review PowerShell execution policy: `Get-ExecutionPolicy`

If needed, allow script execution:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
