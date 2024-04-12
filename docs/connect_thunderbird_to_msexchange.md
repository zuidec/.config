# Connecting to MS Exchange

1. Open thunderbird and create a new email.
2. Click on advanced settings
3. Enter the following for incoming server:

```
    Server type: IMAP
    Server name: outlook.office365.com
    Port: 993
    User Name: 'YOUR@EMAIL.COM'
    Connection security: SSL/TLS
    Authentication method: OAuth2
```

4. Then enter the following for the outgoing server:

```
    Server Name: smtp.office.365.com
    Port: 465
    User Name: 'YOUR@EMAIL.COM'
    Connection security: SSL/TLS
    Authentication settings: OAuth2
```

5. At this point you can click done and you should be prompted to login!

