# ShodanScreenshotAutomatorVNC

Automatically grabs screenshots from open VNC servers discovered on Shodan. Images are saved in JPEG format with names following the pattern `$IP-$Port.jpg`.

![Example Results](exampleResultsRedacted.png)

## Preliminary setup

### Register on Shodan

 - Navigate to [shodan.io](https://account.shodan.io/register) and create an account
 - Go to [the Account page](https://account.shodan.io) and make note of your API key

### Install Dependancies

 - Shodan CLI: `$ pip install -U --user shodan`
 - vncsnapshot: `$ sudo apt install vncsnapshot`, `$ git clone https://github.com/shamun/vncsnapshot`, or your preferred way of aquiring the software

### Initialize Shodan

`$shodan init <YOUR API KEY HERE>`

## Execution

 - Get a list of VNC servers with a shodan query such as `'authentication disabled' 'RFB 003.008'`: `$ ./getScreenshots shodanparse "'authentication disabled' 'RFB 003.008'"`
 - Extract the screenshots with `$ ./getScreenshots shodanvnc <OUTPUT FILE FROM PREVIOUS COMMAND>`
